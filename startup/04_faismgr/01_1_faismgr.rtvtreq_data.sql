-- This table has 400+ rows. These inserts aren't a copy from prod, just the records
-- that will meet the validation requirements for other tables
INSERT INTO FAISMGR.RTVTREQ(RTVTREQ_CODE, RTVTREQ_SHORT_DESC, RTVTREQ_LONG_DESC, RTVTREQ_ACTIVITY_DATE, RTVTREQ_ONCE_IND, RTVTREQ_PCKG_IND, RTVTREQ_DISB_IND, RTVTREQ_MEMO_IND, RTVTREQ_ACCESS_IND, RTVTREQ_VR_MSG_NO, RTVTREQ_INFO_ACCESS_IND, RTVTREQ_SATISFY_ALL_IND, RTVTREQ_URL, RTVTREQ_PERK_MPN_FLAG, RTVTREQ_LTR_EXCLUDE_IND, RTVTREQ_UPDATE_PRIOR_YEAR_IND, RTVTREQ_INSTRUCTIONS, RTVTREQ_ACTIVE_IND, RTVTREQ_USER_ID, RTVTREQ_TERM_ELIGIBLE_IND, RTVTREQ_USE_FED_FUND_ID_IND, RTVTREQ_SURROGATE_ID, RTVTREQ_VERSION, RTVTREQ_DATA_ORIGIN, RTVTREQ_VPDI_CODE) VALUES ('ISIR', 'ISIR', 'We received your Free Application for Federal Student Aid', TO_DATE('2016-03-23 15:43:43', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'Y', 'Y', 'Y', 'Y', 1, 'N', null, 'http://www.fafsa.gov', null, 'N', 'N', null, 'Y', 'BVANDERROES', 'N', 'N', 183, 0, null, null);
INSERT INTO FAISMGR.RTVTREQ (RTVTREQ_CODE, RTVTREQ_SHORT_DESC, RTVTREQ_LONG_DESC, RTVTREQ_ACTIVITY_DATE, RTVTREQ_ONCE_IND, RTVTREQ_PCKG_IND, RTVTREQ_DISB_IND, RTVTREQ_MEMO_IND, RTVTREQ_ACCESS_IND, RTVTREQ_VR_MSG_NO, RTVTREQ_INFO_ACCESS_IND, RTVTREQ_SATISFY_ALL_IND, RTVTREQ_URL, RTVTREQ_PERK_MPN_FLAG, RTVTREQ_LTR_EXCLUDE_IND, RTVTREQ_UPDATE_PRIOR_YEAR_IND, RTVTREQ_INSTRUCTIONS, RTVTREQ_ACTIVE_IND, RTVTREQ_USER_ID, RTVTREQ_TERM_ELIGIBLE_IND, RTVTREQ_USE_FED_FUND_ID_IND, RTVTREQ_SURROGATE_ID, RTVTREQ_VERSION, RTVTREQ_DATA_ORIGIN, RTVTREQ_VPDI_CODE) VALUES ('LNEXIT', 'Exit Counseling', 'Completed Exit Loan Counseling', TO_DATE('2018-12-04 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'N', 'N', 'N', 'N', 'Y', null, 'Y', 'N', 'https://studentaid.ed.gov/sa/sites/default/files/loan-exit-counseling.pdf', null, 'Y', 'N', null, 'Y', 'BVANDERROES', 'N', 'N', 227, 1, null, null);
INSERT INTO FAISMGR.RTVTREQ (RTVTREQ_CODE, RTVTREQ_SHORT_DESC, RTVTREQ_LONG_DESC, RTVTREQ_ACTIVITY_DATE, RTVTREQ_ONCE_IND, RTVTREQ_PCKG_IND, RTVTREQ_DISB_IND, RTVTREQ_MEMO_IND, RTVTREQ_ACCESS_IND, RTVTREQ_VR_MSG_NO, RTVTREQ_INFO_ACCESS_IND, RTVTREQ_SATISFY_ALL_IND, RTVTREQ_URL, RTVTREQ_PERK_MPN_FLAG, RTVTREQ_LTR_EXCLUDE_IND, RTVTREQ_UPDATE_PRIOR_YEAR_IND, RTVTREQ_INSTRUCTIONS, RTVTREQ_ACTIVE_IND, RTVTREQ_USER_ID, RTVTREQ_TERM_ELIGIBLE_IND, RTVTREQ_USE_FED_FUND_ID_IND, RTVTREQ_SURROGATE_ID, RTVTREQ_VERSION, RTVTREQ_DATA_ORIGIN, RTVTREQ_VPDI_CODE) VALUES ('LNCOUN', 'Entrance Loan Couns.', 'Complete Entrance Loan Counseling', TO_DATE('2021-08-18 11:41:56', 'YYYY-MM-DD HH24:MI:SS'), 'Y', 'N', 'Y', 'Y', 'Y', null, 'Y', 'Y', 'https://studentaid.gov/', null, 'N', 'N', 'If you have previously completed Entrance Loan Counseling for another college, please contact the Financial Aid Office.', 'Y', 'BVANDERROES', 'N', 'Y', 185, 3, null, null);