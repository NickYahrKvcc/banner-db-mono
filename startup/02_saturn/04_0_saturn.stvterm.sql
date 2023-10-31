CREATE TABLE SATURN.STVTERM
(
    STVTERM_CODE               VARCHAR2(6 char)  NOT NULL
        CONSTRAINT PK_STVTERM
            PRIMARY KEY,
    STVTERM_DESC               VARCHAR2(30 char) NOT NULL,
    STVTERM_START_DATE         DATE              NOT NULL,
    STVTERM_END_DATE           DATE              NOT NULL,
    STVTERM_FA_PROC_YR         VARCHAR2(4 char),
    STVTERM_ACTIVITY_DATE      DATE              NOT NULL,
    STVTERM_FA_TERM            VARCHAR2(1 char),
    STVTERM_FA_PERIOD          NUMBER(2),
    STVTERM_FA_END_PERIOD      NUMBER(2),
    STVTERM_ACYR_CODE          VARCHAR2(4 char)  NOT NULL
        CONSTRAINT FK1_STVTERM_INV_STVACYR_CODE
            REFERENCES SATURN.STVACYR,
    STVTERM_HOUSING_START_DATE DATE              NOT NULL,
    STVTERM_HOUSING_END_DATE   DATE              NOT NULL,
    STVTERM_SYSTEM_REQ_IND     VARCHAR2(1 char),
    STVTERM_TRMT_CODE          VARCHAR2(1 char)
        CONSTRAINT FK1_STVTERM_INV_STVTRMT_CODE
            REFERENCES SATURN.STVTRMT,
    STVTERM_FA_SUMMER_IND      VARCHAR2(1 char),
    STVTERM_SURROGATE_ID       NUMBER(19)        NOT NULL
        CONSTRAINT UK_STVTERM_SURROGATE_ID
            UNIQUE,
    STVTERM_VERSION            NUMBER(19)        NOT NULL,
    STVTERM_USER_ID            VARCHAR2(30 char),
    STVTERM_DATA_ORIGIN        VARCHAR2(30 char),
    STVTERM_VPDI_CODE          VARCHAR2(6 char),
    STVTERM_GUID               VARCHAR2(36 char),
    STVTERM_CATALOG_GUID       VARCHAR2(36 char),
    STVTERM_APPORT_CDE         VARCHAR2(1 char),
    STVTERM_MIS_TERM_CTG       VARCHAR2(1 char),
    STVTERM_MIS_TERM_ID        VARCHAR2(3 char),
    STVTERM_TERM_LEN_MULT      NUMBER(5, 2),
    STVTERM_TERM_LEN_MULT_IS   NUMBER(5, 2)
)
/

COMMENT ON TABLE SATURN.STVTERM IS 'Term Code Validation Table'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_CODE IS 'This field identifies the term code referenced in the Catalog, Recruiting, Admissions, Gen. Student, Registration, Student Billing and Acad. Hist. Modules. Reqd. value: 999999 - End of Time.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_DESC IS 'This field specifies the term associated with the term code. The term is identified by the academic year and term number and is formatted YYYYTT.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_START_DATE IS 'This field identifies the term start date and is formatted DD-MON-YY.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_END_DATE IS 'This field identifies the term end date and is fomatted DD-MON-YY.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_FA_PROC_YR IS 'This field identifies the financial aid processing start and end years (e.g. The financial aid processing year 1988 - 1989 is formatted 8889.).'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_FA_TERM IS 'This field identifies the financial aid award term.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_FA_PERIOD IS 'This field identifies the financial aid award beginning period.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_FA_END_PERIOD IS 'This field identifies the financial aid award ending period.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_ACYR_CODE IS 'This field is not currently in use.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_HOUSING_START_DATE IS 'Housing Start Date.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_HOUSING_END_DATE IS 'Housing End Date.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_SYSTEM_REQ_IND IS 'System Required Indicator'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_TRMT_CODE IS 'Term type for this term. Will default from SHBCGPA_TRMT_CODE.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_FA_SUMMER_IND IS 'SUMMER INDICATOR: Indicates a summer term to financial aid.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_GUID IS 'GUID: Global Unique Identifier to uniquely identify the record of a resource for integration.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_CATALOG_GUID IS 'GUID: Global Unique Identifier to uniquely identify academic catalog.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_APPORT_CDE IS 'APPORTIONMENT CATEGORY: Valid values are (null) = the same as "N", "N" = not reported (skipped on apportionment reports), "1" = first primary term, "2" = second primary term, "3" = third primary term, "I" = intersession term.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_MIS_TERM_CTG IS 'MIS TERM CATALOG: Obsolete; will be dropped from the table at a future date.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_MIS_TERM_ID IS 'MIS TERM INDICATOR: 3-character; user-entered; the field is mandatory when adding new terms or updating existing terms (This entry is used in the majority of the MIS Reports as field GI03 TERM-IDENTIFIER).'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_TERM_LEN_MULT IS 'TERM LENGTH MULTIPLIER: Optional, but required if STVTERM_APPORT_CDE not in ("N",null); 999.99 valid values.'
/

COMMENT ON COLUMN SATURN.STVTERM.STVTERM_TERM_LEN_MULT_IS IS 'TERM LENGTH MULTIPLIER IS: Independent study term length multiplier for apportionment reporting and calculation of FTES.'
/

CREATE INDEX STVTERM_AIDY_INDEX
    ON SATURN.STVTERM (STVTERM_FA_PROC_YR, STVTERM_CODE)
/

CREATE UNIQUE INDEX STVTERM_ACYR_INDEX
    ON SATURN.STVTERM (STVTERM_ACYR_CODE, STVTERM_CODE)
/

CREATE INDEX STVTERM_START_DATE_INDEX
    ON SATURN.STVTERM (STVTERM_START_DATE)
/

CREATE INDEX STVTERM_END_DATE_INDEX
    ON SATURN.STVTERM (STVTERM_END_DATE)
/

CREATE INDEX STVTERM_GUID_INDEX1
    ON SATURN.STVTERM (STVTERM_CATALOG_GUID)
/

CREATE INDEX STVTERM_GUID_INDEX2
    ON SATURN.STVTERM (STVTERM_GUID)
/