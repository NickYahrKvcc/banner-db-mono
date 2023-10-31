GRANT REFERENCES ON SATURN.STVTERM TO TAISMGR
/

CREATE TABLE TAISMGR.TBBDETC
(
    TBBDETC_DETAIL_CODE       VARCHAR2(4 char)             NOT NULL
        CONSTRAINT PK_TBBDETC
            PRIMARY KEY,
    TBBDETC_DESC              VARCHAR2(30 char)            NOT NULL,
    TBBDETC_TYPE_IND          VARCHAR2(1 char)             NOT NULL,
    TBBDETC_PRIORITY          VARCHAR2(3 char)             NOT NULL,
    TBBDETC_LIKE_TERM_IND     VARCHAR2(1 char),
    TBBDETC_DCAT_CODE         VARCHAR2(3 char)
        CONSTRAINT FK1_TBBDETC_INV_TTVDCAT_CODE
            REFERENCES TAISMGR.TTVDCAT,
    TBBDETC_AMOUNT            NUMBER(7, 2),
    TBBDETC_TERM_CODE         VARCHAR2(6 char)
        CONSTRAINT FK1_TBBDETC_INV_STVTERM_CODE
            REFERENCES SATURN.STVTERM,
    TBBDETC_EFFECTIVE_DATE    DATE,
    TBBDETC_REFUNDABLE_IND    VARCHAR2(1 char),
    TBBDETC_RECEIPT_IND       VARCHAR2(1 char),
    TBBDETC_REFUND_IND        VARCHAR2(1 char),
    TBBDETC_ACTIVITY_DATE     DATE                         NOT NULL,
    TBBDETC_PAYT_CODE         VARCHAR2(1 char)
        CONSTRAINT FK1_TBBDETC_INV_TTVPAYT_CODE
            REFERENCES TAISMGR.TTVPAYT,
    TBBDETC_PREBILL_PRINT_IND VARCHAR2(1 char),
    TBBDETC_GL_NOS_ENTERABLE  VARCHAR2(1 char),
    TBBDETC_TAXT_CODE         VARCHAR2(2 char)
        CONSTRAINT FK1_TBBDETC_INV_TTVTAXT_CODE
            REFERENCES TAISMGR.TTVTAXT,
    TBBDETC_TBDC_IND          VARCHAR2(1 char),
    TBBDETC_DETAIL_CODE_IND   VARCHAR2(1 char),
    TBBDETC_DETC_ACTIVE_IND   VARCHAR2(1 char)             NOT NULL,
    TBBDETC_DIRD_IND          VARCHAR2(1 char)             NOT NULL,
    TBBDETC_TIV_IND           VARCHAR2(1 char)             NOT NULL,
    TBBDETC_INST_CHG_IND      VARCHAR2(1 char)             NOT NULL,
    TBBDETC_LIKE_AIDY_IND     VARCHAR2(1 char)             NOT NULL,
    TBBDETC_PAYHIST_IND       VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    TBBDETC_ABDC_IND          VARCHAR2(1 char)             NOT NULL,
    TBBDETC_LIKE_PERIOD_IND   VARCHAR2(1 char)             NOT NULL,
    TBBDETC_SURROGATE_ID      NUMBER(19)                   NOT NULL
        CONSTRAINT UK_TBBDETC_SURROGATE_ID
            UNIQUE,
    TBBDETC_VERSION           NUMBER(19)                   NOT NULL,
    TBBDETC_USER_ID           VARCHAR2(30 char),
    TBBDETC_DATA_ORIGIN       VARCHAR2(30 char),
    TBBDETC_VPDI_CODE         VARCHAR2(6 char)
)
/

COMMENT ON TABLE TAISMGR.TBBDETC IS 'Detail Charge/Payment Code Definition Table'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DETAIL_CODE IS 'This field identifies the detail code associated with every charge and payment that can be entered onto an account.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DESC IS 'This field specifies a free-format description of the detail code.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_TYPE_IND IS 'This field indicates the whether the detail code is a charge or a payment.  Valid values are: C - Charge, P - Payment.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_PRIORITY IS 'This field indicates the priority of the detail code for use in the application of payments process.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_LIKE_TERM_IND IS 'This field indicates if a detail code can only be applied to a detail code in the same term in the application of payment process.  Valid value is: Y - Yes, only apply to a like term.  Used primarily for financial aid.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DCAT_CODE IS 'This field identifies the catagory of the detail code.  Detail codes can be group for reporting purposes into catagories like cash, tuition, etc.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_AMOUNT IS 'This field specifies the default amount associated with the detail code.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_TERM_CODE IS 'This field identifies the default term code associated with the detail code.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_EFFECTIVE_DATE IS 'This field specifies the default effective date associated with the detail code.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_REFUNDABLE_IND IS 'Refundable Indicator: Y to include credit amount in refund process (TFRRFND/TSRRFND) and to include in Location Management refund calculations; null if not selected.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_RECEIPT_IND IS 'This field indicates if a receipt number should be automatically generated when the detail code is entered on an account.  Valid values are: Y - Yes, generate a receipt, blank - No receipt number.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_REFUND_IND IS 'This field indicates if the detail code is identified as refund detail code that will generate an accounts payable transaction in the accounting feed.  Valid values are: Y - Generate accounts payable transaction, blank - Do not.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_ACTIVITY_DATE IS 'This field specifies the most current date record was created or updated.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_PAYT_CODE IS 'This field indicates the type of payment the detail code is.  Default value is N - Non-cash.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_PREBILL_PRINT_IND IS 'Should this detail code be printed on a student invoice.  Valid values are: N (Do not print) or blank.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_GL_NOS_ENTERABLE IS 'Can accounting distribution information be overridden for miscellaneous transactions on the TFAMISC form.  Values are Y and N.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_TAXT_CODE IS 'This field indicates that this tuition fee is eligible for a specified tax type'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_TBDC_IND IS 'Indicates whether a detail code is associated with a term-based designator (Y/N).'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DETAIL_CODE_IND IS 'DETAIL CODE INDICATOR: This column defines a detail code indicator. Valid values are : (B)ill, (P)ayment, (T)ransfer, (R)efund, Null.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DETC_ACTIVE_IND IS 'DETC_ACTIVE_IND: Active Status Indicator of the Detail Code.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DIRD_IND IS 'DIRECT DEPOSIT REFUND INDICATOR: Indicator used to determine whether refund code is to be processed through direct deposit payment, (Y)es and (N)o.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_TIV_IND IS 'TITLE IV INDICATOR: This field indicates if the detail code is identified as Title IV detail code. Valid value is: (Y)es, Title IV detail code, and (N)o.  This is used primarily by the application of payment process and Refund Process.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_INST_CHG_IND IS 'INSTITUTION CHARGE INDICATOR: This field indicates if the detail code is identified as Institutional Charges detail code. Valid value is: (Y)es, Institutional charge detail code, and (N)o. This is used by the application of payment process.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_LIKE_AIDY_IND IS 'AID YEAR INDICATOR: This field indicates if a detail code can only be applied to a transaction in the same aid year.  Valid values: (Y)es, apply only to a like aid year, and (N)o; Used primarily for financial aid transactions.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_PAYHIST_IND IS 'Display transactions with this detail code in Payment History (Y = display, N = do not display).'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_ABDC_IND IS 'AID YEAR BASED INDICATOR: Indicates whether a detail code is associated with an aid year-based designator (Y/N).'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_LIKE_PERIOD_IND IS 'LIKE PERIOD INDICATOR: This field indicates if a detail code can only be applied to a transaction in the same Financial Aid Enrollment Period. Valid values:(Y)es, apply only to a like enrollment period, and (N)o; Used for financial aid transactions.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN TAISMGR.TBBDETC.TBBDETC_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

CREATE INDEX TBBDETC_INDEX3
    ON TAISMGR.TBBDETC (TBBDETC_DETAIL_CODE, TBBDETC_DCAT_CODE)
/