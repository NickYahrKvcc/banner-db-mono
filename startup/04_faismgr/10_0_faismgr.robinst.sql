GRANT REFERENCES ON SATURN.STVTERM TO FAISMGR
/

GRANT REFERENCES ON SATURN.STVSBGI TO FAISMGR
/

CREATE TABLE FAISMGR.ROBINST
(
    ROBINST_AIDY_CODE              VARCHAR2(4 char)                    NOT NULL
        CONSTRAINT PK_ROBINST
            PRIMARY KEY,
    ROBINST_AIDY_DESC              VARCHAR2(30 char)                   NOT NULL,
    ROBINST_AIDY_START_DATE        DATE                                NOT NULL,
    ROBINST_AIDY_END_DATE          DATE                                NOT NULL,
    ROBINST_AIDY_START_YEAR        NUMBER(4)                           NOT NULL,
    ROBINST_AIDY_END_YEAR          NUMBER(4)                           NOT NULL,
    ROBINST_STATUS_IND             VARCHAR2(1 char)                    NOT NULL,
    ROBINST_BUDG_AUDIT_IND         VARCHAR2(1 char),
    ROBINST_NEED_AUDIT_IND         VARCHAR2(1 char)                    NOT NULL,
    ROBINST_PCKG_AUDIT_IND         VARCHAR2(1 char),
    ROBINST_PELL_AUDIT_IND         VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_APPL_DATE_IND          VARCHAR2(1 char)                    NOT NULL,
    ROBINST_TFC_PRO_IND            VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_PAYVOCH_REQ_IND        VARCHAR2(1 char),
    ROBINST_METHOD_IND             VARCHAR2(1 char)                    NOT NULL,
    ROBINST_INFC_CODE              VARCHAR2(7 char)                    NOT NULL
        CONSTRAINT FK1_ROBINST_INV_RTVINFC_CODE
            REFERENCES FAISMGR.RTVINFC,
    ROBINST_INAS_OPTION            VARCHAR2(1 char) DEFAULT 'L'        NOT NULL,
    ROBINST_ACTIVITY_DATE          DATE,
    ROBINST_TRST_CODE_EST          VARCHAR2(1 char)
        CONSTRAINT FK1_ROBINST_INV_RTVTRST_CODE
            REFERENCES FAISMGR.RTVTRST,
    ROBINST_BGRP_CODE              VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVBGRP_CODE
            REFERENCES FAISMGR.RTVBGRP,
    ROBINST_TGRP_CODE              VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVTGRP_CODE
            REFERENCES FAISMGR.RTVTGRP,
    ROBINST_PGRP_CODE              VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVPGRP_CODE
            REFERENCES FAISMGR.RTVPGRP,
    ROBINST_TREQ_CODE_APPL         VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVTREQ_CODE
            REFERENCES FAISMGR.RTVTREQ,
    ROBINST_APRD_CODE_DEF          VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVAPRD_CODE
            REFERENCES FAISMGR.RTVAPRD,
    ROBINST_SAPR_CODE              VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_RTVSAPR_CODE
            REFERENCES FAISMGR.RTVSAPR,
    ROBINST_FINAID_DIR_NAME        VARCHAR2(500 char),
    ROBINST_TREQ_CODE_SAR          VARCHAR2(6 char)
        CONSTRAINT FK2_ROBINST_INV_RTVTREQ_CODE
            REFERENCES FAISMGR.RTVTREQ,
    ROBINST_CURRENT_TERM_CODE      VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_STVTERM_CODE
            REFERENCES SATURN.STVTERM,
    ROBINST_TRST_CODE_SAR          VARCHAR2(1 char)
        CONSTRAINT FK2_ROBINST_INV_RTVTRST_CODE
            REFERENCES FAISMGR.RTVTRST,
    ROBINST_FINAID_DIR_PHONE_AREA  VARCHAR2(6 char),
    ROBINST_FINAID_DIR_PHONE_NO    VARCHAR2(12 char),
    ROBINST_PELL_ID                VARCHAR2(6 char),
    ROBINST_ENTITY_ID              VARCHAR2(12 char),
    ROBINST_SERV_AGENT_CDE         VARCHAR2(2 char),
    ROBINST_SBGI_CONV_IND          VARCHAR2(1 char),
    ROBINST_INST_SBGI_CODE         VARCHAR2(6 char)
        CONSTRAINT FK1_ROBINST_INV_STVSBGI_CODE
            REFERENCES SATURN.STVSBGI,
    ROBINST_DL_SCHOOL_CODE         VARCHAR2(6 char),
    ROBINST_DEST_NUMBER            VARCHAR2(5 char),
    ROBINST_INFO_ACCESS_IND        VARCHAR2(1 char),
    ROBINST_DFLT_MSG_EXP_DAYS      NUMBER(4),
    ROBINST_INAS_NON_CUST          VARCHAR2(1 char),
    ROBINST_UPD_TRAN_IND           VARCHAR2(1 char),
    ROBINST_LOAN_PROCESS_TYPE      VARCHAR2(1 char),
    ROBINST_SAPR_CODE_EXCEPT       VARCHAR2(6 char)
        CONSTRAINT FK2_ROBINST_INV_RTVSAPR_CODE
            REFERENCES FAISMGR.RTVSAPR,
    ROBINST_PIVOT_DATE             DATE,
    ROBINST_DL_AFFIRM_IND          VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_FORMER_HEAL_IND        VARCHAR2(1 char),
    ROBINST_CASH_MONITOR_IND       VARCHAR2(1 char),
    ROBINST_JUST_IN_TIME_IND       VARCHAR2(1 char),
    ROBINST_PELL_RED_ELIG_IND      VARCHAR2(1 char),
    ROBINST_TREQ_CODE_ENTER_INTV   VARCHAR2(6 char)
        CONSTRAINT FK3_ROBINST_INV_RTVTREQ_CODE
            REFERENCES FAISMGR.RTVTREQ,
    ROBINST_TREQ_CODE_EXIT_INTV    VARCHAR2(6 char)
        CONSTRAINT FK4_ROBINST_INV_RTVTREQ_CODE
            REFERENCES FAISMGR.RTVTREQ,
    ROBINST_JIT_NO_DAYS            NUMBER(2),
    ROBINST_EL_SCHOOL_CDE          VARCHAR2(6 char),
    ROBINST_MYN_ELIGIBLE           VARCHAR2(1 char),
    ROBINST_EL_BRANCH_CDE          VARCHAR2(2 char),
    ROBINST_APPL_DATE_SOURCE       VARCHAR2(7 char),
    ROBINST_ALTERNATE_PELL_IND     VARCHAR2(1 char),
    ROBINST_EL_AUDIT_IND           VARCHAR2(1 char),
    ROBINST_EL_AUDIT_NO_DAYS       NUMBER(2),
    ROBINST_TITLE_IV_RET_IND       VARCHAR2(1 char),
    ROBINST_TITLE_IV_ROUND_IND     VARCHAR2(1 char),
    ROBINST_TRST_CODE_ENTER_INTV   VARCHAR2(1 char),
    ROBINST_TRST_CODE_EXIT_INTV    VARCHAR2(1 char),
    ROBINST_NEW_PELL_CALC_IND      VARCHAR2(1 char),
    ROBINST_FULL_PARTICIPANT_IND   VARCHAR2(1 char),
    ROBINST_COMMON_SCHOOL_ID       VARCHAR2(8 char),
    ROBINST_TURN_OFF_PELL_IND      VARCHAR2(1 char),
    ROBINST_PELL_FUND_CODE         VARCHAR2(6 char),
    ROBINST_DL_COD_FP_IND          VARCHAR2(1 char),
    ROBINST_PELL_COD_FP_IND        VARCHAR2(1 char),
    ROBINST_PELL_LT_HALF_IND       VARCHAR2(1 char),
    ROBINST_RESCHED_DISB_DATE_IND  VARCHAR2(1 char),
    ROBINST_MULTI_YR_PERK_MPN_FLAG VARCHAR2(1 char),
    ROBINST_APPLY_FYFTB_RULE_IND   VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    ROBINST_FED_SCHOOL_CODE        VARCHAR2(6 char),
    ROBINST_OPEID                  VARCHAR2(6 char),
    ROBINST_OPEID_BRANCH           VARCHAR2(2 char),
    ROBINST_GRANT_ADVANCE_PAY_IND  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_GRANT_AP_NO_DAYS       NUMBER(2),
    ROBINST_UPD_LOCKED_AWARD_IND   VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_INTL_IND               VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_CTRY_CODE_PHONE        VARCHAR2(4 char),
    ROBINST_CREATE_ROBNYUD_IND     VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_CREATE_ROBUSDF_IND     VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_TERM_CODE_SAP          VARCHAR2(6 char),
    ROBINST_USER_ID                VARCHAR2(30 char),
    ROBINST_RETENTION_EXPIRED_IND  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_RETENTION_DATE         DATE,
    ROBINST_ARCHIVE_DATE           DATE,
    ROBINST_FM_IM_FLG              VARCHAR2(1 char) DEFAULT 'F' NOT NULL,
    ROBINST_HOSTED_FM_IND          VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    -- ROBINST_CURRENT_PERIOD will have a constraint added after ROBPRDS table is created
    ROBINST_CURRENT_PERIOD         VARCHAR2(15 char),
    ROBINST_PERIOD_ENABLED         VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    ROBINST_DL_ADVANCE_PAY_IND     VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_DL_AP_NO_DAYS          NUMBER(1),
    ROBINST_TREQ_CODE_TEACH_ENTR   VARCHAR2(6 char),
    ROBINST_TRST_CODE_TEACH_ENTR   VARCHAR2(1 char),
    ROBINST_TREQ_CODE_GP_ENTR      VARCHAR2(6 char),
    ROBINST_TRST_CODE_GP_ENTR      VARCHAR2(1 char),
    ROBINST_REP_COURSE_IND         VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_BANINAS_INSTALLED_IND  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_FM_CODE_INSTALLED_IND  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_PERIOD_BUDGET_ENABLED  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBINST_PBGP_CODE              VARCHAR2(6 char),
    ROBINST_SURROGATE_ID           NUMBER(19)                   NOT NULL
        CONSTRAINT UK_ROBINST_SURROGATE_ID
            UNIQUE,
    ROBINST_VERSION                NUMBER(19)                   NOT NULL,
    ROBINST_DATA_ORIGIN            VARCHAR2(30 char),
    ROBINST_VPDI_CODE              VARCHAR2(6 char),
    ROBINST_SS_NAME                VARCHAR2(100 char),
    ROBINST_SS_SHORT_NAME          VARCHAR2(20 char),
    ROBINST_SS_ADDRESS_LINE_1      VARCHAR2(75 char),
    ROBINST_SS_ADDRESS_LINE_2      VARCHAR2(75 char),
    ROBINST_SS_ADDRESS_LINE_3      VARCHAR2(75 char),
    ROBINST_SS_CITY                VARCHAR2(50 char),
    ROBINST_SS_STAT_CODE           VARCHAR2(3 char),
    ROBINST_SS_ZIP                 VARCHAR2(30 char),
    ROBINST_SS_PHONE               VARCHAR2(20 char),
    ROBINST_SS_EMAIL               VARCHAR2(512 char),
    ROBINST_SS_WEB_LOGO_URL        VARCHAR2(2000 char),
    ROBINST_SS_BATCH_LOGO_FILE     VARCHAR2(2000 char),
    ROBINST_SS_CUSTOM_INFO         CLOB,
    ROBINST_SS_GRAD_RATE_6YR       NUMBER(5, 2),
    ROBINST_SS_DEFAULT_RATE        NUMBER(5, 2),
    ROBINST_SS_DEFAULT_RATE_COMP   NUMBER(5, 2),
    ROBINST_SS_FED_MEDIAN_LOAN_AMT NUMBER(9, 2),
    ROBINST_SS_FED_MEDIAN_LOAN_YR  NUMBER(3),
    ROBINST_SS_FED_LOAN_PMT_AMT    NUMBER(9, 2),
    ROBINST_AVAIL_OFFER_ONLY_IND   VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_SS_INSTITUTION_GROUP   VARCHAR2(1 char),
    ROBINST_XES_AIDY               VARCHAR2(1 char),
    ROBINST_XES_ALGO_CODE_AIDY     VARCHAR2(30 char)
        CONSTRAINT FK1_ROBINST_INV_RTVALGO
            REFERENCES FAISMGR.RTVALGO,
    ROBINST_XES_PRDS               VARCHAR2(1 char),
    ROBINST_XES_ALGO_CODE_PRDS     VARCHAR2(30 char)
        CONSTRAINT FK2_ROBINST_INV_RTVALGO
            REFERENCES FAISMGR.RTVALGO,
    ROBINST_APRD_ALGO_CODE_DEF     VARCHAR2(30 char),
    ROBINST_BUDG_DUR_FM            NUMBER(2)        DEFAULT 9          NOT NULL,
    ROBINST_CALC_PC_FM             VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_YR_IN_COLL_ALGO_CODE   VARCHAR2(30 char),
    ROBINST_ENRR_IN_PGRM_DEFAULT   VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_ENRR_REMED_DEFAULT     VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_ENRR_ESL_DEFAULT       VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_ENRR_REPEAT_DEFAULT    VARCHAR2(1 char) DEFAULT 'N'        NOT NULL,
    ROBINST_ENRR_REPEAT_NO_DEFAULT NUMBER(2)        DEFAULT 99         NOT NULL,
    ROBINST_ENRR_REMED_NO_DEFAULT  NUMBER(9, 3)     DEFAULT 999999.999 NOT NULL,
    ROBINST_REMEDIAL_LIMIT         NUMBER(9, 3)     DEFAULT 999999.999 NOT NULL,
    ROBINST_REMEDIAL_ALGO_CODE     VARCHAR2(30 char),
    ROBINST_TREQ_CODE_TEACH_EXIT   VARCHAR2(6 char),
    ROBINST_TRST_CODE_TEACH_EXIT   VARCHAR2(1 char),
    ROBINST_SYS_IND                VARCHAR2(1 char) DEFAULT 'Y'        NOT NULL,
    ROBINST_PELL_FORMULA_TYPE      VARCHAR2(1 char) DEFAULT '1'        NOT NULL,
    ROBINST_GUID                   VARCHAR2(36 char)
)
/

COMMENT ON TABLE FAISMGR.ROBINST IS 'Financial Aid Institution Table'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_CODE IS 'AID YEAR CODE: The aid year to be associated with information in this record.  EXAMPLES: 9091, 9192, 9293, etc.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_DESC IS 'AID YEAR DESCRIPTION: The description of the valid aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_START_DATE IS 'AID YEAR START DATE: This is the official start date of the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_END_DATE IS 'AID YEAR END DATE: This is the official end date of the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_START_YEAR IS 'AID YEAR START YEAR: The year and century of the Aid Year Start date.  Example: If the Aid Year Start Date = 01-JUL-1990, then Aid Year Start Year = 1990.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AIDY_END_YEAR IS 'AID YEAR END YEAR: The year and century of the Aid Year End date.  Example: If the Aid Year End Date = 30-JUN-1991, then Aid Year End Year = 1991.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_STATUS_IND IS 'AID YEAR STATUS CODE: This code defines if this Aid Year is an active year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_BUDG_AUDIT_IND IS 'BUDGET AUDIT TRAIL INDICATOR: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_NEED_AUDIT_IND IS 'NEED ANALYSIS AUDIT TRAIL INDICATOR: This indicator is used to define if the institution wishes to log changes to selected fields in the Need Analysis module.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PCKG_AUDIT_IND IS 'PACKAGING AUDIT INDICATOR: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_AUDIT_IND IS 'PELL CORRECTION AUDIT INDICATOR: This indicator is used to define if the institution wishes to log changes for electronic pell corrections.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_APPL_DATE_IND IS 'APPLICATION RECEIVE DATE INDICATOR: This field identifies which date the institution wishes to use as the application receipt date.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TFC_PRO_IND IS 'TOTAL FAMILY CONTRIBUTION PRORATION: This code indicates whether the institution wishes to use TFC proration based on the percentage of year identified by the aid period in budgeting. This indicator is no longer valid as of the 2011-2012 aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PAYVOCH_REQ_IND IS 'CREATE PAYMENT VOUCHER PRIOR TO PAYMENT: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_METHOD_IND IS 'METHODOLOGY INDICATOR: This code specifies the primary methodology that the institution uses in the processing of applications.  Examples: Federal Methodology or Institutional Methodology.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INFC_CODE IS 'INTERFACE CODE: The code of the originating source of records from outside agencies.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INAS_OPTION IS 'INAS OPTION: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_EST IS 'REQUIREMENT TRACKING ESTABLISHED STATUS CODE: This field maintains the tracking status code which means the requirement has been established.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_BGRP_CODE IS 'DEFAULT BUDGET GROUP: This field identifies the default budget group.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TGRP_CODE IS 'DEFAULT TRACKING GROUP CODE: This code identifies the default tracking group.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PGRP_CODE IS 'DEFAULT PACKAGING GROUP: This field identifies the default packaging group.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_APPL IS 'APPLICATION REQUIREMENT CODE: This code is the institution''s defined tracking requirement code for an institutional application.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_APRD_CODE_DEF IS 'DEFAULT AID PERIOD: This field defines the default aid period.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SAPR_CODE IS 'INITIAL SAP CODE: This field is defined as the SAP Status Code assigned to a student when that student''s first RORSAPR record is created.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FINAID_DIR_NAME IS 'FINANCIAL AID DIRECTOR: The financial aid director''s name.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_SAR IS 'SAR REQUIREMENT CODE: This code identifies the requirement tracking code for the Student Aid Report in RTVTREQ.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CURRENT_TERM_CODE IS 'CURRENT TERM CODE: This code identifies which term the institution is currently in.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_SAR IS 'SAR SATISFIED STATUS: This is the Requirement Tracking Status code which the institution wishes to be associated with the SAR tracking requirement code upon certification of the SAR.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FINAID_DIR_PHONE_AREA IS 'AREA CODE: The area code of the financial aid director''s phone number.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FINAID_DIR_PHONE_NO IS 'PHONE NUMBER: The phone number of the Financial Aid Director.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_ID IS 'MAIN CAMPUS PELL ID: This field identifies the Pell ID number for the main campus.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENTITY_ID IS 'MAIN CAMPUS ENTITY ID: This field carries the institution''s Pell Entity ID number for the main campus.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SERV_AGENT_CDE IS 'SERVICE AGENT CODE: An optional field used to identify the Service Agent chosen by the institution to process its Electronic Data Exchange data.  The code is assigned by the U.S.  Dept.  of Ed.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SBGI_CONV_IND IS 'SBGI CONVERSION INDICATOR: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INST_SBGI_CODE IS 'INSTITUTIONAL SBGI CODE: This field identifies the source background associated with the Institution.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DL_SCHOOL_CODE IS 'DIRECT LOAN SCHOOL CODE:This is the school code assigned by the Department of Education to schools participating in Direct Lending'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DEST_NUMBER IS 'GES DESTINATION NUMBER: This is the 5 character  GES destination code assigned to each institution in the TGxxxxx format.  The xxxxx represents the 5 character  GES destination code.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INFO_ACCESS_IND IS 'INFORMATION ACCESS INDICATOR: A Y in this field indicates that the information for this aid year may be accessed via Voice Response, Banner Web and similar methods.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DFLT_MSG_EXP_DAYS IS 'DEFAULT MESSAGE EXPIRATION DAYS: The number of days until a message expires, to be used as a default value when messages are created.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INAS_NON_CUST IS 'WHICH NON-CUSTODIAL PARENTAL CONTRIBUTION: Indicates which (reported or calculated/override) non-custodial PC should be passed to INAS.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_UPD_TRAN_IND IS 'UPDATE TRANSACTION NUMBER INDICATOR:  Indicates when data load process should update the Pell Transaction Number and EFC.  A or blank - Always, N - Never, L - Update unless locked.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_LOAN_PROCESS_TYPE IS 'LOAN PROCESS TYPE: Indicates which types of loans the institution processes: (D)irect, (E)lectronic, (B)oth, or (N)either.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SAPR_CODE_EXCEPT IS 'EXCEPTION SAP CODE: This field is defined as the SAP Status Code assigned to a student if that student fails to meet all existing SAP Status Code Rules.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PIVOT_DATE IS 'PIVOT DATE: The date on which Banner should start using the aid year code of this record as the global aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DL_AFFIRM_IND IS 'DL AFFIRMATION PILOT INDICATOR: This field indicates whether the school participates in the DL Affirmation Pilot Program and chooses to prevent disbursements of Direct Loans to borrowers who do not authorize the disbursement of funds under the MPN.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FORMER_HEAL_IND IS 'HEALTH PROFESSION PROGRAMS AMOUNT INDICATOR: Indicates that HPPA loan limits will be used to determine annual eligibility for Stafford Loans for those students whose HPPA Indicator is set on RORSTAT.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CASH_MONITOR_IND IS 'CASH MONITORING OR REIMBURSEMENT CLASSIFICATION INDICATOR: Indicates whether the institution must follow cash monitoring rules established by the Department of Education. Valid values Y, blank.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_JUST_IN_TIME_IND IS 'PELL JIT AND ADVANCE PAY INDICATOR:  Indicates if the school wants JIT/Advance Pay disbursement edits applied to Pell disbursements.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_RED_ELIG_IND IS 'PELL REDUCED ELIGIBILITY INDICATOR:  Indicator to be used by the RPEPELL process to determine whether or not to set the Pell Origination Indicator if Pell eligibility is reduced.  Valid values are Y and blank.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_ENTER_INTV IS 'ENTRANCE INTERVIEW REQUIREMENT CODE: The requirement code that will be used for Stafford Loan Entrance Interviews.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_EXIT_INTV IS 'EXIT INTERVIEW REQUIREMENT CODE: The requirement code that will be used for Exit Interviews.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_JIT_NO_DAYS IS 'JIT AND ADVANCE PAY NUMBER OF DAYS:  The number of days prior to the scheduled disbursement date that an authorized Pell disbursement can be extracted when using JIT or Advance Pay disbursement edits.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_EL_SCHOOL_CDE IS 'EL SCHOOL CODE: This is the Dept of Ed school code to be used for Electronic Loan processing for this specific campus.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_MYN_ELIGIBLE IS 'MULTI-YEAR NOTE ELIGIBILITY INDICATOR: This field indicates whether the school is eligible to use the multi-year functionality for the MPN. This field should be unchecked if the school has elected not to use or is not eligible for the multi-year function
ality.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_EL_BRANCH_CDE IS 'EL BRANCH ID: The 2-digit campus ID associated with the 6-digit school code assigned by the Dept of Ed.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_APPL_DATE_SOURCE IS 'MDE SOURCE OF APPLICATION RECEIVED DATE: The source of the data that will be used to update the Application Received date.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ALTERNATE_PELL_IND IS 'ALTERNATE PELL SCHEDULE INDICATOR: No longer used after the 2007-2008 aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_EL_AUDIT_IND IS 'CHANGE TRANSACTION INDICATOR: Flags whether or not the school will use CommonLine Change Transaction processing. Default value is Null. Valid values: Y yes, Null means No.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_EL_AUDIT_NO_DAYS IS 'CHANGE TRANSACTION UPDATE DEFAULT NUMBER OF DAYS: Minimum number of days allowed prior to a scheduled disbursement to send Change Transaction record. This number will be used as the default number of days.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TITLE_IV_RET_IND IS 'INSTITUTIONAL DEFAULT RETURN OF TITLE IV FUNDS RETURN INDICATOR: Indicates whether the institution has optionally decided to return funds on the student''s behalf to the Title IV programs. Valid values are Y and Null.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TITLE_IV_ROUND_IND IS 'INSTITUTIONAL DEFAULT RETURN OF TITLE IV FUNDS ROUNDING INDICATOR: Indicates whether or not the final repayment amounts that the institution and the student are each responsible to return are rounded to the nearest dollar. Valid values are Y and Null.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_ENTER_INTV IS 'ENTRANCE INTERVIEW SATISFIED STATUS CODE: The status code that will indicate that the Stafford Loan Entrance Interview requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_EXIT_INTV IS 'EXIT INTERVIEW SATISFIED STATUS CODE: The status code that will indicate that the Exit Interview requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_NEW_PELL_CALC_IND IS 'TURN ON NEW PELL CALCULATION: No longer used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FULL_PARTICIPANT_IND IS 'FULL PARTICIPANT INDICATOR: Identifies schools that are participating in the COD program as Full Participants.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_COMMON_SCHOOL_ID IS 'ROUTING NUMBER: The entity ID unique to this institution. Formerly Common School ID.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TURN_OFF_PELL_IND IS 'INDICATOR TO TURN OFF PELL PROCESS: Indicator used to prevent Pell process from automatically running from forms for any students at this institution. Set to Y to prevent.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_FUND_CODE IS 'DEFAULT PELL FUND CODE: The primary Pell fund code to use when there are more than one Pell fund defined on RFRBASE, and the applicant is not assigned to a campus that has a unique Pell fund associated with it.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DL_COD_FP_IND IS 'DIRECT LOAN FULL PARTICIPANT INDICATOR: Identifies schools that are participating in the COD program as Full Participants for Direct Loans.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_COD_FP_IND IS 'PELL FULL PARTICIPANT INDICATOR: Identifies schools that are participating in the COD program as Full Participants for Pell.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_LT_HALF_IND IS 'PELL LESS THAN HALF INDICATOR: Indicator to turn on the new Pell less than half-time budget calculation.  Set to Y to calculate Pell less than half-time budgets using RTVCOMP budget components designated as eligible for Pell less than half-time.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_RESCHED_DISB_DATE_IND IS 'RESCHEDULE DISBURSEMENT DATE: Indicator to reschedule the disbursement dates for non-loan funds based on the Disbursement Date Offset rules when one of the Award Forms is entered and as part of the Disbursement process. Valid values Y and null. Default =
 null.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_MULTI_YR_PERK_MPN_FLAG IS 'USING MULTI-AWARD YEARS PERKINS MPN FLAG: Checking this flag indicates the institution is using the option for multi-award years Perkins MPN.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_APPLY_FYFTB_RULE_IND IS 'APPLY FIRST-YEAR FIRST-TIME BORROWER RULE INDICATOR: Indicates that the first-year, first-time borrower rule should apply to Stafford loans.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FED_SCHOOL_CODE IS 'MAIN CAMPUS FEDERAL SCHOOL CODE:  The main campus Federal School Code for the institution.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_OPEID IS 'MAIN CAMPUS OPEID: The OPEID for the institution''s main campus.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_OPEID_BRANCH IS 'MAIN CAMPUS OPEID BRANCH: The OPEID Branch number for the institution''s main campus.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_GRANT_ADVANCE_PAY_IND IS 'ACG AND SMART ADVANCE PAY INDICATOR:  Indicates if the school wants Advance Pay disbursement edits applied to ACG and SMART disbursements.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_GRANT_AP_NO_DAYS IS 'ACG AND SMART ADVANCE PAY NUMBER OF DAYS:  The number of days prior to the scheduled disbursement date that an authorized ACG or SMART disbursement can be extracted when using Advance Pay disbursement edits.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_UPD_LOCKED_AWARD_IND IS 'UPDATE LOCKED AWARD INDICATOR: Indicates if updates to the award status may be made when a fund lock or period lock exists.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_INTL_IND IS 'INTERNATIONALIZATION INDICATOR: Specifies the usage of international data lengths for Financial Aid processing.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CTRY_CODE_PHONE IS 'TELEPHONE COUNTRY CODE: Financial Aid Director''s telephone code designating the region or country.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CREATE_ROBNYUD_IND IS 'CREATE APPLICANT NON YEAR USER-DEFINED DATA INDICATOR:  Indicates whether an Applicant Non Year User-Defined Data Record should be created when an Applicant Status Record is created.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CREATE_ROBUSDF_IND IS 'CREATE APPLICANT USER-DEFINED DATA INDICATOR:  Indicates whether an Applicant User-Defined Data Record should be created when an Applicant Status Record is created.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TERM_CODE_SAP IS 'INITIAL SAP TERM CODE:  The term code assigned to the student when the student''s first Satisfactory Academic Progress Rules record is created.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_RETENTION_EXPIRED_IND IS 'RETENTION POLICY EXPIRED INDICATOR:  Indicates whether the retention policy has expired for the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_RETENTION_DATE IS 'RETENTION POLICY DATE:  The date the retention policy expired.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ARCHIVE_DATE IS 'ARCHIVE DATE:  The first date data was archived for the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FM_IM_FLG IS 'NEED ANALYSIS FM IM FLAG: This flag is used to define if the institution wishes to run either (F)M, (I)M or (B)oth calculations.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_HOSTED_FM_IND IS 'HOSTED FM NEED ANALYSIS INDICATOR:  Indicates if the institution wishes to run the FM calculation through the hosted FM solution.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CURRENT_PERIOD IS 'CURRENT PERIOD: The period the institution is currently in.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PERIOD_ENABLED IS 'PERIOD ENABLED: Indicates that periods are fully enabled for the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DL_ADVANCE_PAY_IND IS 'DIRECT LOAN ADVANCE PAY INDICATOR:  Indicates if the school wants Advance Pay disbursement edits applied to Direct Loan disbursements.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DL_AP_NO_DAYS IS 'DIRECT LOAN ADVANCE PAY NUMBER OF DAYS:  The number of days prior to the scheduled disbursement date that an authorized Direct Loan disbursement can be extracted when using Advance Pay disbursement edits.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_TEACH_ENTR IS 'ENTRANCE INTERVIEW REQUIREMENT CODE: The requirement code that will be used for TEACH Grant Entrance Interviews.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_TEACH_ENTR IS 'ENTRANCE INTERVIEW SATISFIED STATUS CODE: The status code that will indicate that the TEACH Grant Entrance Interview requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_GP_ENTR IS 'ENTRANCE INTERVIEW REQUIREMENT CODE: The requirement code that will be used for Graduate PLUS Loan Entrance Interviews.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_GP_ENTR IS 'ENTRANCE INTERVIEW SATISFIED STATUS CODE: The status code that will indicate that the Graduate PLUS Loan Entrance Interview requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_REP_COURSE_IND IS 'REPEAT COURSE CHECKING FOR THE AID YEAR INDICATOR: Not currently used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_BANINAS_INSTALLED_IND IS 'BANINAS IM NEED INSTALLED: The INAS IM Need calculation installed status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_FM_CODE_INSTALLED_IND IS 'BANNER FM NEED INSTALLED: The Banner FM Need calculation installed status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PERIOD_BUDGET_ENABLED IS 'PERIOD BUDGETING ENABLED: Indicates whether period budgeting is enabled for the aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PBGP_CODE IS 'DEFAULT PERIOD BUDGET GROUP CODE: The default budget group code for period budgeting.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_NAME IS 'NAME: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_SHORT_NAME IS 'SHORT NAME: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_ADDRESS_LINE_1 IS 'ADDRESS LINE 1: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_ADDRESS_LINE_2 IS 'ADDRESS LINE 2: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_ADDRESS_LINE_3 IS 'ADDRESS LINE 3: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_CITY IS 'CITY: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_STAT_CODE IS 'STATE CODE: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_ZIP IS 'ZIP CODE: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_PHONE IS 'PHONE NUMBER: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_EMAIL IS 'EMAIL ADDRESS: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_WEB_LOGO_URL IS 'WEB LOGO URL: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_BATCH_LOGO_FILE IS 'BATCH LOGO FILE: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_CUSTOM_INFO IS 'CUSTOM INFORMATION: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_GRAD_RATE_6YR IS 'GRADUATION RATE: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_DEFAULT_RATE IS 'LOAN DEFAULT RATE: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_DEFAULT_RATE_COMP IS 'LOAN DEFAULT RATE FOR COMPARABLE INSTITUTIONS: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_FED_MEDIAN_LOAN_AMT IS 'FEDERAL MEDIAN LOAN AMOUNT: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_FED_MEDIAN_LOAN_YR IS 'FEDERAL MEDIAN LOAN YEAR: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_FED_LOAN_PMT_AMT IS 'FEDERAL MEDIAN LOAN PAYMENT AMOUNT: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_AVAIL_OFFER_ONLY_IND IS 'USE OFFERED ONLY TO CALCULATE AVAILABLE TO OFFER INDICATOR: Indicates if cancelled and declined funds are included in the available to offer calculation.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SS_INSTITUTION_GROUP IS 'INSTITUTION GROUP: This field is currently not used.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_XES_AIDY IS 'AID YEAR DEFAULT EXPECTED ENROLLMENT STATUS: The default aid year expected enrollment status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_XES_ALGO_CODE_AIDY IS 'AID YEAR DEFAULT EXPECTED ENROLLMENT STATUS RULE CODE: The default aid year algorithmic rule code used to calculate the expected enrollment status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_XES_PRDS IS 'PERIOD DEFAULT EXPECTED ENROLLMENT STATUS: The default period expected enrollment status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_XES_ALGO_CODE_PRDS IS 'PERIOD DEFAULT EXPECTED ENROLLMENT STATUS RULE CODE: The default period algorithmic rule code used to calculate the expected enrollment status.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_APRD_ALGO_CODE_DEF IS 'DEFAULT AID PERIOD RULE CODE: The algorithmic rule code used to calculate the default aid period.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_BUDG_DUR_FM IS 'FM BUDGET DURATION: The default number of months for which students are enrolled during the school year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_CALC_PC_FM IS 'CALCULATE FM PC FOR INDEPENDENT STUDENT: Indicates if a FM parental contribution should be calculated for an independent student.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_YR_IN_COLL_ALGO_CODE IS 'DEFAULT YEAR IN COLLEGE RULE CODE: The default algorithmic rule code used to calculate the year in college.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_IN_PGRM_DEFAULT IS 'ENROLLMENT RULE IN PROGRAM DEFAULT: The default value used when the course cannot be determined to be in the student''s program.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_REMED_DEFAULT IS 'ENROLLMENT RULES REMEDIAL DEFAULT: The default value used when the course cannot be determined to be remedial.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_ESL_DEFAULT IS 'ENROLLMENT RULES ESL DEFAULT: The default value used when the course cannot be determined to be ESL.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_REPEAT_DEFAULT IS 'ENROLLMENT RULES REPEAT DEFAULT: The default value used when the course cannot be determined if repeated.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_REPEAT_NO_DEFAULT IS 'ENROLLMENT RULES REPEAT NUMBER DEFAULT: The default number of time the course has been repeated when unable to determine if the course is repeated.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_ENRR_REMED_NO_DEFAULT IS 'ENROLLMENT RULES REMEDIAL NUMBER DEFAULT: The default number of remedial hours used when unable to determine if the course is remedial.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_REMEDIAL_LIMIT IS 'REMEDIAL LIMIT: The number of hours representing one academic year.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_REMEDIAL_ALGO_CODE IS 'REMEDIAL LIMIT RULE CODE: The default algorithmic rule code used to calculate the remedial limit.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TREQ_CODE_TEACH_EXIT IS 'EXIT COUNSELING REQUIREMENT CODE: The code to be used for TEACH Grant Exit Counseling.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_TRST_CODE_TEACH_EXIT IS 'EXIT COUNSELING SATISFIED STATUS CODE: The code to indicate the TEACH Grant Exit Counseling requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_SYS_IND IS 'SYSTEM INDICATOR: Indicates how the financial aid year record was created; either by the system or manually.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_PELL_FORMULA_TYPE IS 'PELL FORMULA TYPE: The Pell Formula Type that is used to define which Pell Formulas are used at the school.'
/

COMMENT ON COLUMN FAISMGR.ROBINST.ROBINST_GUID IS 'GUID: GUID storage for Financial Aid Institution Table'
/

CREATE INDEX ROBINST_GUID_INDEX1
    ON FAISMGR.ROBINST (ROBINST_GUID)
/