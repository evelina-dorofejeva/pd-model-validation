-- SQL was used as an initial data quality and structure check before Python analysis.

-- Main checks performed:
-- • Verified uniqueness of keys in all base tables
-- • Checked missing values in key variables (PD, DPD, IDs)
-- • Validated joins between scoring, arrangement and obligor tables

-- Key findings
-- • dat_scoring has unique records by (YEAR, AR_ID)
-- • dat_arrangement contains duplicates by (YEAR, AR_ID)
-- • Duplicates in dat_arrangement differ in completeness
-- • Most complete record was kept for further analysis
-- • Not all scoring records could be matched with arrangement data, so missing values appear in joined fields

-- Conclusion
-- SQL analysis confirmed that data preparation and cleaning steps are required before PD validation in Python.