CREATE TABLE TAISMGR.TTVDCAT
(
    TTVDCAT_CODE          VARCHAR2(3 char)  NOT NULL
        CONSTRAINT PK_TTVDCAT
            PRIMARY KEY,
    TTVDCAT_DESC          VARCHAR2(30 char) NOT NULL,
    TTVDCAT_ACTIVITY_DATE DATE              NOT NULL,
    TTVDCAT_SYSREQ_IND    VARCHAR2(1 char),
    TTVDCAT_VR_MSG_NO     NUMBER(6),
    TTVDCAT_SURROGATE_ID  NUMBER(19)        NOT NULL
        CONSTRAINT UK_TTVDCAT_SURROGATE_ID
            UNIQUE,
    TTVDCAT_VERSION       NUMBER(19)        NOT NULL,
    TTVDCAT_USER_ID       VARCHAR2(30 char),
    TTVDCAT_DATA_ORIGIN   VARCHAR2(30 char),
    TTVDCAT_VPDI_CODE     VARCHAR2(6 char),
    TTVDCAT_GUID          VARCHAR2(36 char)
)
/

COMMENT ON TABLE TAISMGR.TTVDCAT IS 'Detail Charge/Payment Category Code Validation Table'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_CODE IS 'This field identifies the detail charge/payment category code referenced by Student Bill Mod.  Reqd vals: APF - Admis Applicatn Chgs, FA - Fin Aid, FEE - Registr.  Fees, HOU - Housing, TUI - Registr.  Tuition, TRN - Transcript Fee.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_DESC IS 'This field specifies the free-format detail category associated with the detail category code.  Used to group charges/payments together for billing reporting purposes.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_SYSREQ_IND IS 'A "Y" indicates that the corresponding code is required by BANNER.  Removal may cause unpredictable results.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_VR_MSG_NO IS 'Voice Response(VR) message number assigned to the recorded message that describes the category code.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN TAISMGR.TTVDCAT.TTVDCAT_GUID IS 'GUID: Global Unique Identifier to uniquely identify the record of a resource for integration.'
/

CREATE INDEX TTVDCAT_GUID_INDEX1
    ON TAISMGR.TTVDCAT (TTVDCAT_GUID)
/