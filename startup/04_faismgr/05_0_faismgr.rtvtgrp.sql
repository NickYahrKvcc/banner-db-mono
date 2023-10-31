CREATE TABLE FAISMGR.RTVTGRP
(
    RTVTGRP_CODE          VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVTGRP
            PRIMARY KEY,
    RTVTGRP_DESC          VARCHAR2(30 char)            NOT NULL,
    RTVTGRP_PRIORITY      NUMBER(6)                    NOT NULL,
    RTVTGRP_ACTIVITY_DATE DATE,
    RTVTGRP_ACTIVE_IND    VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVTGRP_USER_ID       VARCHAR2(30 char),
    RTVTGRP_SURROGATE_ID  NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVTGRP_SURROGATE_ID
            UNIQUE,
    RTVTGRP_VERSION       NUMBER(19)                   NOT NULL,
    RTVTGRP_DATA_ORIGIN   VARCHAR2(30 char),
    RTVTGRP_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE FAISMGR.RTVTGRP IS 'Tracking Group Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_CODE IS 'TRACKING GROUP CODE: This code is used to define groups of students who require the same set of documents/requirements.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_DESC IS 'TRACKING GROUP DESCRIPTION: The description of the tracking group code.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_PRIORITY IS 'TRACKING GROUP PRIORITY: The priority order in which tracking group codes are assigned to students; lowest priority numbers are assigned first.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the requirements tracking group code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVTGRP.RTVTGRP_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/