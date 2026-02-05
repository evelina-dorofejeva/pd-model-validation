SELECT
    COUNT(*) AS scoring_rows,
    SUM(a.AR_ID IS NULL) AS missing_in_arrangement
FROM dat_scoring AS s
LEFT JOIN dat_arrangement AS a
    ON  s.AR_ID = a.AR_ID
    AND s.YEAR  = a.YEAR;
    SELECT
    s.YEAR,
    COUNT(*) AS missing_rows
FROM dat_scoring AS s
LEFT JOIN dat_arrangement AS a
    ON  s.AR_ID = a.AR_ID
    AND s.YEAR  = a.YEAR
WHERE a.AR_ID IS NULL
GROUP BY s.YEAR
ORDER BY s.YEAR;
SELECT
    COUNT(*) AS n,
    AVG(DFLT_FLAG) AS default_rate,
    AVG(PD) AS avg_pd
FROM dat_scoring AS s
LEFT JOIN dat_arrangement AS a
    ON  s.AR_ID = a.AR_ID
    AND s.YEAR  = a.YEAR
WHERE a.AR_ID IS NULL;
SELECT
    COUNT(*) AS total_rows,
    SUM(DPD = 'NA') AS dpd_na,
    SUM(M_LAST_DPD = 'NA') AS m_last_dpd_na
FROM dat_arrangement;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT YEAR, AR_ID) AS unique_year_ar
FROM dat_arrangement;
SELECT
    YEAR,
    AR_ID,
    COUNT(*) AS counted
FROM dat_arrangement
GROUP BY
    YEAR,
    AR_ID
HAVING COUNT(*) > 1
ORDER BY counted DESC, YEAR, AR_ID;