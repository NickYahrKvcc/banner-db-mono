CREATE TABLE SATURN.STVSBGI
(
    STVSBGI_CODE          VARCHAR2(6 char) NOT NULL
        CONSTRAINT PK_STVSBGI
            PRIMARY KEY,
    STVSBGI_TYPE_IND      VARCHAR2(1 char) NOT NULL,
    STVSBGI_SRCE_IND      VARCHAR2(1 char),
    STVSBGI_DESC          VARCHAR2(100),
    STVSBGI_ACTIVITY_DATE DATE             NOT NULL,
    STVSBGI_ADMR_CODE     VARCHAR2(4 char)
        CONSTRAINT FK1_STVSBGI_INV_STVADMR_CODE
            REFERENCES SATURN.STVADMR,
    STVSBGI_EDI_CAPABLE   VARCHAR2(1 char),
    STVSBGI_FICE          VARCHAR2(6 char),
    STVSBGI_VR_MSG_NO     NUMBER(6),
    STVSBGI_DISP_WEB_IND  RAW(1),
    STVSBGI_SURROGATE_ID  NUMBER(19)       NOT NULL
        CONSTRAINT UK_STVSBGI_SURROGATE_ID
            UNIQUE,
    STVSBGI_VERSION       NUMBER(19)       NOT NULL,
    STVSBGI_USER_ID       VARCHAR2(30 char),
    STVSBGI_DATA_ORIGIN   VARCHAR2(30 char),
    STVSBGI_VPDI_CODE     VARCHAR2(6 char)
)
/

COMMENT ON TABLE SATURN.STVSBGI IS 'Source/Background Inst Validation Table'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_CODE IS 'This field identifies the source/background institution code referenced in the  Recruiting, Admissions and Academic History Modules.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_TYPE_IND IS 'This field identifies the source/background institution type (e.g. college,     high school, source-only)'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_SRCE_IND IS 'This field indicates whether source/background institution is a recruiting      source.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_DESC IS 'This field specifies the source or background institution associated with the   source/background institution code.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_ADMR_CODE IS 'This field identifies required admissions request items associated with         source/background institution.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_EDI_CAPABLE IS 'Electronic Capable Institution: P - PESC/XML, E - EDI, N or Null - No'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_FICE IS 'This field holds the FICE code of the institution, for EDI, unless STVSBGI_CODE contains the FICE code.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_VR_MSG_NO IS 'The Voice Response message number assigned to the recorded message that describes the source/background institution code.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_DISP_WEB_IND IS 'Display on Web Indicator is now obsolete.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN SATURN.STVSBGI.STVSBGI_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

CREATE INDEX STVSBGI_KEY_INDEX
    ON SATURN.STVSBGI (STVSBGI_TYPE_IND, STVSBGI_CODE)
/