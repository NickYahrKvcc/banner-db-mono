CREATE TABLE FAISMGR.RTVBGRP
(
    RTVBGRP_CODE          VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVBGRP
            PRIMARY KEY,
    RTVBGRP_DESC          VARCHAR2(30 char)            NOT NULL,
    RTVBGRP_PRIORITY      NUMBER(6)                    NOT NULL,
    RTVBGRP_ACTIVITY_DATE DATE,
    RTVBGRP_USER_ID       VARCHAR2(30 char),
    RTVBGRP_ACTIVE_IND    VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVBGRP_SURROGATE_ID  NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVBGRP_SURROGATE_ID
            UNIQUE,
    RTVBGRP_VERSION       NUMBER(19)                   NOT NULL,
    RTVBGRP_DATA_ORIGIN   VARCHAR2(30 char),
    RTVBGRP_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE FAISMGR.RTVBGRP IS 'Budget Group Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_CODE IS 'BUDGET GROUP CODE: The code used to identify a group of students with common characteristics for budget creation.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_DESC IS 'BUDGET GROUP DESCRIPTION: Describes the budget group code and identifies what it represents.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_PRIORITY IS 'BUDGET GROUP PRIORITY: The priority order in which budget group codes are assigned to students; lowest priority numbers are assigned first.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information for this record in the table was entered or last updated'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_USER_ID IS 'USER ID: The logon ID of the user who entered or last updated this row in this table.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the budgeting group code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVBGRP.RTVBGRP_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/