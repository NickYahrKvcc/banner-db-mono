CREATE TABLE TAISMGR.TTVPAYT
(
    TTVPAYT_CODE           VARCHAR2(1 char)  NOT NULL
        CONSTRAINT PK_TTVPAYT
            PRIMARY KEY,
    TTVPAYT_DESC           VARCHAR2(30 char) NOT NULL,
    TTVPAYT_ACTIVITY_DATE  DATE              NOT NULL,
    TTVPAYT_SYSTEM_REQ_IND VARCHAR2(1 char),
    TTVPAYT_SURROGATE_ID   NUMBER(19),
    TTVPAYT_VERSION        NUMBER(19),
    TTVPAYT_USER_ID        VARCHAR2(30 char),
    TTVPAYT_DATA_ORIGIN    VARCHAR2(30 char),
    TTVPAYT_VPDI_CODE      VARCHAR2(6 char)
)
/

COMMENT ON TABLE TAISMGR.TTVPAYT IS 'Detail Code Payment Type Validation Table'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_CODE IS 'This field identifies the detail payment type code referenced on the Detail Code Control Form (TFADETC,TSADETC).  Reqd value: N - Non-Cash Payment Type.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_DESC IS 'This field specifies the payment description (e.g.  cash, financial aid, non-cash) associated with the detail payment type code.  Used for billing purposes.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_SYSTEM_REQ_IND IS 'A "Y" indicates that the corresponding code is required by BANNER.  Removal may cause unpredictable results.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN TAISMGR.TTVPAYT.TTVPAYT_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/