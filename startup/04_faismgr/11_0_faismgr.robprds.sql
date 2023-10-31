CREATE TABLE FAISMGR.ROBPRDS
(
    ROBPRDS_PERIOD          VARCHAR2(15 char)            NOT NULL
        CONSTRAINT PK_ROBPRDS
            PRIMARY KEY,
    ROBPRDS_DESC            VARCHAR2(30 char)            NOT NULL,
    ROBPRDS_START_DATE      DATE                         NOT NULL,
    ROBPRDS_END_DATE        DATE                         NOT NULL,
    ROBPRDS_AIDY_CODE       VARCHAR2(4 char)             NOT NULL
        CONSTRAINT FK1_ROBPRDS_INV_ROBINST_KEY
            REFERENCES FAISMGR.ROBINST,
    ROBPRDS_SEQ_NO          NUMBER(8)                    NOT NULL
        CONSTRAINT ROBPRDS_UNIQUE_SEQ_NO
            UNIQUE,
    ROBPRDS_ACAD_YEAR       VARCHAR2(10 char)            NOT NULL,
    ROBPRDS_CROSSOVER_IND   VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    ROBPRDS_ACTIVE_IND      VARCHAR2(1 char) DEFAULT 'Y' NOT NULL,
    ROBPRDS_AIDY_CODE_CROSS VARCHAR2(4 char)
        CONSTRAINT FK2_ROBPRDS_INV_ROBINST_KEY
            REFERENCES FAISMGR.ROBINST,
    ROBPRDS_COMMENT         VARCHAR2(240 char),
    ROBPRDS_ACTIVITY_DATE   DATE,
    ROBPRDS_USER_ID         VARCHAR2(30 char),
    ROBPRDS_DATA_ORIGIN     VARCHAR2(30 char),
    ROBPRDS_SURROGATE_ID    NUMBER(19),
    ROBPRDS_VERSION         NUMBER(19),
    ROBPRDS_VPDI_CODE       VARCHAR2(6 char),
    ROBPRDS_WEEKS           NUMBER(3)
)
/

COMMENT ON TABLE FAISMGR.ROBPRDS IS 'Period Base Table'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_PERIOD IS 'PERIOD: The code to define the enrollment or payment period for this record.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_DESC IS 'PERIOD DESCRIPTION: The description of the enrollment or payment period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_START_DATE IS 'PERIOD START DATE: The start date of this enrollment or payment period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_END_DATE IS 'PERIOD END DATE: The end date of this enrollment or payment period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_AIDY_CODE IS 'AID YEAR CODE: The aid year to be associated with information in this record.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_SEQ_NO IS 'PERIOD SEQUENCE NUMBER: The relative order of the period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_ACAD_YEAR IS 'ACADEMIC YEAR: The academic year associated with the enrollment or payment period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_CROSSOVER_IND IS 'CROSSOVER INDICATOR: Indicates this enrollment or payment period is for summer crossover and may be associated with more than one aid year.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_ACTIVE_IND IS 'ACTIVE INDICATOR: Indicates whether the period is active.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_AIDY_CODE_CROSS IS 'CROSSOVER AID YEAR CODE: The aid year code to which the term code is being assigned as a crossover term in addition to the financial aid processing year defined in ROBPRDS_AIDY_CODE.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_COMMENT IS 'PERIOD COMMENT: The comment associated with the enrollment or payment period.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.ROBPRDS.ROBPRDS_WEEKS IS 'PERIOD WEEKS: The number of instructional weeks in the period.'
/