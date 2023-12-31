CREATE TABLE FAISMGR.RTVAPRD
(
    RTVAPRD_CODE               VARCHAR2(6 char)             NOT NULL
        CONSTRAINT PK_RTVAPRD
            PRIMARY KEY,
    RTVAPRD_DESC               VARCHAR2(30 char)            NOT NULL,
    RTVAPRD_FULL_YR_PCT        NUMBER(6, 3),
    RTVAPRD_TFC_PCT            NUMBER(6, 3)     DEFAULT 100 NOT NULL,
    RTVAPRD_ACTIVITY_DATE      DATE,
    RTVAPRD_PELL_FULL_YR_PCT   NUMBER(6, 3),
    RTVAPRD_GRANT_FULL_YR_PCT  NUMBER(6, 3),
    RTVAPRD_USER_ID            VARCHAR2(30 char),
    RTVAPRD_PELL_CROSSOVER_IND VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    RTVAPRD_SURROGATE_ID       NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RTVAPRD_SURROGATE_ID
            UNIQUE,
    RTVAPRD_VERSION            NUMBER(19)                   NOT NULL,
    RTVAPRD_DATA_ORIGIN        VARCHAR2(30 char),
    RTVAPRD_VPDI_CODE          VARCHAR2(6 char),
    RTVAPRD_ACTIVE_IND         VARCHAR2(1 char) DEFAULT 'Y' NOT NULL
)
/

COMMENT ON TABLE FAISMGR.RTVAPRD IS 'Aid Period Validation Table'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_CODE IS 'AID PERIOD CODE: This code identifies particular parts of a year that students may be enrolled. Examples include: full year, academic year, summer only, etc.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_DESC IS 'AID PERIOD DESCRIPTION: This describes the aid period code and identifies what it represents.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_FULL_YR_PCT IS 'FULL YEAR PERCENT: The column has been replaced in the 8.19 Release.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_TFC_PCT IS 'TFC PERCENT: No longer used.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_PELL_FULL_YR_PCT IS 'FULL YEAR PERCENT FOR PELL: The column has been replaced in the 8.19 Release.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_GRANT_FULL_YR_PCT IS 'FULL YEAR PERCENT FOR GRANTS: The column has been replaced in the 8.19 Release. '
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_PELL_CROSSOVER_IND IS 'PELL CROSSOVER INDICATOR: No longer used.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.RTVAPRD.RTVAPRD_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the aid period code is active.'
/

CREATE INDEX RTVAPRD_FULL_INDEX
    ON FAISMGR.RTVAPRD (RTVAPRD_FULL_YR_PCT)
/