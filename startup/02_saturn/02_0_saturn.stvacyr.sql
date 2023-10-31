CREATE TABLE SATURN.STVACYR
(
    STVACYR_CODE          VARCHAR2(4 char) NOT NULL
        CONSTRAINT PK_STVACYR
            PRIMARY KEY,
    STVACYR_DESC          VARCHAR2(30 char),
    STVACYR_ACTIVITY_DATE DATE             NOT NULL,
    STVACYR_SYSREQ_IND    VARCHAR2(1 char),
    STVACYR_SURROGATE_ID  NUMBER(19)       NOT NULL
        CONSTRAINT UK_STVACYR_SURROGATE_ID
            UNIQUE,
    STVACYR_VERSION       NUMBER(19)       NOT NULL,
    STVACYR_USER_ID       VARCHAR2(30 char),
    STVACYR_DATA_ORIGIN   VARCHAR2(30 char),
    STVACYR_VPDI_CODE     VARCHAR2(6 char),
    STVACYR_START_DATE    DATE,
    STVACYR_END_DATE      DATE
)
/

COMMENT ON TABLE SATURN.STVACYR IS 'Academic Year Validation Table'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_CODE IS 'Identifies the abbreviation for the beginning/ ending periods for academic year referenced in the General Student, Academic History, Degree Audit Modules. Format CCYY (e.g. 1995-1996 coded 1996).'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_DESC IS 'This field specifies the academic year associated with the academic year code.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_ACTIVITY_DATE IS 'This field identifies the most current date a record was created or updated.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_SYSREQ_IND IS 'The system required indicator'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_START_DATE IS 'ACADEMIC YEAR START DATE: This field identifies the academic year start date.'
/

COMMENT ON COLUMN SATURN.STVACYR.STVACYR_END_DATE IS 'ACADEMIC YEAR END DATE: This field identifies the academic year end date.'
/