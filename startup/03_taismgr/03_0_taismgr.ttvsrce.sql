CREATE TABLE TAISMGR.TTVSRCE
(
    TTVSRCE_CODE           VARCHAR2(1 char) NOT NULL
        CONSTRAINT PK_TTVSRCE
            PRIMARY KEY,
    TTVSRCE_DESC           VARCHAR2(30 char),
    TTVSRCE_INPUT_IND      VARCHAR2(1 char),
    TTVSRCE_ACTIVITY_DATE  DATE             NOT NULL,
    TTVSRCE_SYSREQ_IND     VARCHAR2(1 char),
    TTVSRCE_AUTO_CLOSE_IND VARCHAR2(1 char) NOT NULL,
    TTVSRCE_SURROGATE_ID   NUMBER(19)       NOT NULL
        CONSTRAINT UK_TTVSRCE_SURROGATE_ID
            UNIQUE,
    TTVSRCE_VERSION        NUMBER(19)       NOT NULL,
    TTVSRCE_USER_ID        VARCHAR2(30 char),
    TTVSRCE_DATA_ORIGIN    VARCHAR2(30 char),
    TTVSRCE_VPDI_CODE      VARCHAR2(6 char)
)
/

COMMENT ON TABLE TAISMGR.TTVSRCE IS 'Billing Detail Source Validation Table'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_CODE IS 'Charge/Payment Source Code.  Reqd val: A- Adm Mod, C- Contract, D- Deposit, E- Exmptn, F-Fin Aid, H-Ac Hist, I-Inst Proc, L-Bill Late Chg, M-Memo, N-Non-Suf Fund Chg, P- Appl of Pymnt Proc, R- Reg Mod, S- Misc Trans, T- Chg/Pymt Trans.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_DESC IS 'This field specifies the charge/payment detail source associated with the source code.  Referenced in Student Billing Module.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_INPUT_IND IS 'This field indicates whether the associated charge/payment detail source is entered on the detail form.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_ACTIVITY_DATE IS 'This field identifies the most recent date a record was created or updated.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_SYSREQ_IND IS 'A "Y" indicates that the corresponding code is required by BANNER.  Removal may cause unpredictable results.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_AUTO_CLOSE_IND IS 'C permits automatic closing, F permits automatic finalizing, B permits both close and finalize, null will not allow automatic close or finalize to occur.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN TAISMGR.TTVSRCE.TTVSRCE_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/