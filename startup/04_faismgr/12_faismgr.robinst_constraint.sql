ALTER TABLE FAISMGR.ROBINST
    ADD CONSTRAINT FK1_ROBINST_INV_ROBPRDS_KEY
    FOREIGN KEY (ROBINST_CURRENT_PERIOD)
    REFERENCES FAISMGR.ROBPRDS (ROBPRDS_PERIOD)
/