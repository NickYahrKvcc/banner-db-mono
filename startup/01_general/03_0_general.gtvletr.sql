CREATE TABLE GENERAL.GTVLETR
(
    GTVLETR_CODE          VARCHAR2(15 char) NOT NULL
        CONSTRAINT PK_GTVLETR
            PRIMARY KEY,
    GTVLETR_ACTIVITY_DATE DATE              NOT NULL,
    GTVLETR_DUPL_IND      VARCHAR2(1 char)  NOT NULL,
    GTVLETR_DESC          VARCHAR2(30 char),
    GTVLETR_PRINT_COMMAND VARCHAR2(10 char),
    GTVLETR_LETR_CODE_ALT VARCHAR2(15 char)
        CONSTRAINT FK1_GTVLETR_INV_GTVLETR_CODE
            REFERENCES GENERAL.GTVLETR,
    GTVLETR_SURROGATE_ID  NUMBER(19)        NOT NULL
        CONSTRAINT UK_GTVLETR_SURROGATE_ID
            UNIQUE,
    GTVLETR_VERSION       NUMBER(19)        NOT NULL,
    GTVLETR_USER_ID       VARCHAR2(30 char),
    GTVLETR_DATA_ORIGIN   VARCHAR2(30 char),
    GTVLETR_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE GENERAL.GTVLETR IS 'Letter Process Letter Validation Table'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_CODE IS 'This field identifies the letter code referenced on the Recruiting Material Control Form (SRAMATL) and the Letter Process Form (GUALETR).'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_DUPL_IND IS 'Y = Duplicates may be printed for this letter code, N = no dups.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_DESC IS 'This field specifies the recruiting letter/material associated with the letter code.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_PRINT_COMMAND IS 'This field identifies alternate print command code (e.g.  PL - Print Landscape) for associated letter/material.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_LETR_CODE_ALT IS 'Alternate Letter code for letter codes that do not allow duplicates.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN GENERAL.GTVLETR.GTVLETR_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/