-- This script modifies a built-in banner package that's called when a new user is created.

create or replace PACKAGE GOKTPTY
AS
--
-- FILE NAME..: goktpty.sql
-- RELEASE....: 5.2
-- OBJECT NAME: GOKTPTY
-- PRODUCT....: GENERAL
-- USAGE......: Packaged functions which generate External User IS and PIN Reset
-- COPYRIGHT..: Copyright (C) SCT Corporation 2001. All rights reserved.
--
-- DESCRIPTION:
--
--    This package generates External User ID and PIN Reset
--    values for the GOBTPAC table.
--
--  Cursors:
--
--   None
--
--  Functions:
--
-- F_Character_Filter
--  This function removes any character that is not a lower case alphabetic
--  character from the string passed to it.
--
-- F_Check_External_User
--  This function checks to see if the external user ID is already in use on a
--  gobtpac row or a gorpaud row which does not belong to the current PIDM
--
-- F_Generate_External_User
--  This function generates an unique External User ID to be stored on the
--  gobtpac table.
--
-- F_KVCC_Gen_ID_Initials
--   This is a KVCC custom function for account creation of full-time
--   staff, faculty, and part-time staff for LDI events.
--
-- F_KVCC_Gen_ID_Full_SPRIDEN
--   This is a KVCC custom function for account creation of part-time faculty
--   and students for LDI events.
--
-- F_Reset_Pin
--  This function will generate PIN based on Birthdate or random value.
--  This function uses Pin Preferences table ( GUBPPRF). If Birthdate
--  is null then last six character of ID will be used.  If it can not
--  generate six character numeric PIN then NULL value will be return.
--
-- F_Validate_Pin
-- This function is validate Pin value.
--
--  Procedures:
--
-- P_Insert_Gobtpac
-- This procedure will create a third party access record.
--
-- DESCRIPTION END
--

FUNCTION F_Character_Filter(name_in VARCHAR2)
       RETURN VARCHAR2;
   pragma restrict_references(F_Character_Filter, wnds,wnps);

FUNCTION F_Check_External_User(PIDM IN NUMBER, USERID IN VARCHAR2) RETURN VARCHAR2;

FUNCTION F_KVCC_Check_External_User(PIDM IN NUMBER, USERID IN VARCHAR2) RETURN VARCHAR2;

   pragma restrict_references(F_Check_External_User, wnds,wnps);
   pragma restrict_references(F_KVCC_Check_External_User, wnds,wnps);

-- pc, 2011-4-22, function name is as delivered baseline, code has been modified to KVCC specific
FUNCTION F_Generate_External_User(PIDM IN NUMBER) RETURN VARCHAR2;

-- pc, 2011-4-8, a delivered baseline function, renamed 'bl' (baseline) so to
--       distinguish KVCC defined function from delivered baseline
FUNCTION F_bl_Generate_External_User(PIDM IN NUMBER) RETURN VARCHAR2;

-- pc, 2007-8-2, not used   FUNCTION F_KVCC_Gen_ID_Initials (pidm IN NUMBER, counter IN NUMBER) return varchar2;

--   FUNCTION F_KVCC_Gen_ID_Full_SPRIDEN (pidm IN NUMBER, counter IN NUMBER) return varchar2;
FUNCTION F_KVCC_GENERATE_Student_ID (pidm IN NUMBER, counter IN NUMBER) return varchar2;

--   FUNCTION F_KVCC_Gen_ID_2007 (pidm IN NUMBER, counter IN NUMBER) return varchar2;
FUNCTION F_KVCC_GENERATE_Employee_ID (pidm IN NUMBER, counter IN NUMBER) return varchar2;


FUNCTION F_Reset_Pin(PIDM NUMBER)
	RETURN VARCHAR2;
   pragma restrict_references(F_Reset_Pin, wnds);

FUNCTION F_Validate_Pin (pin varchar2)
      return boolean;
   pragma restrict_references(F_Validate_pin,wnds);

FUNCTION F_Create_Pin_Ok (table_name_in gtvsdax.gtvsdax_internal_code%TYPE)
                          return BOOLEAN;
   pragma restrict_references(F_Create_Pin_Ok,wnds);

PROCEDURE P_Insert_Gobtpac(pidm_in NUMBER,
                              result_out OUT varchar2);

PROCEDURE p_save_global_pidm(pidm_in gobtpac.gobtpac_pidm%TYPE);

PROCEDURE p_get_global_pidm;
END goktpty;
/

create or replace PACKAGE BODY GOKTPTY
AS
--
-- FILE NAME..: goktpt1.sql
-- RELEASE....: 8.3.1
-- OBJECT NAME: GOKTPTY
-- PRODUCT....: GENERAL
-- COPYRIGHT..: Copyright 2000 - 2010 SunGard. All rights reserved.


-- Declare private global variables.
-- ==================================================

   TYPE pidm_tab_type IS TABLE OF gobtpac.gobtpac_pidm%type
      INDEX BY BINARY_INTEGER;

   global_pidm_tab              pidm_tab_type;

------------------------------------------------------------------------------
FUNCTION F_Character_Filter (name_in VARCHAR2)
      RETURN VARCHAR2
      is
--  The function searches name_in for characters
--  other then the letters 'a' through 'z'.  If found, these
--  characters are removed.  The search continues until all
--  characters are checked.

     new_name    	varchar2(65) := null;
     v_name    	        varchar2(65) := null;
     sub1        	number	     := 1;
     name_length 	number;

BEGIN
        name_length := length(name_in);
 	while sub1 <= name_length loop

	v_name := substr(lower(name_in), sub1,1);

                if v_name between 'a' and 'z'
       		 then
			new_name := new_name||v_name;
			sub1 := sub1 + 1;
		else
			sub1 := sub1 + 1;
		end if;
	end loop;
	return new_name;
END;






FUNCTION F_Check_External_User (PIDM IN NUMBER,
				          USERID IN VARCHAR2)
   RETURN VARCHAR2
   is
--  The function checks if an gorpaud_external_user value has
--  already been used by anyone.  If it was previously
--  used, the function returns the originally passed in USERID.

      CURSOR C_CHECK_GORPAUD_USERID IS
        SELECT lower(GORPAUD_EXTERNAL_USER)
	FROM GORPAUD
	WHERE GORPAUD_EXTERNAL_USER = USERID
        AND GORPAUD_CHG_IND = 'I'
	AND GORPAUD_PIDM <> PIDM;

      ext_user GOBTPAC.GOBTPAC_EXTERNAL_USER%TYPE;

   BEGIN

        OPEN  c_check_gorpaud_userid;
        FETCH c_check_gorpaud_userid INTO ext_user;

 	IF c_check_gorpaud_userid%NOTFOUND THEN
	  	 ext_user:= '*USER_NOT_FOUND*';
        	END IF;

        CLOSE c_check_gorpaud_userid;
        RETURN ext_user;

   END;

/******************************************************/
/* KVCC modification begins
/******************************************************/

/* This function is replaced by KVCC code, stored in modified version of goktpt1.sql named goktpt_copy.sql or goktpt1_kvcc2006.sql */

-- 2011-04-22.   Paul Chiu
-- Function delivered as F_Generate_External_User. Rnamed to F_bl (baseline) because the
-- real name F_Generate_External_User is used by the KVCC mod function so that Banner software will
-- call the KVCC mod with the Function name delivered .



FUNCTION F_KVCC_Check_External_User (pidm in number, USERID IN VARCHAR2)
RETURN VARCHAR2
is

CURSOR ckv_check_GOBTPAC_userid is
SELECT lower(GOBTPAC_EXTERNAL_USER)
FROM GOBTPAC
WHERE GOBTPAC_EXTERNAL_USER = USERID
AND GOBTPAC_PIDM <> PIDM
;
CURSOR ckv_check_GORPAUD_userid is
SELECT lower(GORPAUD_EXTERNAL_USER)
FROM GORPAUD
WHERE GORPAUD_EXTERNAL_USER = USERID
AND GORPAUD_PIDM <> PIDM
;

one_up    Number;
ext_user  GOBTPAC.GOBTPAC_EXTERNAL_USER%TYPE;
this_user GOBTPAC.GOBTPAC_EXTERNAL_USER%TYPE;



BEGIN

ext_user:= '* MATCH NOT FOUND *';
one_up :=0;

this_user :='*THIS USER NOT FOUND*';


OPEN  ckv_check_GOBTPAC_userid;
LOOP
     FETCH ckv_check_GOBTPAC_userid INTO this_user;
     EXIT WHEN ckv_check_GOBTPAC_userid%NOTFOUND;

	 if this_user=USERID then ext_user :=USERID;
--debug    one_up := one_up + 1;
	 end if;

END LOOP;
CLOSE ckv_check_GOBTPAC_userid;



-- ***************************************
-- continue to check GOTRPAUD if not found
-- ***************************************

if this_user ='*THIS USER NOT FOUND*' then
BEGIN

OPEN  ckv_check_GORPAUD_userid;
LOOP
    FETCH ckv_check_GORPAUD_userid INTO this_user;
    EXIT WHEN ckv_check_GORPAUD_userid%NOTFOUND;
     if this_user=USERID then ext_user :=USERID;
--debug      ext_user:=this_user ||'Not Found after '||to_char(one_up) ||'rows read.';
     end if;
END LOOP;
CLOSE ckv_check_GORPAUD_userid;
END;
end if;


if this_user ='*THIS USER NOT FOUND*' then
ext_user:= '* MATCH NOT FOUND *';
end if;


RETURN ext_user;

END;


/********************************************************************************************/
/*  This function is responsible for generating the KVCC ID's which consist of a first      */
/*  initial and last name.  Each pass through this function will have a precedence counter  */
/*  assigned to it.  A counter of 1 generates the preferred ID, a counter of 2 sets a       */

/* (as of 2007 July,mid initial not used, this section of code deleted )  ************** ** */

/*  secondary option for the ID (including the middle initial), and a counter of anything   */
/*  higher will result in a one-up number appended to the ID.				     */
/*************************************************************************************** *****/

-- generate USERNAME with 1UP number

-- old name,  ,FUNCTION F_KVCC_Gen_ID_2007 (pidm NUMBER, counter NUMBER) return varchar2 IS
FUNCTION F_KVCC_Generate_Employee_ID (pidm NUMBER, counter NUMBER) return varchar2 IS

	user_record SPRIDEN%rowtype;
	new_userid  GOBTPAC.GOBTPAC_EXTERNAL_USER%type;
	sav_userid  GOBTPAC.GOBTPAC_EXTERNAL_USER%type;
        filtered_lname   SPRIDEN.SPRIDEN_LAST_NAME%type;
        filtered_fname   SPRIDEN.SPRIDEN_FIRST_NAME%type;
	one_up      number;


BEGIN
 -- 2018-6-19, wcurtis, Added check to make sure that the new president has the username that they want.
  IF pidm = 559088 then
    new_userid := 'lmwashington';
    RETURN new_userid;
  end if;

       open spklibs.spriden_c(pidm);
       fetch spklibs.spriden_c into user_record;

-- 2009-1-15, pchiu, added to filter first then substring to 10
      filtered_lname := goktpty.F_Character_Filter(user_record.spriden_last_name);
      filtered_fname := goktpty.F_Character_Filter(user_record.spriden_first_name);

sav_userid := substr(filtered_fname,1,1)
              || substr(filtered_lname,1,10) ;


       IF spklibs.spriden_c%found and counter = 1 then
             new_userid :=sav_userid;

          ELSIF
             spklibs.spriden_c%found and counter = 3 then
             one_up := 1;
             new_userid := sav_userid || to_char(one_up);

             while new_userid = goktpty.F_KVCC_CHECK_EXTERNAL_USER(pidm,new_userid)
	     LOOP
	      one_up := one_up + 1;
              new_userid := sav_userid || to_char(one_up);
             END LOOP;

       ELSE
	     new_userid := 'NO spriden';
      END IF;

      close spklibs.spriden_c;
      RETURN new_userid;

END F_KVCC_Generate_Employee_ID;



/********************************************************************************************/
/*  This function is responsible for generating the KVCC ID's which consist of a first      */
/*  name and last name separated by a '-' with an appended last four digits of the SPRIDENID*/
/*  Each pass through this function will have a precedence counter assigned to it.  A       */
/*  counter of 1 generates the preferred ID, a counter of 2 sets a secondary option for the */
/*  ID (including the middle initial), and a counter of anything higher will result in a    */
/*  one-up number appended to the ID.				  */
/********************************************************************************************/
-- generate USERNAME9999

FUNCTION F_KVCC_Generate_Student_ID (pidm NUMBER, counter NUMBER) return varchar2 IS
        user_record SPRIDEN%rowtype;
	new_userid  GOBTPAC.GOBTPAC_EXTERNAL_USER%type;
	sav_userid  GOBTPAC.GOBTPAC_EXTERNAL_USER%type;
        filtered_lname   SPRIDEN.SPRIDEN_LAST_NAME%type;
        filtered_fname   SPRIDEN.SPRIDEN_FIRST_NAME%type;
        one_up      number;


BEGIN

      open spklibs.spriden_c(pidm);
      fetch spklibs.spriden_c into user_record;


-- 2009-1-15, pchiu, added to filter first then substring to 10
     filtered_lname := goktpty.F_Character_Filter(user_record.spriden_last_name);
     filtered_fname := goktpty.F_Character_Filter(user_record.spriden_first_name);

sav_userid := substr(filtered_fname,1,1)
  || substr(filtered_lname,1,10)
  || substr(user_record.spriden_id,6,4);


      IF spklibs.spriden_c%found and counter = 1 then
         new_userid :=sav_userid;


        ELSIF
          spklibs.spriden_c%found and counter = 3 then
          one_up := 1;
          new_userid := sav_userid || to_char(one_up);

	  while new_userid = goktpty.F_KVCC_CHECK_EXTERNAL_USER(pidm,new_userid)
          LOOP
	      one_up := one_up + 1;
              new_userid := sav_userid || to_char(one_up);
	  END LOOP;


      ELSE
          new_userid := 'NO spriden';
      END IF;

      close spklibs.spriden_c;
      RETURN new_userid;



END F_KVCC_Generate_Student_ID;



/********************************************************************************************/
--  This function first determines a user's status at KVCC.  Depending on the user's status,
--  this function will handoff the ID generation to the appropriate algorithm function.
--  Those functions will generate and verify the newly created userid is unique.  At
--  conclusion, the new userid will be returned to the GOBTPAC trigger.
/********************************************************************************************/
FUNCTION F_Generate_External_User (PIDM IN NUMBER)
   RETURN VARCHAR2
   is


-- 2008-03-05, PC, replaced , this includes FT STAFF, FT/PT FAC
-- 2008-3-5, PC, now this includes FT/PT STAFF,  FT/PT FAC , 'or' condition below represents PT Staff
-- 2009-12-21,pc,  HR added pebempl_ecls_code 33,39,49
-- 2011-4-19,pc,  above replaced by : between '33' and '57',  way before 2011-4-19
--       added condition for :SPRIDEN_NTYP_CODE='UIC' and SPRIDEN_CHANGE_IND='N'


cursor get_active_employee (pidm IN SPRIDEN.SPRIDEN_PIDM%TYPE) IS
select distinct(spriden.spriden_pidm)
from spriden, pebempl
where spriden.spriden_pidm = pidm
  and spriden.spriden_change_ind is null
  and spriden.spriden_pidm = pebempl.pebempl_pidm
  and	pebempl.pebempl_empl_status = 'A'
  and (  pebempl.pebempl_ecls_code in ('00','01','02','03','04','05','06','07','09')
      or pebempl.pebempl_ecls_code in ('08','10','11','12','13','18','19','20')
      or pebempl.pebempl_ecls_code between '33' and '57'
      )
  and SPRIDEN_NTYP_CODE is null
;


        temp_pidm    spriden.spriden_pidm%type;
        user_found   varchar2(1);
        status_ind   varchar2(25);
        new_userid   gobtpac.gobtpac_external_user%type;
        counter      number;


BEGIN

	/*  Assess the user's status - full time staff and faculty take precedence */
        user_found := 'N';
        status_ind := 'NOT APPLICABLE';


	open get_active_employee(pidm);
	fetch get_active_employee into temp_pidm;
	if get_active_employee%found then
               begin
		user_found := 'Y';
               end;
	else
--		status_ind := 'NOT_APPLICABLE';
		status_ind := 'NOT_EMPLOYEE';
	end if;
	close get_active_employee;


-- based on status_ind, launch appropriate function to generate new ID

--(1  , removed from 2 IF conditions below : and user_found = 'Y'

-- 2008-3-5, PWC, replaced.      IF  (status_ind = 'FULL_TIME_EMPLOYEE' ) then

      IF  ( user_found = 'Y' ) then
        begin
            new_userid := F_KVCC_Generate_Employee_ID(pidm, 1);
            if new_userid = goktpty.F_KVCC_CHECK_EXTERNAL_USER(pidm,new_userid) then
               new_userid := F_KVCC_Generate_Employee_ID(pidm, 3);
            end if;
        end;

--1,
        ELSE

--everyone else gets 4-digit username
--2008-3-5, PWC , now this group should include only PEBEMPL_ECLS_CODE of 14, 15, 16 and 17.

                 begin
                   new_userid := F_KVCC_Generate_Student_ID(pidm, 1);
	           if new_userid = goktpty.F_KVCC_CHECK_EXTERNAL_USER(pidm,new_userid) then
                     new_userid := F_KVCC_Generate_Student_ID(pidm, 3);
                   end if;
                 end;

        END IF;
--1)


	RETURN new_userid;

END F_Generate_External_User;





/******************************************************/
/* KVCC modification End
/******************************************************/
-- 2011-04-22.   Paul Chiu
-- this is functioni is delivered as F_Generate_External_User. Rnamed to F_bl (baseline) because the
-- real name F_Generate_External_User is used by the KVCC mod function so that Banner software will
-- call the KVCC mod with the Function name delivered .


FUNCTION F_bl_Generate_External_User (PIDM IN NUMBER)
   RETURN VARCHAR2
   is
--  Function generates and verifies if a newly created userid already
--  exists.  If the new userid exists, the function will generate a 'one-up'
--  userid and verify if that one exists.  The function continues the
--  'one_up' userid generation until it finds a unique userid.

CURSOR c_select_length_last IS
        SELECT GUBPPRF_LENGTH_LAST_NAME
        FROM GUBPPRF;
CURSOR c_select_userid IS
     	SELECT LOWER(SPRIDEN_FIRST_NAME), LOWER(SPRIDEN_LAST_NAME)
       	FROM SPRIDEN
      	WHERE SPRIDEN_ENTITY_IND = 'P'
        	AND SPRIDEN_CHANGE_IND IS NULL
        	AND SPRIDEN_PIDM = PIDM;

   new_userid   gobtpac.gobtpac_external_user%TYPE;
   orig_userid 	gobtpac.gobtpac_external_user%TYPE;
   counter      NUMBER := 0;
   first_name   SPRIDEN.SPRIDEN_FIRST_NAME%TYPE;
   last_name    SPRIDEN.SPRIDEN_LAST_NAME%TYPE;
   lv_len_last  NUMBER(2);

BEGIN
   OPEN c_select_length_last;
   FETCH c_select_length_last INTO lv_len_last;
   CLOSE c_select_length_last;
   OPEN c_select_userid;
   FETCH c_select_userid INTO first_name, last_name;
   CLOSE c_select_userid;

   /*function, f_character_filter, removes all special characters from names*/
   last_name  := f_character_filter(gukcnva.f_convert(last_name));
   first_name := f_character_filter(gukcnva.f_convert(first_name));
   orig_userid := SUBSTR(first_name,1,1)||SUBSTR(last_name,1,lv_len_last);
   new_userid := orig_userid;

   WHILE new_userid = F_CHECK_EXTERNAL_USER(pidm, new_userid)
     LOOP
       counter := counter + 1;
       if counter < 10 then
         new_userid := substr(orig_userid,1,lv_len_last)||TO_CHAR(counter);
       elsif counter < 100 then
         new_userid := substr(orig_userid,1,(lv_len_last - 1))||TO_CHAR(counter);
       elsif counter < 1000 then
         new_userid := substr(orig_userid,1,(lv_len_last - 2))||TO_CHAR(counter);
       elsif counter < 10000 then
         new_userid := substr(orig_userid,1,(lv_len_last - 3))||TO_CHAR(counter);
       else
         new_userid := substr(orig_userid,1,(lv_len_last - 4))||TO_CHAR(counter);
       end if;
     END LOOP;
--
   RETURN new_userid;
END F_bl_Generate_External_User;

--
--
   FUNCTION f_check_number (p_str   VARCHAR2)
   RETURN VARCHAR2 IS
   lv_numeric_exists  VARCHAR2(1) := 'N';
   BEGIN
   FOR i in 1 .. length(p_str) LOOP
        IF  ((ascii(substr(p_str,i,1))>=48)  and
            (ascii(substr(p_str,i,1))<=57))  then
            RETURN 'Y';
        END IF;

   END LOOP;
   RETURN 'N';
   END f_check_number;
--
--
   FUNCTION f_check_alpha (p_str   VARCHAR2)
   RETURN VARCHAR2 IS
     lv_tran varchar2(20000);
   BEGIN
     IF p_str IS NULL THEN -- string was null to begin with and so no alpha
       RETURN('N');
     END IF;
     lv_tran := translate(p_str,chr(01)||'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ',chr(01));
     IF lv_tran is NULL THEN --only alpha was present
       RETURN('Y');
     END IF;
     IF lv_tran = p_str THEN -- no alpha was found since strings are same before and after translate
       RETURN('N');
     ELSE
       RETURN ('Y');
     END IF;
   END f_check_alpha;
--
--
FUNCTION F_Reset_Pin(PIDM NUMBER)
RETURN VARCHAR2 IS
-- This function will generate a PIN based on Birthdate or some random value.
-- This function uses Pin Preferences table ( GUBPPRF).

   date_format  	VARCHAR2(6);
   PIN          	VARCHAR2(255);
   PIN_NUM       	VARCHAR2(255);
   curr_seed            VARCHAR2(255);
   var_id               spriden.spriden_id%type;
   pin_format           gubpprf.gubpprf_format%type;
   pin_min_len          gubpprf.gubpprf_min_length%type;
   pin_value            gubpprf.gubpprf_value%type;
   num_ind              gubpprf.gubpprf_num_ind%type;
   char_ind             gubpprf.gubpprf_char_ind%type;


   CURSOR c1 IS
      SELECT DECODE(gubinst_date_default_format, 1, 'MMDDYY',
                     2, 'DDMMYY', 3, 'YYMMDD', 'MMDDYY')
      FROM gubinst;

   CURSOR c2 IS
      SELECT TO_CHAR(spbpers_birth_date, date_format)
        FROM spbpers
        WHERE spbpers_pidm = PIDM;

   CURSOR c3 IS
      SELECT spriden_id
        FROM spriden
        WHERE spriden_pidm = PIDM
        AND spriden_change_ind IS NULL;

   CURSOR gubpprfC
   IS
   SELECT gubpprf_format, gubpprf_value,gubpprf_min_length,gubpprf_num_ind,gubpprf_char_ind
   FROM gubpprf;
   lv_min_str varchar2(20);
--
   lv_characters_length NUMBER;
   lv_characters        GJRINVC.GJRINVC_CHARACTERS%TYPE;
   lv_valid_or_invalid  GJRINVC.GJRINVC_VALID_OR_INVALID%TYPE;
   lv_string_of_chars   VARCHAR2(2000);
   lv_string_of_nums    VARCHAR2(2000);
--
   CURSOR C_VALIDATE_CHARS IS
   SELECT NVL(LENGTH(LTRIM(RTRIM(GJRINVC_CHARACTERS))),0),
          GJRINVC_VALID_OR_INVALID,
          GJRINVC_CHARACTERS
     FROM GJRINVC
    WHERE GJRINVC_PARM_TYPE = 'RPG';

BEGIN
   OPEN gubpprfC;
   FETCH gubpprfC INTO pin_format,pin_value,pin_min_len,num_ind,char_ind;
   CLOSE gubpprfC;

   IF pin_value = 'B' THEN  --Birthdate

-- if Birthdate is null then last six character of SPRIDEN_ID will be used.
-- If it can not generate a six character numeric PIN when PIN_FORMAT has
-- been set to NUMERIC, a NULL value will be return.

     OPEN c1;
     FETCH c1 INTO date_format;
     CLOSE c1;

     OPEN c2;
     FETCH c2 INTO PIN;
     CLOSE c2;

     IF (PIN is null or PIN = ' ') THEN
        open c3;
        fetch c3 into var_id;
        close c3;
        PIN:=SUBSTR(var_id, -6);
     END IF;

     IF LENGTH(PIN) < 6 THEN
        PIN := NULL;
     END IF;

     IF pin_format ='N' THEN
       PIN_NUM := TO_NUMBER(PIN);
     END IF;

     RETURN PIN;
   ELSIF pin_value = 'R' THEN  -- Random

-- check to see if any Random Pin Generation (RPG) rules exist
     OPEN C_VALIDATE_CHARS;
     FETCH C_VALIDATE_CHARS INTO lv_characters_length,
                                 lv_valid_or_invalid,
                                 lv_characters;
     IF C_VALIDATE_CHARS%NotFound OR (lv_characters IS NULL AND lv_valid_or_invalid = 'V') THEN -- no rules exist, continue the same as always
       CLOSE C_VALIDATE_CHARS;
       OPEN c3;
       FETCH c3 INTO var_id;
       CLOSE c3;
       curr_seed := to_char(current_timestamp,'SSSSSFF')||var_id;
       dbms_random.seed(curr_seed);
       IF pin_format = 'N' THEN
          lv_min_str := substr('99999999999999999999',1,pin_min_len);
          PIN := round(dbms_random.value(substr('11111111111111111111',1,pin_min_len),lv_min_str));
          RETURN PIN;
       ELSIF pin_format = 'A' THEN
          PIN := dbms_random.string('X',pin_min_len);
--
--     Replace o and 0
--
          PIN := replace(PIN,'o','a');
          PIN := replace(PIN,'O','A');
          PIN := replace(PIN,'0',round(dbms_random.value(1,9)));
          IF nvl(num_ind,'N') = 'Y' THEN
            IF f_check_number(pin) = 'N' THEN
              PIN := substr(pin,1,pin_min_len - 1)||round(dbms_random.value(1,9));
            END IF;
          END IF;

          IF nvl(char_ind,'N') = 'Y' THEN
            IF f_check_number(pin) = 'Y' THEN
              PIN := substr(pin,1,pin_min_len - 1)||replace(dbms_random.string('U',1),'OI','FW');
            END IF;
          END IF;
--        PIN := goklibs.F_GenRandChar(var_id,6);
          RETURN PIN;
       END IF;
     ELSE -- Random Pin Generation rules exist
       CLOSE C_VALIDATE_CHARS;
       lv_characters_length := NVL(LENGTH(LTRIM(RTRIM(lv_characters))),0);
--
       IF lv_valid_or_invalid = 'I' THEN
         lv_string_of_chars  := dbms_random.string('P',255);  -- generate string of printable characters
         lv_string_of_chars  := translate(lv_string_of_chars,chr(01)||' '||lv_characters,chr(01));  -- remove all invalid characters from possible
         lv_characters       := lv_string_of_chars;           -- resulting string is all printable minus our invalid characters
       END IF;
--
       lv_characters  := translate(lv_characters,chr(01)||' ',chr(01)); -- remove spaces just in case they exist
       IF lv_characters IS NULL THEN
         lv_characters := dbms_random.string('X',255); -- just in case the resulting list is null revert to numbers and upper a-z
       END IF;
       lv_string_of_chars := RPAD(lv_characters, 2000, lv_characters); --fill up a 2000 character string repeating the list of valid characters
--
       FOR i in 1..pin_min_len LOOP
         pin := pin || substr(lv_string_of_chars,round(dbms_random.value(1,2000)),1);
       END LOOP;
--
-- Now make sure we have a numeric character, if required
--
       IF nvl(num_ind,'N') = 'Y' THEN
         IF f_check_number(pin) = 'N' THEN
           lv_string_of_nums  := NULL;
           FOR i in 1 .. length(lv_characters) LOOP
             IF  ((ascii(substr(lv_characters,i,1))>=48)  and
                  (ascii(substr(lv_characters,i,1))<=57)) then
                    lv_string_of_nums  := lv_string_of_nums || substr(lv_characters,i,1); -- get all the valid numeric characters
             END IF;
           END LOOP;
--
           IF lv_string_of_nums IS NULL THEN
             lv_string_of_nums := round(dbms_random.value(1,9)); -- make sure we have at least 1 valid numeric digit
           END IF;
--
           PIN := substr(pin,1,pin_min_len - 1)||
              substr(lv_string_of_nums,round(dbms_random.value(1,length(lv_string_of_nums))),1); -- since a numeric was needed, make sure we have one
         END IF;
       END IF;
--
-- Now make sure we have an alpha character, if required
--
       IF nvl(char_ind,'N') = 'Y' THEN
         IF f_check_alpha(pin) = 'N' THEN
           lv_string_of_chars  := NULL;
           FOR i in 1 .. length(lv_characters) LOOP
             IF nvl(instr('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',substr(lv_characters,i,1)),0) > 0  then
               lv_string_of_chars  := lv_string_of_chars || substr(lv_characters,i,1); -- get all the valid alpha characters
             END IF;
           END LOOP;
--
           IF lv_string_of_chars IS NULL THEN
             lv_string_of_chars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; -- make sure we have at least 1 valid character
           END IF;
--
           PIN := substr(pin,1,pin_min_len - 1)||
              substr(lv_string_of_chars,round(dbms_random.value(1,length(lv_string_of_chars))),1); -- since a character was needed, make sure we have one
         END IF;
       END IF;
--
       RETURN (pin);
     END IF;
   END IF;

EXCEPTION
   WHEN OTHERS THEN
      PIN := NULL;
      RETURN PIN;
END F_Reset_Pin;
-------------------------------------------------------
FUNCTION F_Validate_Pin (pin varchar2) return boolean
IS
  pin_format     gubpprf.gubpprf_format%type;
  pin_number     number;

  CURSOR gubpprfC
  IS
  SELECT gubpprf_format
  FROM gubpprf;

BEGIN
  OPEN gubpprfC;
  FETCH gubpprfC INTO pin_format;
  CLOSE gubpprfC;

     IF LENGTH(PIN) <> 6 THEN
        RETURN false;
     END IF;
     IF pin_format = 'N' THEN
        pin_number:= to_number(pin,'999999');
        IF REPLACE(TRANSLATE(LPAD(LTRIM(pin),10,'0'),'0123456789','XXXXXXXXXX'),'X') IS NOT NULL THEN
           RETURN false;
        END if;
     END if;
   RETURN true;
EXCEPTION
   WHEN OTHERS THEN
     RETURN false;
END F_Validate_Pin;
---------------------------------------------------------
FUNCTION F_Create_Pin_Ok (table_name_in gtvsdax.gtvsdax_internal_code%TYPE)
                          return BOOLEAN
IS
  sdax_external_code      gtvsdax.gtvsdax_external_code%TYPE;
  return_value            BOOLEAN;

  CURSOR get_external_code_c
  IS
  SELECT gtvsdax_external_code
    FROM gtvsdax
   WHERE gtvsdax_internal_code = table_name_in
     AND gtvsdax_internal_code_group = 'CREATEPIN';

BEGIN
  OPEN get_external_code_c;
  FETCH get_external_code_c INTO sdax_external_code;

  IF get_external_code_c%NOTFOUND
  THEN
     return_value := FALSE;
  END IF;

  return_value := sdax_external_code = 'Y';

  RETURN return_value;

  CLOSE get_external_code_c;
END F_Create_Pin_Ok;
-----------------------------------------------------------------------------
PROCEDURE p_save_global_pidm(pidm_in gobtpac.gobtpac_pidm%TYPE) IS
BEGIN
      global_pidm_tab(NVL(global_pidm_tab.LAST,0) + 1) := pidm_in;

END p_save_global_pidm;
-----------------------------------------------------------------------------
PROCEDURE p_get_global_pidm IS
      result                    VARCHAR2(8) := NULL;
BEGIN
      <<pidm_loop>>
      FOR i IN NVL(global_pidm_tab.FIRST,0) .. NVL(global_pidm_tab.LAST, 0)
      LOOP
         IF global_pidm_tab.exists (i)
         THEN
            P_Insert_Gobtpac(global_pidm_tab(i), result);
         END IF;

      END LOOP;
      global_pidm_tab.delete;
END p_get_global_pidm;

-----------------------------------------------------------------------------
PROCEDURE P_Insert_Gobtpac(pidm_in NUMBER,
                           result_out OUT varchar2) IS

   pin_value                gobtpac.gobtpac_pin%type;
   pin_exp_date             gobtpac.gobtpac_pin_exp_date%TYPE;
   pin                      gobtpac.gobtpac_pin%TYPE;
   pin_found                BOOLEAN;
   pre_expire_ind       gubpprf.gubpprf_pre_expire_ind%TYPE;
   lv_external_user         gobtpac.gobtpac_external_user%TYPE;
   lv_rowid                 rowid;

   CURSOR get_gobtpac_pin IS
       SELECT gobtpac_pin
         FROM gobtpac
        WHERE gobtpac_pidm = pidm_in;

   CURSOR get_gubpprf_pre_expire_ind IS
       SELECT gubpprf_pre_expire_ind
         FROM gubpprf;
BEGIN

      OPEN get_gobtpac_pin;
     FETCH get_gobtpac_pin INTO pin;
           pin_found := get_gobtpac_pin%FOUND;
     CLOSE get_gobtpac_pin;

   IF NOT pin_found
   THEN
   -- get the pin value from F_Reset_Pin
   -- =====================================================

      pin_value := F_Reset_Pin(pidm_in);

   -- Insert into gobtpac only if pin_value is not null
   -- =====================================================

      IF pin_value IS NOT NULL
      THEN
          OPEN get_gubpprf_pre_expire_ind;
         FETCH get_gubpprf_pre_expire_ind INTO pre_expire_ind;

          IF pre_expire_ind = 'Y'
          THEN
             pin_exp_date := TRUNC(sysdate -1);
          ELSE
             pin_exp_date := NULL;
          END IF;
         CLOSE get_gubpprf_pre_expire_ind;
   -- =====================================================
         GB_THIRD_PARTY_ACCESS.P_CREATE(
                p_PIDM                   => pidm_in,
                p_USER                   => USER,
                p_PIN                    => pin_value,
                p_PIN_EXP_DATE           => pin_exp_date,
                p_EXTERNAL_USER_INOUT    => lv_external_user,
                p_INSERT_SOURCE          => 'MASS',
                p_DATA_ORIGIN            => gb_common.DATA_ORIGIN,
                p_ROWID_OUT              => lv_rowid);

          result_out := 'CREATED';
      ELSE
          result_out := 'NOPIN';
      END IF;
   ELSE
      IF pin is NULL
      THEN
-- If the row exists, but the pin on file is NULL then create the pin and perform an update
         pin_value := F_Reset_Pin(pidm_in);
         IF pin_value IS NOT NULL
         THEN
           OPEN get_gubpprf_pre_expire_ind;
           FETCH get_gubpprf_pre_expire_ind INTO pre_expire_ind;
           IF pre_expire_ind = 'Y'
           THEN
             pin_exp_date := TRUNC(sysdate -1);
           ELSE
             pin_exp_date := NULL;
           END IF;
           CLOSE get_gubpprf_pre_expire_ind;
   -- =====================================================
           GB_THIRD_PARTY_ACCESS.P_UPDATE(
                p_PIDM                   => pidm_in,
                p_USER                   => USER,
                p_PIN                    => pin_value,
                p_PIN_EXP_DATE           => pin_exp_date,
                p_INSERT_SOURCE          => 'MASS',
                p_DATA_ORIGIN            => gb_common.DATA_ORIGIN);
           result_out := 'CREATED';
         ELSE
           result_out := 'NOPIN';
         END IF;
      ELSE
         result_out := 'EXISTS';
      END IF;
   END IF;

END P_Insert_Gobtpac;
END goktpty;
/
