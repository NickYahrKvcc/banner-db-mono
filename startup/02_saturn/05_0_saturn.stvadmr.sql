CREATE TABLE SATURN.STVADMR
(
    STVADMR_CODE          VARCHAR2(4 char)             NOT NULL
        CONSTRAINT PK_STVADMR
            PRIMARY KEY,
    STVADMR_DESC          VARCHAR2(30 char)            NOT NULL,
    STVADMR_TABLE_NAME    VARCHAR2(7 char),
    STVADMR_ACTIVITY_DATE DATE                         NOT NULL,
    STVADMR_VR_MSG_NO     NUMBER(6),
    STVADMR_VR_ELIG_IND   VARCHAR2(1 char),
    STVADMR_DISP_WEB_IND  VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    STVADMR_SURROGATE_ID  NUMBER(19)                   NOT NULL
        CONSTRAINT UK_STVADMR_SURROGATE_ID
            UNIQUE,
    STVADMR_VERSION       NUMBER(19)                   NOT NULL,
    STVADMR_USER_ID       VARCHAR2(30 char),
    STVADMR_DATA_ORIGIN   VARCHAR2(30 char),
    STVADMR_VPDI_CODE     VARCHAR2(6 char),
    STVADMR_GUID          VARCHAR2(36 char)
)
/

COMMENT ON TABLE SATURN.STVADMR IS 'Admission Request Code Validation Table'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_CODE IS 'This field identifies the request code associated with required admissions      materials referenced in the Admissions Module.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_DESC IS 'This field specifies the documents/materials (e.g. high school transcripts,   residency papers, etc.) associated with the request code, which are required  to support an application for admission.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_TABLE_NAME IS 'This field identifies the validation table against which the requested        material is validated.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_ACTIVITY_DATE IS 'This field identifies the most current date a record was created or updated.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_VR_MSG_NO IS 'The Voice Response message number assigned to the recorded message that describes the Admission request code.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_VR_ELIG_IND IS 'This field indicates whether the request code is to be spoken to the student via Voice Response. N - Do not speak this request code.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_DISP_WEB_IND IS 'Display on Web Indicator.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN SATURN.STVADMR.STVADMR_GUID IS 'GUID storage'
/

CREATE INDEX STVADMR_GUID_INDEX1
    ON SATURN.STVADMR (STVADMR_GUID)
/