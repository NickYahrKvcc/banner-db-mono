GRANT REFERENCES ON GENERAL.GTVLETR TO FAISMGR
/

CREATE TABLE FAISMGR.RTVSAPR
(
    RTVSAPR_CODE          VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVSAPR
            PRIMARY KEY,
    RTVSAPR_DESC          VARCHAR2(30 char)            NOT NULL,
    RTVSAPR_PCKG_IND      VARCHAR2(1 char)             NOT NULL,
    RTVSAPR_DISB_IND      VARCHAR2(1 char)             NOT NULL,
    RTVSAPR_AID_TYPE      NUMBER(2)                    NOT NULL,
    RTVSAPR_ACTIVITY_DATE DATE,
    RTVSAPR_VR_MSG_NO     NUMBER(6),
    RTVSAPR_LETR_CODE     VARCHAR2(15 char)
        CONSTRAINT FK1_RTVSAPR_INV_GTVLETR_CODE
            REFERENCES GENERAL.GTVLETR,
    RTVSAPR_PRIORITY      NUMBER(6),
    RTVSAPR_ACTIVE_IND    VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVSAPR_USER_ID       VARCHAR2(30 char),
    RTVSAPR_SURROGATE_ID  NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVSAPR_SURROGATE_ID
            UNIQUE,
    RTVSAPR_VERSION       NUMBER(19)                   NOT NULL,
    RTVSAPR_DATA_ORIGIN   VARCHAR2(30 char),
    RTVSAPR_VPDI_CODE     VARCHAR2(6 char),
    RTVSAPR_GUID          VARCHAR2(36 char)
)
/

COMMENT ON TABLE FAISMGR.RTVSAPR IS 'Satisfactory Academic Progress Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_CODE IS 'SATISFACTORY ACADEMIC PROGRESS CODE: This code defines various codes related to the academic progress of applicants and aid recipients.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_DESC IS 'SATISFACTORY ACADEMIC PROGRESS CODE DESCRIPTION: The description of the SAP codes.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_PCKG_IND IS 'PREVENT PACKAGING INDICATOR: This field indicates whether the SAP code prevents the packaging of the indicated types of aid.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_DISB_IND IS 'PREVENT DISBURSEMENT INDICATOR: This field indicates whether the SAP code should prevent disbursement of the indicated types of aid.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_AID_TYPE IS 'PREVENT WHICH AID TYPE:  This field indicates which type(s) of aid the SAP code will prevent from packaging and/or disbursing.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_VR_MSG_NO IS 'VOICE RESPONSE MESSAGE NUMBER: The Voice Response message number assigned to the recorded message that describes the academic progress code.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_LETR_CODE IS 'LETTER CODE: Default code of the letter to be posted when attaining the corresponding SAP Status. Letter code references GTVLETR table.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_PRIORITY IS 'SAP CODE PRIORITY: The priority order in which SAP codes are assigned to students; lowest priority numbers are assigned first.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the satisfactory academic progress code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.RTVSAPR.RTVSAPR_GUID IS 'GUID: Global Unique Identifier to uniquely identify the record of a resource for integration.'
/

CREATE INDEX RTVSAPR_GUID_INDEX1
    ON FAISMGR.RTVSAPR (RTVSAPR_GUID)
/