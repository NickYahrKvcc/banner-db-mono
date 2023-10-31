CREATE TABLE FAISMGR.RTVTRST
(
    RTVTRST_CODE            VARCHAR2(1 char)             NOT NULL
        CONSTRAINT PK_RTVTRST
            PRIMARY KEY,
    RTVTRST_DESC            VARCHAR2(30 char)            NOT NULL,
    RTVTRST_SAT_IND         VARCHAR2(1 char)             NOT NULL,
    RTVTRST_ACTIVITY_DATE   DATE,
    RTVTRST_VR_MSG_NO       NUMBER(6),
    RTVTRST_TRK_LTR_IND     VARCHAR2(1 char),
    RTVTRST_USER_ID         VARCHAR2(30 char),
    RTVTRST_LONG_DESC       VARCHAR2(50 char),
    RTVTRST_INFO_ACCESS_IND VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVTRST_SURROGATE_ID    NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVTRST_SURROGATE_ID
            UNIQUE,
    RTVTRST_VERSION         NUMBER(19)                   NOT NULL,
    RTVTRST_DATA_ORIGIN     VARCHAR2(30 char),
    RTVTRST_VPDI_CODE       VARCHAR2(6 char),
    RTVTRST_REQ_INSTR_IND   VARCHAR2(1 char) DEFAULT 'N' NOT NULL
)
/

COMMENT ON TABLE FAISMGR.RTVTRST IS 'Tracking Requirements Status Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_CODE IS 'TRACKING STATUS CODE: This field maintains status associated with tracking codes. Examples include: Satisfied, Established, Waived, etc.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_DESC IS 'TRACKING STATUS CODE DESCRIPTION: The description of the tracking status code.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_SAT_IND IS 'SATISFIED INDICATOR: This field indicates whether the tracking status code means that the requirement has been satisfied.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_VR_MSG_NO IS 'REFERENCE NUMBER: User defined reference number for institutional purpose.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_TRK_LTR_IND IS 'TRACKING LETTER INDICATOR: Indicates if a requirement with this status should appear on a tracking letter.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_LONG_DESC IS 'TRACKING STATUS CODE LONG DESCRIPTION: The long description of the tracking status code which will display in Self-Service.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_INFO_ACCESS_IND IS 'INFORMATION ACCESS INDICATOR: Identifies which tracking requirement statuses can display in Self-Service.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.RTVTRST.RTVTRST_REQ_INSTR_IND IS 'DISPLAY INSTRUCTIONS OPTION: Indicates whether instructions associated with the requirement should be available in Self-Service.'
/