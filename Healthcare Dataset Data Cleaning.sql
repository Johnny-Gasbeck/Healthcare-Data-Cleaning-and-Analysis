# Creating another table from the raw table 

CREATE TABLE healthcare_data AS 
SELECT * FROM healthcare_dataset;

# Viewing the new table 

SELECT *
FROM healthcare_data;

#Identifying Duplicates

SELECT `Name`, `Age`, `Gender`, `Blood Type`, `Medical Condition`, `Date of Admission`,  
       `Doctor`, `Hospital`, `Insurance Provider`, `Billing Amount`, `Room Number`,  
       `Admission Type`, `Discharge Date`, `Medication`, `Test Results`,  
       COUNT(*) AS count  
FROM `healthcare_data`  
GROUP BY `Name`, `Age`, `Gender`, `Blood Type`, `Medical Condition`, `Date of Admission`,  
         `Doctor`, `Hospital`, `Insurance Provider`, `Billing Amount`, `Room Number`,  
         `Admission Type`, `Discharge Date`, `Medication`, `Test Results`  
HAVING COUNT(*) > 1;


#This approach creates a new table that contains only distinct rows.

CREATE TABLE healthcare_data2 AS
SELECT DISTINCT `Name`, `Age`, `Gender`, `Blood Type`, `Medical Condition`, `Date of Admission`,
                `Doctor`, `Hospital`, `Insurance Provider`, `Billing Amount`, `Room Number`,
                `Admission Type`, `Discharge Date`, `Medication`, `Test Results`
FROM `healthcare_data`;

#Confirming that the new table doesn't have any duplicates

SELECT *
FROM healthcare_data2;

#Standardizing the Data 

# Formating the `Name` column properly

#Query to Remove "Dr.", "Mr.", "Ms.", and "Mrs." (Case-Insensitive) from `Name`

UPDATE healthcare_data2
SET `Name` = TRIM(
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(LOWER(`Name`), 'dr. ', ''), 
            'mr. ', ''), 
        'ms. ', ''), 
    'mrs. ', '')
)
WHERE LOWER(`Name`) REGEXP '^(dr|mr|ms|mrs)\\. ';

#Confirming that the query worked

SELECT *
FROM healthcare_data2;

#Query to properly capitalize the first and last name 


UPDATE healthcare_data2
SET `Name` = CONCAT(
    UPPER(LEFT(SUBSTRING_INDEX(`Name`, ' ', 1), 1)),  -- Capitalize the first letter of the first name
    LOWER(SUBSTRING(SUBSTRING_INDEX(`Name`, ' ', 1), 2)),  -- Convert the rest of the first name to lowercase
    ' ',  -- Add a space
    UPPER(LEFT(SUBSTRING_INDEX(`Name`, ' ', -1), 1)),  -- Capitalize the first letter of the last name
    LOWER(SUBSTRING(SUBSTRING_INDEX(`Name`, ' ', -1), 2))  -- Convert the rest of the last name to lowercase
)
WHERE `Name` IS NOT NULL
AND LENGTH(`Name`) - LENGTH(REPLACE(`Name`, ' ', '')) = 1;  -- Only modify names with exactly two parts

#Confirming that the query worked

SELECT *
FROM healthcare_data2;

#Coverting Date of Admission and Discharge Date to DATE format 
ALTER TABLE healthcare_data2 
MODIFY COLUMN `Date of Admission` DATE,
MODIFY COLUMN `Discharge Date` DATE;

#Verify the Changes
DESC healthcare_data2;

#Formatting the Hospital Column

#Remove and from beginning of hospital name

UPDATE healthcare_data2
SET `Hospital` = LTRIM(REPLACE(`Hospital`, 'and ', ''))
WHERE `Hospital` LIKE 'and %';

SELECT `Hospital`
FROM healthcare_data2
WHERE `Hospital` LIKE 'and %';

#Remove and from end of hospital name
UPDATE healthcare_data2
SET `Hospital` = RTRIM(REPLACE(`Hospital`, ' and', ''))
WHERE `Hospital` LIKE '% and';

SELECT `Hospital`
FROM healthcare_data2
WHERE `Hospital` LIKE 'and %';

#Remove commas and periods from the end of the hospital column

UPDATE healthcare_data2
SET `Hospital` = REGEXP_REPLACE(`Hospital`, '[,.]+$', '')
WHERE `Hospital` REGEXP '[,.]+$';

#Checking for NULL values and blank (empty string) values

SELECT *
FROM healthcare_data2
WHERE 
    `Name` IS NULL OR `Name` = '' OR
    `Age` IS NULL OR `Age` = '' OR
    `Gender` IS NULL OR `Gender` = '' OR
    `Blood Type` IS NULL OR `Blood Type` = '' OR
    `Medical Condition` IS NULL OR `Medical Condition` = '' OR
    `Date of Admission` IS NULL OR  
    `Doctor` IS NULL OR `Doctor` = '' OR
    `Hospital` IS NULL OR `Hospital` = '' OR
    `Insurance Provider` IS NULL OR `Insurance Provider` = '' OR
    `Billing Amount` IS NULL OR `Billing Amount` = '' OR
    `Room Number` IS NULL OR `Room Number` = '' OR
    `Admission Type` IS NULL OR `Admission Type` = '' OR
    `Discharge Date` IS NULL OR  
    `Medication` IS NULL OR `Medication` = '' OR
    `Test Results` IS NULL OR `Test Results` = '';





