CREATE DATABASE seb_task;
USE seb_task;
SHOW CREATE TABLE dat_scoring;
ALTER TABLE dat_scoring
  MODIFY COLUMN PD DECIMAL(10,8),
  MODIFY COLUMN DFLT_FLAG TINYINT(1),
  MODIFY COLUMN PD_POOL INT,
  MODIFY COLUMN AR_ID BIGINT,
  MODIFY COLUMN YEAR INT;
  DESCRIBE dat_scoring;
  SELECT
  MIN(PD) AS min_pd,
  MAX(PD) AS max_pd,
  COUNT(*) AS n
FROM dat_scoring;
SELECT
  YEAR,
  COUNT(*) AS contracts,
  AVG(DFLT_FLAG) AS default_rate,
  AVG(PD) AS avg_pd
FROM dat_scoring
GROUP BY YEAR
ORDER BY YEAR;
SELECT
  YEAR,
  PD_POOL,
  COUNT(*) AS n,
  AVG(DFLT_FLAG) AS default_rate,
  AVG(PD) AS avg_pd
FROM dat_scoring
GROUP BY YEAR, PD_POOL
ORDER BY YEAR, PD_POOL;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT YEAR, AR_ID) AS unique_year_ar
FROM dat_scoring;