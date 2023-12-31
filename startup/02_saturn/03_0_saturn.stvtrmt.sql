CREATE TABLE SATURN.STVTRMT
(
    STVTRMT_CODE          VARCHAR2(1 char)  NOT NULL
        CONSTRAINT PK_STVTRMT
            PRIMARY KEY,
    STVTRMT_DESC          VARCHAR2(30 char) NOT NULL,
    STVTRMT_ACTIVITY_DATE DATE              NOT NULL,
    STVTRMT_SURROGATE_ID  NUMBER(19)        NOT NULL
        CONSTRAINT UK_STVTRMT_SURROGATE_ID
            UNIQUE,
    STVTRMT_VERSION       NUMBER(19)        NOT NULL,
    STVTRMT_USER_ID       VARCHAR2(30 char),
    STVTRMT_DATA_ORIGIN   VARCHAR2(30 char),
    STVTRMT_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE SATURN.STVTRMT IS 'Term Type Validation Table'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_CODE IS 'Type of term, eg.  2 - semester, 4 - quarter.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_DESC IS 'Specifies the type of term associated with term type code.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_ACTIVITY_DATE IS 'Most recent date record was created or updated.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN SATURN.STVTRMT.STVTRMT_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/