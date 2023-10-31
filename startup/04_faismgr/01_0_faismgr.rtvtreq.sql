CREATE TABLE FAISMGR.RTVTREQ
(
    RTVTREQ_CODE                  VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVTREQ
            PRIMARY KEY,
    RTVTREQ_SHORT_DESC            VARCHAR2(20 char)            NOT NULL,
    RTVTREQ_LONG_DESC             VARCHAR2(60 char)            NOT NULL,
    RTVTREQ_ACTIVITY_DATE         DATE,
    RTVTREQ_ONCE_IND              VARCHAR2(1 char),
    RTVTREQ_PCKG_IND              VARCHAR2(1 char),
    RTVTREQ_DISB_IND              VARCHAR2(1 char),
    RTVTREQ_MEMO_IND              VARCHAR2(1 char),
    RTVTREQ_ACCESS_IND            VARCHAR2(1 char),
    RTVTREQ_VR_MSG_NO             NUMBER(6),
    RTVTREQ_INFO_ACCESS_IND       VARCHAR2(1 char),
    RTVTREQ_SATISFY_ALL_IND       VARCHAR2(1 char),
    RTVTREQ_URL                   VARCHAR2(255 char),
    RTVTREQ_PERK_MPN_FLAG         VARCHAR2(1 char),
    RTVTREQ_LTR_EXCLUDE_IND       VARCHAR2(1 char),
    RTVTREQ_UPDATE_PRIOR_YEAR_IND VARCHAR2(1 char),
    RTVTREQ_INSTRUCTIONS          VARCHAR2(2000 char),
    RTVTREQ_ACTIVE_IND            VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVTREQ_USER_ID               VARCHAR2(30 char),
    RTVTREQ_TERM_ELIGIBLE_IND     VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    RTVTREQ_USE_FED_FUND_ID_IND   VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    RTVTREQ_SURROGATE_ID          NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVTREQ_SURROGATE_ID
            UNIQUE,
    RTVTREQ_VERSION               NUMBER(19)                   NOT NULL,
    RTVTREQ_DATA_ORIGIN           VARCHAR2(30 char),
    RTVTREQ_VPDI_CODE             VARCHAR2(6 char)
)
/

COMMENT ON TABLE FAISMGR.RTVTREQ IS 'Tracking Requirements Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_CODE IS 'TRACKING REQUIREMENT CODE: This code is used to define tracking requirements and/or documents.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_SHORT_DESC IS 'TRACKING REQUIREMENT SHORT DESCRIPTION: The short description of the tracking code.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_LONG_DESC IS 'TRACKING REQUIREMENT LONG DESCRIPTION: The long description of the tracking code.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_ONCE_IND IS 'REQUIRED ONCE INDICATOR: This indicator is used to define whether the tracking code is required to be satisfied only once during the students enrollment.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_PCKG_IND IS 'REQUIRED FOR PACKAGING INDICATOR: This indicator is used to define whether the tracking code is required and must be satisfied for packaging.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_DISB_IND IS 'REQUIRED FOR DISBURSEMENT INDICATOR: This indicator is used to define whether the tracking code is required and must be satisfied for disbursement.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_MEMO_IND IS 'MEMO INDICATOR: This indicator is used to define whether the tracking code is required and must be satisfied in order for the fund to show as a credit memo in accounts receivable.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_ACCESS_IND IS 'ACCESS INDICATOR: This field indicates whether external access to this Tracking Requirements code is allowed by other products/systems/applications. The value Y in this field indicates that this access is permitted.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_VR_MSG_NO IS 'The Voice Response message number assigned to the recorded message that describes the tracking requirement code'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_INFO_ACCESS_IND IS 'INFORMATION ACCESS INDICATOR: Defines what Tracking requirements can be seen on Web. Valid values are Y and N. Default is N.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_SATISFY_ALL_IND IS 'SATISFY ALL INSTANCES OF THE SAME TRACKING CODE: Identifies tracking requirements that can be updated simultaneously with the satisfaction of one record. Valid values are Y and N. Default is N.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_URL IS 'URL: This is the URL (Universal Resource Locator) address associated with a particular tracking requirement used to satisfy that requirement on the web.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_PERK_MPN_FLAG IS 'PERKINS MPN FLAG: Checked indicates the requirement is a Perkins MPN.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_LTR_EXCLUDE_IND IS 'TRACKING LETTER EXCLUSION INDICATOR: Indicates if the requirement should be excluded from the tracking letter.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_UPDATE_PRIOR_YEAR_IND IS 'UPDATE PRIOR YEAR INDICATOR: Indicates if a satisfy once requirement will have the status updated for prior years.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_INSTRUCTIONS IS 'REQUIREMENT CODE INSTRUCTIONS:  Instructions for this requirement code that will be displayed for the student in Self-Service.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the requirements tracking code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_TERM_ELIGIBLE_IND IS 'PERIOD ELIGIBLE INDICATOR: Indicates if the requirement can have a period associated with it.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_USE_FED_FUND_ID_IND IS 'USE FEDERAL FUND ID INDICATOR:  Indicates if the federal fund id can be used to satisfy the requirement.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVTREQ.RTVTREQ_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

CREATE INDEX RTVTREQ_ONCE_INDEX
    ON FAISMGR.RTVTREQ (RTVTREQ_ONCE_IND)
/