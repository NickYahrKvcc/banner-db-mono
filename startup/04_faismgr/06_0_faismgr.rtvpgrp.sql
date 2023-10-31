CREATE TABLE FAISMGR.RTVPGRP
(
    RTVPGRP_CODE            VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVPGRP
            PRIMARY KEY,
    RTVPGRP_DESC            VARCHAR2(30 char)            NOT NULL,
    RTVPGRP_GROUP_PRIORITY  NUMBER(6)                    NOT NULL,
    RTVPGRP_AWARD_PRIORITY  NUMBER(6)                    NOT NULL,
    RTVPGRP_ACTIVITY_DATE   DATE,
    RTVPGRP_INFO_ACCESS_IND VARCHAR2(1 char)             NOT NULL
        CONSTRAINT CC_1_V_RTVPGRP_Y_OR_N
            CHECK (RTVPGRP_INFO_ACCESS_IND IN ('Y', 'N')),
    RTVPGRP_ACTIVE_IND      VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    RTVPGRP_USER_ID         VARCHAR2(30 char),
    RTVPGRP_SURROGATE_ID    NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVPGRP_SURROGATE_ID
            UNIQUE,
    RTVPGRP_VERSION         NUMBER(19)                   NOT NULL,
    RTVPGRP_DATA_ORIGIN     VARCHAR2(30 char),
    RTVPGRP_VPDI_CODE       VARCHAR2(6 char)
)
/

COMMENT ON TABLE FAISMGR.RTVPGRP IS 'Packaging Group Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_CODE IS 'PACKAGING GROUP CODE: A code which defines different possible packaging groups which applicants may fall in to in the packaging process.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_DESC IS 'PACKAGING GROUP CODE DESCRIPTION: The description of the code assigned to the packaging group.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_GROUP_PRIORITY IS 'PACKAGING GROUP PRIORITY: The priority order in which packaging group codes are assigned to students; lowest priority numbers are assigned first.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_AWARD_PRIORITY IS 'PACKAGING GROUP AWARD PRIORITY: The priority order in which the packaging process awards funds to students; packaging groups with the lowest award priority are packaged first.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_INFO_ACCESS_IND IS 'INFORMATION ACCESS INDICATOR: A ''Y'' in this field indicates that the information for this packaging group code may be accessed via Voice Response, Banner Web and similar methods.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the packaging group code is active.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVPGRP.RTVPGRP_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/