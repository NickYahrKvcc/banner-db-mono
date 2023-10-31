GRANT REFERENCES ON GENERAL.GTVCCRD TO TAISMGR
/

CREATE TABLE TAISMGR.TBRACCD
(
    TBRACCD_PIDM                 NUMBER(8)         NOT NULL,
    TBRACCD_TRAN_NUMBER          NUMBER(8)         NOT NULL,
    TBRACCD_TERM_CODE            VARCHAR2(6 char)  NOT NULL,
    TBRACCD_DETAIL_CODE          VARCHAR2(4 char)  NOT NULL
        CONSTRAINT FK2_TBRACCD_INV_TBBDETC_CODE
            REFERENCES TAISMGR.TBBDETC,
    TBRACCD_USER                 VARCHAR2(30 char) NOT NULL,
    TBRACCD_ENTRY_DATE           DATE              NOT NULL,
    TBRACCD_AMOUNT               NUMBER(12, 2)     NOT NULL,
    TBRACCD_BALANCE              NUMBER(12, 2)     NOT NULL,
    TBRACCD_EFFECTIVE_DATE       DATE              NOT NULL,
    TBRACCD_BILL_DATE            DATE,
    TBRACCD_DUE_DATE             DATE,
    TBRACCD_DESC                 VARCHAR2(30 char),
    TBRACCD_RECEIPT_NUMBER       NUMBER(8),
    TBRACCD_TRAN_NUMBER_PAID     NUMBER(8),
    TBRACCD_CROSSREF_PIDM        NUMBER(8),
    TBRACCD_CROSSREF_NUMBER      NUMBER(8),
    TBRACCD_CROSSREF_DETAIL_CODE VARCHAR2(4 char)
        CONSTRAINT FK1_TBRACCD_INV_TBBDETC_CODE
            REFERENCES TAISMGR.TBBDETC,
    TBRACCD_SRCE_CODE            VARCHAR2(1 char)  NOT NULL
        CONSTRAINT FK1_TBRACCD_INV_TTVSRCE_CODE
            REFERENCES TAISMGR.TTVSRCE,
    TBRACCD_ACCT_FEED_IND        VARCHAR2(1 char)  NOT NULL,
    TBRACCD_ACTIVITY_DATE        DATE              NOT NULL,
    TBRACCD_SESSION_NUMBER       NUMBER            NOT NULL,
    TBRACCD_CSHR_END_DATE        DATE,
    TBRACCD_CRN                  VARCHAR2(5 char),
    TBRACCD_CROSSREF_SRCE_CODE   VARCHAR2(1 char)
        CONSTRAINT FK2_TBRACCD_INV_TTVSRCE_CODE
            REFERENCES TAISMGR.TTVSRCE,
    TBRACCD_LOC_MDT              VARCHAR2(1 char),
    TBRACCD_LOC_MDT_SEQ          NUMBER(2),
    TBRACCD_RATE                 NUMBER(12, 6),
    TBRACCD_UNITS                NUMBER(12, 6),
    TBRACCD_DOCUMENT_NUMBER      VARCHAR2(8 char),
    TBRACCD_TRANS_DATE           DATE,
    TBRACCD_PAYMENT_ID           VARCHAR2(20 char),
    TBRACCD_INVOICE_NUMBER       VARCHAR2(8 char),
    TBRACCD_STATEMENT_DATE       DATE,
    TBRACCD_INV_NUMBER_PAID      VARCHAR2(8 char),
    TBRACCD_CURR_CODE            VARCHAR2(4 char),
    TBRACCD_EXCHANGE_DIFF        NUMBER(12, 2),
    TBRACCD_FOREIGN_AMOUNT       NUMBER(12, 2),
    TBRACCD_LATE_DCAT_CODE       VARCHAR2(3 char)
        CONSTRAINT FK1_TBRACCD_INV_TTVDCAT_CODE
            REFERENCES TAISMGR.TTVDCAT,
    TBRACCD_FEED_DATE            DATE,
    TBRACCD_FEED_DOC_CODE        VARCHAR2(8 char),
    TBRACCD_ATYP_CODE            VARCHAR2(2 char),
    TBRACCD_ATYP_SEQNO           NUMBER(2),
    TBRACCD_CARD_TYPE_VR         VARCHAR2(1 char),
    TBRACCD_CARD_EXP_DATE_VR     DATE,
    TBRACCD_CARD_AUTH_NUMBER_VR  VARCHAR2(12 char),
    TBRACCD_CROSSREF_DCAT_CODE   VARCHAR2(3 char),
    TBRACCD_ORIG_CHG_IND         VARCHAR2(1 char),
    TBRACCD_CCRD_CODE            VARCHAR2(10 char)
        CONSTRAINT FK_TBRACCD_INV_GTVCCRD_CODE
            REFERENCES GENERAL.GTVCCRD,
    TBRACCD_MERCHANT_ID          VARCHAR2(20 char),
    TBRACCD_TAX_REPT_YEAR        NUMBER(4),
    TBRACCD_TAX_REPT_BOX         VARCHAR2(2 char),
    TBRACCD_TAX_AMOUNT           NUMBER(12, 2),
    TBRACCD_TAX_FUTURE_IND       VARCHAR2(1 char),
    TBRACCD_DATA_ORIGIN          VARCHAR2(30 char),
    TBRACCD_CREATE_SOURCE        VARCHAR2(30 char),
    TBRACCD_CPDT_IND             VARCHAR2(1 char),
    TBRACCD_AIDY_CODE            VARCHAR2(4 char),
    TBRACCD_STSP_KEY_SEQUENCE    NUMBER(2),
    TBRACCD_PERIOD               VARCHAR2(15 char),
    TBRACCD_SURROGATE_ID         NUMBER(19)        NOT NULL
        CONSTRAINT UK_TBRACCD_SURROGATE_ID
            UNIQUE,
    TBRACCD_VERSION              NUMBER(19)        NOT NULL,
    TBRACCD_USER_ID              VARCHAR2(30 char),
    TBRACCD_VPDI_CODE            VARCHAR2(6 char),
    TBRACCD_TAX_REPT_BOX_PR      VARCHAR2(2 char),
    TBRACCD_TAX_REPT_BOX_SG      VARCHAR2(2 char),
    TBRACCD_TAX_FUTURE_IND_PR    VARCHAR2(1 char),
    TBRACCD_TAX_FUTURE_IND_SG    VARCHAR2(1 char),
    CONSTRAINT PK_TBRACCD
        PRIMARY KEY (TBRACCD_PIDM, TBRACCD_TRAN_NUMBER)
)
/

COMMENT ON TABLE TAISMGR.TBRACCD IS 'Account Charge/Payment Detail Table'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_PIDM IS 'Internal Identification Number of the person or non-person account, valid in SPRIDEN.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TRAN_NUMBER IS 'Transaction number (one-up within entity) of the transaction.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TERM_CODE IS 'Term associated with the transaction. For student transactions valid in STVTERM, or ARTERM for non-student transactions.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_DETAIL_CODE IS 'Detail code associated with the transaction, valid in TBBDETC.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_USER IS 'User ID of the cashier who created the transaction.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ENTRY_DATE IS 'Entry date and time of the transaction, when initially created.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_AMOUNT IS 'Amount of the transaction. '
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_BALANCE IS 'Balance remaining for the transaction, as adjusted by the application of payment process.  A negative balance is a credit on the account; a positive balance is a charge.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_EFFECTIVE_DATE IS 'Effective date of the transaction used to calculate amount due, determine placement on the bill, and control feed to finance system based on Accounts Receivable System Control setting.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_BILL_DATE IS 'Date that the transaction is billed.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_DUE_DATE IS 'Due date set when the transaction is billed.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_DESC IS 'Free-form description associated with the transaction.  Default value comes from the Detail Code description (TBBDETC).'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_RECEIPT_NUMBER IS 'Receipt number associated with the transaction, if generated when the transaction was created.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TRAN_NUMBER_PAID IS 'Transaction Number Paid is used in application of payment to force this transaction to liquidate a specific transaction on the account.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CROSSREF_PIDM IS 'Cross Reference internal identification number. Associates student and third party sponsor (source code C) or student and lender (source code F), valid in SPRIDEN.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CROSSREF_NUMBER IS 'Cross Reference Number for third party transactions (contract number when source code is C), exemption credits (exemption number when source code is E), or deposits released (deposit transaction number
 when source code is D).'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CROSSREF_DETAIL_CODE IS 'Cross Reference Detail Code for contract or exemption credits calculated based on detail code rules, valid in TBBDETC.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_SRCE_CODE IS 'Source of the transaction when created on the account, including registration, housing, deposit, user entered, and so on.  The default value is user entered transaction (T), valid in TTVSRCE.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ACCT_FEED_IND IS 'Status of the transaction in the accounting feed.  Valid values are: Y - Feed transaction, F - Transaction fed, N - Do not feed transaction.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ACTIVITY_DATE IS 'The last date this row was created or updated.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_SESSION_NUMBER IS 'Cashier session number in which this transaction was posted (0 = current session).'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CSHR_END_DATE IS 'End date and time of the cashiering session for this transaction.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CRN IS 'Course Reference Number (CRN) of the course which generated the charge, when Track by CRN is used in Fee Assessment.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CROSSREF_SRCE_CODE IS 'Cross Reference Source for contract or exemption credits, valid in TTVSRCE.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_LOC_MDT IS 'Location Management Type.  Valid values are M for monthly charges, T for term-based charges, or D for daily charges.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_LOC_MDT_SEQ IS 'Location Management sequence in which monthly charges were added.  Used in subsequent processing to calculate adjustments.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_RATE IS 'A per-unit rate used to calculate the amount. Optional for non-student transactions; not allowed for student transactions.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_UNITS IS 'Number of Units is multiplied by the specified Rate to calculate the amount. Optional for non-student transactions; not allowed for student transactions.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_DOCUMENT_NUMBER IS 'Document number that references a source document for the transaction.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TRANS_DATE IS 'Transaction date used by the finance system to control posting to the ledgers.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_PAYMENT_ID IS 'Free-form information identifying a payment; often used to record check or credit card number.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_INVOICE_NUMBER IS 'Invoice Number identifies a group of charges invoiced via one statement.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_STATEMENT_DATE IS 'The date a statement was generated.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_INV_NUMBER_PAID IS 'Invoice Number Paid is used in application of payment to force a payment to liquidate a specific group of charges.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CURR_CODE IS 'Foreign currency code used when creating a payment, valid in GTVCURR and GURCURR.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_EXCHANGE_DIFF IS 'Exchange difference between a foreign currency amount as of the date entered and the value 1) as of the bill date when processed with Invoice Number Paid or 2) as of the charge transaction date when proc
essed with Transaction Number Paid.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_FOREIGN_AMOUNT IS 'Amount of the transaction stated in foreign currency.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_LATE_DCAT_CODE IS 'Category of the late charge detail code, valid in TTVDCAT.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_FEED_DATE IS 'Date this transaction was fed to the finance system.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_FEED_DOC_CODE IS 'Document code used to feed this transaction to the finance system.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ATYP_CODE IS 'In combination with ATYP_SEQNO, the address where the bill for this transaction will be sent. Required for non-student transactions; not allowed for student transactions. Valid in STVATYP.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ATYP_SEQNO IS 'In combination with ATYP_CODE, the address where the bill for this transaction will be sent. Required for non-student transactions; not allowed for student transactions. Combination valid and active in SPRA
DDR.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CARD_TYPE_VR IS 'Credit Card Type used for Voice Response messages, valid in TTVCCRD.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CARD_EXP_DATE_VR IS 'Credit card expiration date supplied at time of credit card payment.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CARD_AUTH_NUMBER_VR IS 'Credit card authorization number received when transaction was processed.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CROSSREF_DCAT_CODE IS 'Cross Reference Category Code for contract or exemption credits calculated based on category code rules, valid in TTVDCAT.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_ORIG_CHG_IND IS 'Indicates that the transaction is to be considered as an original charge for the Title IV recalculation process, as opposed to subsequent adjustments due to withdrawal.  Valid values are Y (original) or n
ull.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CCRD_CODE IS 'Code identifying Credit Card Type used in authorizations via gateway, valid in GTVCCRD.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_MERCHANT_ID IS 'Merchant ID associated with the Process Name Code, Credit Card Type Code, and System Code.  The Merchant ID is included in the credit card payment request transmitted to the vendor handling credit card pay
ments.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_REPT_YEAR IS 'Tax Year in which the transaction was reported on form 1098-T.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_REPT_BOX IS 'TAX REPORT BOX: Tax Report Box in which the transaction was reported on form 1098T for tax year prior to 2018 or towards max amount for Payments Received after 2017. Values (CB) Qualified Charges Billed, (AC) Adjustments to Prior Charges.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_AMOUNT IS 'Tax Amount as reported on form 1098-T.  Sign relates pay type to report box, and may be pro-rated based on allocation rules.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_FUTURE_IND IS 'TAX FUTURE IND: Tax Report Future Indicator is valued with Y if the transaction was reported on form 1098-T as a term beginning in a future tax year for rule CB, or null.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_DATA_ORIGIN IS 'Source system that last created or updated the data.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CREATE_SOURCE IS 'Source system that initially created the record.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_CPDT_IND IS 'Indicates that contract payment detail is used for application of a payment to contract charges (Y or NULL).'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_AIDY_CODE IS 'AID YEAR: The aid year associated with the Financial Aid disbursement.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_STSP_KEY_SEQUENCE IS 'STUDY PATH SEQUENCE: Key sequence of the study path for the course registration.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_PERIOD IS 'PERIOD: The enrollment period code for the.Financial Aid disbursement.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_REPT_BOX_PR IS 'TAX REPT BOX PR: Tax Report Box in which the transaction was eligible for reporting on the form 1098T. Values (PR) Qualified Payments Received, (AP) Adjustments to Payments Received.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_REPT_BOX_SG IS 'TAX REPT BOX SG: Tax Report Box in which the transaction was reported on the form 1098T. Values (SG) Scholarship or Grant, (AS) Adjustments to Scholarship or Grant.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_FUTURE_IND_PR IS 'TAX FUTURE IND PR: Tax Report Future Indicator is valued with Y if the transaction was reported on form 1098-T as a term beginning in a future tax year for rule PR, or null.'
/

COMMENT ON COLUMN TAISMGR.TBRACCD.TBRACCD_TAX_FUTURE_IND_SG IS 'TAX FUTURE IND SG: Tax Report Future Indicator is valued with Y if the transaction was reported on form 1098-T as a term beginning in a future tax year for rule SG, or null.'
/

CREATE INDEX TBRACCD_APPL_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_BALANCE, TBRACCD_PIDM)
/

CREATE INDEX TBRACCD_CREDITS_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_TERM_CODE, TBRACCD_PIDM, TBRACCD_CROSSREF_NUMBER, TBRACCD_CROSSREF_PIDM)
/

CREATE INDEX TBRACCD_CSHR_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_SESSION_NUMBER, TBRACCD_USER, TBRACCD_CSHR_END_DATE)
/

CREATE INDEX TBRACCD_INVOICE_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_INVOICE_NUMBER, TBRACCD_PIDM)
/

CREATE INDEX TBRACCD_RECEIPT_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_RECEIPT_NUMBER)
/

CREATE INDEX TBRACCD_RECON_INDEX
    ON TAISMGR.TBRACCD (TBRACCD_FEED_DOC_CODE)
/

CREATE INDEX TBRACCD_APPL_INDEX2
    ON TAISMGR.TBRACCD (TBRACCD_PIDM, TBRACCD_DETAIL_CODE, TBRACCD_TERM_CODE, TBRACCD_SRCE_CODE,
                        TBRACCD_STSP_KEY_SEQUENCE,
                        TBRACCD_AMOUNT)
/