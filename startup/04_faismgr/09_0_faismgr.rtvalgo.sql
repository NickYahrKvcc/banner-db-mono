CREATE TABLE FAISMGR.RTVALGO
(
    RTVALGO_CODE          VARCHAR2(30 char)            NOT NULL
        CONSTRAINT PK_RTVALGO
            PRIMARY KEY,
    RTVALGO_DESC          VARCHAR2(200 char)           NOT NULL,
    RTVALGO_ACTIVE_IND    VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVALGO_ACTIVITY_DATE DATE,
    RTVALGO_USER_ID       VARCHAR2(30 char),
    RTVALGO_DATA_ORIGIN   VARCHAR2(30 char),
    RTVALGO_SURROGATE_ID  NUMBER(19),
    RTVALGO_VERSION       NUMBER(19),
    RTVALGO_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE FAISMGR.RTVALGO IS 'General Algorithmic Rule Validation Table.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_CODE IS 'RULE CODE: The rule code associated with the particular algorithmic rule.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_DESC IS 'RULE CODE DESCRIPTION: The description for the algorithmic rule code.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the rule code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_DATA_ORIGIN IS 'DATA ORIGIN: The latest source for the data contained in this record.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_SURROGATE_ID IS 'SURROGATE ID: The surrogate id for this record.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_VERSION IS 'VERSION: The optimistic lock token for this record.'
/

COMMENT ON COLUMN FAISMGR.RTVALGO.RTVALGO_VPDI_CODE IS 'VPDI CODE: The code representing the entity to which this record belongs to for Multi-entity Processing support.'
/