SELECT
    COUNT(*) AS scoring_rows,
    SUM(o.IP_ID IS NULL) AS missing_in_obligor
FROM dat_scoring AS s
LEFT JOIN dat_obligor AS o
    ON  s.IP_ID = o.IP_ID
    AND s.YEAR  = o.YEAR;
SELECT
    s.YEAR,
    COUNT(*) AS missing_rows
FROM dat_scoring AS s
LEFT JOIN dat_obligor AS o
    ON  s.IP_ID = o.IP_ID
    AND s.YEAR  = o.YEAR
WHERE o.IP_ID IS NULL
GROUP BY s.YEAR
ORDER BY s.YEAR;
SELECT
    COUNT(*) AS n,
    AVG(DFLT_FLAG) AS default_rate,
    AVG(PD) AS avg_pd
FROM dat_scoring AS s
LEFT JOIN dat_obligor AS o
    ON  s.IP_ID = o.IP_ID
    AND s.YEAR  = o.YEAR
WHERE o.IP_ID IS NULL;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT YEAR, IP_ID) AS unique_year_ip
FROM dat_obligor;