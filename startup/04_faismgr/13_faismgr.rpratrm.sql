CREATE TABLE FAISMGR.RPRATRM
(
    RPRATRM_AIDY_CODE          VARCHAR2(4 char)             NOT NULL
        CONSTRAINT FK1_RPRATRM_INV_ROBINST_CODE
            REFERENCES FAISMGR.ROBINST,
    RPRATRM_PIDM               NUMBER(8)                    NOT NULL,
    RPRATRM_FUND_CODE          VARCHAR2(6 char)             NOT NULL,
    RPRATRM_PERIOD             VARCHAR2(15 char)            NOT NULL
        CONSTRAINT FK1_RPRATRM_INV_ROBPRDS_KEY
            REFERENCES FAISMGR.ROBPRDS,
    RPRATRM_OFFER_AMT          NUMBER(11, 2),
    RPRATRM_OFFER_DATE         DATE,
    RPRATRM_ACTIVITY_DATE      DATE,
    RPRATRM_DISB_FINAL_IND     VARCHAR2(1 char)             NOT NULL,
    RPRATRM_DIST_PCT           NUMBER(6, 3),
    RPRATRM_MEMO_EXP_DATE      DATE,
    RPRATRM_ORIG_OFFER_AMT     NUMBER(11, 2),
    RPRATRM_ORIG_OFFER_DATE    DATE,
    RPRATRM_ACCEPT_AMT         NUMBER(11, 2),
    RPRATRM_ACCEPT_DATE        DATE,
    RPRATRM_DECLINE_AMT        NUMBER(11, 2),
    RPRATRM_DECLINE_DATE       DATE,
    RPRATRM_CANCEL_AMT         NUMBER(11, 2),
    RPRATRM_CANCEL_DATE        DATE,
    RPRATRM_AUTHORIZE_AMT      NUMBER(11, 2),
    RPRATRM_AUTHORIZE_DATE     DATE,
    RPRATRM_MEMO_AMT           NUMBER(11, 2),
    RPRATRM_MEMO_DATE          DATE,
    RPRATRM_PAID_AMT           NUMBER(11, 2),
    RPRATRM_PAID_DATE          DATE,
    RPRATRM_PCKG_LOAD_IND      VARCHAR2(1 char)             NOT NULL,
    RPRATRM_NSLDS_OVRD_IND     VARCHAR2(1 char),
    RPRATRM_PELL_AWRD_LOAD_OPT VARCHAR2(1 char),
    RPRATRM_LOCK_IND           VARCHAR2(1 char),
    RPRATRM_USER_ID            VARCHAR2(30 char),
    RPRATRM_CIP_OVERRIDE_CODE  VARCHAR2(6 char),
    RPRATRM_DATA_ORIGIN        VARCHAR2(30 char),
    RPRATRM_MAJR_OVERRIDE_CODE VARCHAR2(4 char),
    RPRATRM_OVERRIDE_DISB_RULE VARCHAR2(1 char) DEFAULT 'N' NOT NULL,
    RPRATRM_TERM_CODE          VARCHAR2(6 char),
    RPRATRM_SURROGATE_ID       NUMBER(19)                   NOT NULL
        CONSTRAINT UK_RPRATRM_SURROGATE_ID
            UNIQUE,
    RPRATRM_VERSION            NUMBER(19)                   NOT NULL,
    RPRATRM_VPDI_CODE          VARCHAR2(6 char),
    RPRATRM_AWST_CODE          VARCHAR2(4 char)             NOT NULL,
    RPRATRM_AWST_DATE          DATE                         NOT NULL,
    RPRATRM_OFFER_EXP_DATE     DATE,
    RPRATRM_BBAY_CODE          VARCHAR2(15 char),
    RPRATRM_AIDY_CODE_FUNDS    VARCHAR2(4 char),
    CONSTRAINT PK_RPRATRM
        PRIMARY KEY (RPRATRM_AIDY_CODE, RPRATRM_PIDM, RPRATRM_FUND_CODE, RPRATRM_PERIOD)
)
/

COMMENT ON TABLE FAISMGR.RPRATRM IS 'Applicant Award Schedule Table'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AIDY_CODE IS 'AID YEAR CODE: The aid year associated with the award schedule.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PIDM IS 'PIDM: The internal system generated student identification number.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_FUND_CODE IS 'FUND CODE: The fund code associated with the award schedule.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PERIOD IS 'PERIOD: The period associated with the award schedule.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_OFFER_AMT IS 'OFFERED AMOUNT: The offered dollar amount of the award for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_OFFER_DATE IS 'OFFERED DATE: The date the award was offered for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_ACTIVITY_DATE IS 'ACTIVITY DATE: The date that information in this record was entered or last updated.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_DISB_FINAL_IND IS 'DISBURSED FINAL INDICATOR: Indicates if all disbursements have been made within the period indicated.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_DIST_PCT IS 'DISTRIBUTION PERCENT: The distribution percent of the award for the period.  This column will be made obsolete in the future.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_MEMO_EXP_DATE IS 'MEMO EXPIRATION DATE: The date the memo of this award for this period will be cancelled.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_ORIG_OFFER_AMT IS 'ORIGINAL OFFERED AMOUNT: The original offered dollar amount of this award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_ORIG_OFFER_DATE IS 'ORIGINAL OFFERED DATE: The date the award was originally offered for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_ACCEPT_AMT IS 'ACCEPTED AMOUNT: The accepted dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_ACCEPT_DATE IS 'ACCEPTED DATE: The date the award was accepted for this period'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_DECLINE_AMT IS 'DECLINED AMOUNT: The declined dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_DECLINE_DATE IS 'DECLINED DATE: The date the award was declined for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_CANCEL_AMT IS 'CANCELLED AMOUNT: The cancelled dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_CANCEL_DATE IS 'CANCELLED DATE: The date the award was cancelled for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AUTHORIZE_AMT IS 'AUTHORIZED AMOUNT: The authorized dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AUTHORIZE_DATE IS 'AUTHORIZED DATE: The date the award was authorized for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_MEMO_AMT IS 'MEMOED AMOUNT: The memo dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_MEMO_DATE IS 'MEMOED DATE: The date the award for this period was memoed.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PAID_AMT IS 'PAID AMOUNT: The paid dollar amount of the award for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PAID_DATE IS 'PAID DATE: The date the award was paid for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PCKG_LOAD_IND IS 'PACKAGING LOAD INDICATOR: The enrollment status for this period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_NSLDS_OVRD_IND IS 'NSLDS OVERRIDE: Indicates the rules which have been overridden for the award for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_PELL_AWRD_LOAD_OPT IS 'APPLICANT GRANT AWARD ENROLLMENT OPTION: The enrollment option used when the grant award was packaged for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_LOCK_IND IS 'LOCK INDICATOR: Indicates if the award has been locked for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_USER_ID IS 'USER ID: The user ID of the person who inserted or last updated this record.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_CIP_OVERRIDE_CODE IS 'CIP OVERRIDE CODE: The Classification of Instructional Program Code for the program the student intends to major in if the school does not require students to declare a major by their junior year.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_DATA_ORIGIN IS 'DATA ORIGIN: Source system that created or updated the data.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_MAJR_OVERRIDE_CODE IS 'MAJOR OVERRIDE CODE: The Major Code for the program the student intends to major in if the school does not require students to declare a major by their junior year.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_OVERRIDE_DISB_RULE IS 'OVERRIDE FUND DISBURSEMENT RULE: Indicates whether the fund disbursement rule will be overridden when disbursing a fund to the student for a period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_TERM_CODE IS 'Term Code: The term associated with the accounts receivable indicator for the period.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_SURROGATE_ID IS 'SURROGATE ID: Immutable unique key'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_VERSION IS 'VERSION: Optimistic lock token.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_VPDI_CODE IS 'VPDI CODE: Multi-entity processing code.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AWST_CODE IS 'AWARD SCHEDULE STATUS CODE: The code associated with the current status of the award schedule.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AWST_DATE IS 'AWARD STATUS DATE: The date the award status was effective.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_OFFER_EXP_DATE IS 'OFFER EXPIRATION DATE: The expiration date of the award schedule offer.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_BBAY_CODE IS 'BBAY CODE: The Borrower-Based Academic Year associated with the award schedule.'
/

COMMENT ON COLUMN FAISMGR.RPRATRM.RPRATRM_AIDY_CODE_FUNDS IS 'FUNDS AID YEAR: The aid year associated with the Borrower-Based Academic Year for origination and funding.'
/

CREATE INDEX RPRATRM_PIDM_INDEX
    ON FAISMGR.RPRATRM (RPRATRM_PIDM, RPRATRM_FUND_CODE, RPRATRM_PERIOD)
/

CREATE INDEX RPRATRM_KEY_INDEX2
    ON FAISMGR.RPRATRM (RPRATRM_FUND_CODE, RPRATRM_AIDY_CODE)
/

CREATE INDEX RPRATRM_BBAY_INDEX
    ON FAISMGR.RPRATRM (RPRATRM_PIDM, RPRATRM_BBAY_CODE, RPRATRM_FUND_CODE, RPRATRM_PERIOD)
/

CREATE INDEX RPRATRM_FUNDS_AIDY_INDEX
    ON FAISMGR.RPRATRM (RPRATRM_FUND_CODE, RPRATRM_AIDY_CODE_FUNDS)
/