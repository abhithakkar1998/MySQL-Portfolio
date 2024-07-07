-- Data Cleaning
USE world_layoffs;

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or Blank Values
-- 4. Remove columns or rows that aren't necessary

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

-- 1. Remove Duplicates

WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
	) AS row_num
	FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = 'Adobe';


CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging_2;

INSERT INTO layoffs_staging_2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM layoffs_staging
;

SELECT *
FROM layoffs_staging_2
WHERE row_num > 1;

DELETE
FROM layoffs_staging_2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging_2;


-- Standardizing Data
-- Finding issues in data and fixing it

SELECT company, TRIM(company)
FROM layoffs_staging_2
;

UPDATE layoffs_staging_2
SET company = TRIM(company)
;

SELECT DISTINCT(industry)
FROM layoffs_staging_2
ORDER BY 1
;

SELECT *
FROM layoffs_staging_2
WHERE industry LIKE 'Crypto%'
;

UPDATE layoffs_staging_2
SET industry = "Crypto"
WHERE industry LIKE 'Crypto%'
;

SELECT DISTINCT(location)
FROM layoffs_staging_2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging_2
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging_2
ORDER BY 1;

UPDATE layoffs_staging_2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'
;

SELECT *
FROM layoffs_staging_2;

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging_2;

UPDATE layoffs_staging_2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging_2
MODIFY COLUMN `date` DATE;

SELECT `date`
FROM layoffs_staging_2;

	-- -- Checking and Modifying NULL & Blank values
SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2
WHERE industry IS NULL
OR industry = '';

SELECT t1.industry, t2.industry
FROM layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
	AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging_2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging_2 t1
JOIN layoffs_staging_2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging_2
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging_2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging_2;

-- For numeric values we cannot directly populate the NULL values or Blank Values
-- total_laid_off & percentage_laid_off cannot fill values
-- for funds_raised_millions we can scrape from web but not right now.

-- total_laid_off & percentage_laid_off both null. Then we need cannot make for sure if
-- they are not useful for layoff stats
SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- safe to store these values temporarily in case needed in future
CREATE TABLE `layoffs_staging_null` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_staging_null
SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL
;

ALTER TABLE layoffs_staging_null
DROP COLUMN row_num;

SELECT * FROM layoffs_staging_null;

-- now remove from our working table
DELETE
FROM layoffs_staging_2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging_2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging_2;