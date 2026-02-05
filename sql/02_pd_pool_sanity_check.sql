SELECT *
FROM par_pools
ORDER BY LABEL;
INSERT INTO par_pools (LABEL, START, END)
VALUES
(1, 0.0, 0.0008),
(5, 0.048, 1.0);
SELECT
    s.YEAR AS year,
    s.PD AS pd,
    s.PD_POOL AS pd_pool,
    p.LABEL AS expected_pool
FROM dat_scoring AS s
LEFT JOIN par_pools AS p
    ON  s.PD >= p.START
    AND s.PD <  p.END
WHERE s.YEAR = 2022
ORDER BY
    s.PD_POOL DESC,
    s.PD;