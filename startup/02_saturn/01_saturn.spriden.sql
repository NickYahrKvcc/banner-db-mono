GRANT REFERENCES ON GENERAL.GTVNTYP TO SATURN;

CREATE TABLE SATURN.SPRIDEN
(
    SPRIDEN_PIDM               NUMBER(8)         NOT NULL,
    SPRIDEN_ID                 VARCHAR2(9 char)  NOT NULL,
    SPRIDEN_LAST_NAME          VARCHAR2(60 char) NOT NULL,
    SPRIDEN_FIRST_NAME         VARCHAR2(60 char),
    SPRIDEN_MI                 VARCHAR2(60 char),
    SPRIDEN_CHANGE_IND         VARCHAR2(1 char),
    SPRIDEN_ENTITY_IND         VARCHAR2(1 char),
    SPRIDEN_ACTIVITY_DATE      DATE              NOT NULL,
    SPRIDEN_USER               VARCHAR2(30 char),
    SPRIDEN_ORIGIN             VARCHAR2(30 char),
    SPRIDEN_SEARCH_LAST_NAME   VARCHAR2(60 char),
    SPRIDEN_SEARCH_FIRST_NAME  VARCHAR2(60 char),
    SPRIDEN_SEARCH_MI          VARCHAR2(60 char),
    SPRIDEN_SOUNDEX_LAST_NAME  CHAR(4 char),
    SPRIDEN_SOUNDEX_FIRST_NAME CHAR(4 char),
    SPRIDEN_NTYP_CODE          VARCHAR2(4 char)
        CONSTRAINT FK1_SPRIDEN_INV_GTVNTYP_CODE
            REFERENCES GENERAL.GTVNTYP,
    SPRIDEN_CREATE_USER        VARCHAR2(30 char),
    SPRIDEN_CREATE_DATE        DATE,
    SPRIDEN_DATA_ORIGIN        VARCHAR2(30 char),
    SPRIDEN_CREATE_FDMN_CODE   VARCHAR2(30 char),
    SPRIDEN_SURNAME_PREFIX     VARCHAR2(60 char),
    SPRIDEN_SURROGATE_ID       NUMBER(19)        NOT NULL
        CONSTRAINT UK_SPRIDEN_SURROGATE_ID
            UNIQUE,
    SPRIDEN_VERSION            NUMBER(19)        NOT NULL,
    SPRIDEN_USER_ID            VARCHAR2(30 char),
    SPRIDEN_VPDI_CODE          VARCHAR2(6 char)
)
/

COMMENT ON TABLE SATURN.SPRIDEN IS 'Person Identification/Name Repeating Table'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_PIDM IS 'Internal identification number of the person.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_ID IS 'This field defines the identification number used to access person on-line.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_LAST_NAME IS 'This field defines the last name of person.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_FIRST_NAME IS 'This field identifies the first name of person.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_MI IS 'This field identifies the middle name of person.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_CHANGE_IND IS 'This field identifies whether type of change made to the record was an ID       number change or a name change. Valid values: I - ID change, N - name change.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_ENTITY_IND IS 'This field identifies whether record is person or non-person record.  It does   not display on the form. Valid values:  P - person, C - non-person.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_ACTIVITY_DATE IS 'This field defines the most current date record is created or changed.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_USER IS 'USER: The ID for the user that most recently updated the record.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_ORIGIN IS 'ORIGIN: The name of the Banner Object that was used most recently to update the row in the spriden table.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SEARCH_LAST_NAME IS 'The Last Name field with all spaces and punctuation removed and all letters capitalized.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SEARCH_FIRST_NAME IS 'The First Name field with all spaces and punctuation removed and all letters capitalized.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SEARCH_MI IS 'The MI (Middle Initial) field with all spaces and punctuation removed and all letters capitalized.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SOUNDEX_LAST_NAME IS 'The Last Name field in SOUNDEX phonetic format.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SOUNDEX_FIRST_NAME IS 'The First Name field in SOUNDEX phonetic format.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_NTYP_CODE IS 'NAME TYPE CODE: The field is used to store the code that represents the name type associated with a person''s name.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_CREATE_USER IS 'Record Create User: This field contains Banner User ID which created new record'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_CREATE_DATE IS 'Record Create Date: This field contains date new record created'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_DATA_ORIGIN IS 'DATA SOURCE: Source system that generated the data'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_CREATE_FDMN_CODE IS 'PII DOMAIN: PII Domain of the user who created the spriden row.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SURNAME_PREFIX IS 'SURNAME PREFIX: Name tag preceding the last name or surname.  (Van, Von, Mac, etc.)'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.SPRIDEN.SPRIDEN_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

CREATE INDEX SPRIDEN_INDEX_SEARCH
    ON SATURN.SPRIDEN (SPRIDEN_SEARCH_LAST_NAME, SPRIDEN_SEARCH_FIRST_NAME, SPRIDEN_SEARCH_MI, SPRIDEN_SURNAME_PREFIX)
/

CREATE INDEX SPRIDEN_INDEX_SOUNDEX
    ON SATURN.SPRIDEN (SPRIDEN_SOUNDEX_LAST_NAME, SPRIDEN_SOUNDEX_FIRST_NAME)
/

CREATE INDEX SPRIDEN_INDEX_ID
    ON SATURN.SPRIDEN (SPRIDEN_ID, SPRIDEN_ENTITY_IND, SPRIDEN_CHANGE_IND)
/

CREATE INDEX SPRIDEN_INDEX_PERS
    ON SATURN.SPRIDEN (SPRIDEN_LAST_NAME, SPRIDEN_FIRST_NAME, SPRIDEN_MI, SPRIDEN_SURNAME_PREFIX, SPRIDEN_ENTITY_IND,
                       SPRIDEN_CHANGE_IND)
/

CREATE UNIQUE INDEX SPRIDEN_KEY_INDEX
    ON SATURN.SPRIDEN (SPRIDEN_PIDM, SPRIDEN_ID, SPRIDEN_LAST_NAME, SPRIDEN_FIRST_NAME, SPRIDEN_MI,
                       SPRIDEN_SURNAME_PREFIX,
                       SPRIDEN_CHANGE_IND, SPRIDEN_NTYP_CODE)
/

CREATE INDEX SPRIDEN_PIDM_INDEX
    ON SATURN.SPRIDEN (SPRIDEN_PIDM, SPRIDEN_CHANGE_IND)
/