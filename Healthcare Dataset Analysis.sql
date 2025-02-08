##Descriptive Analysis 

#Finding the total number of patients 

SELECT COUNT(*) AS Total_Patients 
FROM healthcare_data2;

#There are 54966 patients.

#Count of patients by gender 
SELECT Gender, COUNT(*) AS Count 
FROM healthcare_data2 
GROUP BY Gender;

#There are 27496 male patients and 27470 female patients.

#Distribution of blood types
SELECT `Blood Type`, COUNT(*) AS Count 
FROM healthcare_data2 
GROUP BY `Blood Type`;

#The distribution of blood types among patients is fairly even, with each type having around 6,800 patients. 
#The highest count is A- (6,898 patients), while the lowest is O- (6,804 patients).

#Determine which hospital has the most admissions

SELECT `Hospital`, COUNT(*) AS total_admissions
FROM `healthcare_data`
GROUP BY `Hospital`
ORDER BY total_admissions DESC;

#LLC Smith has the most admissions with 44 patients.

#Determine which doctors have the most patients 
SELECT Doctor, COUNT(*) AS Patient_Count
FROM healthcare_data2
GROUP BY Doctor
ORDER BY Patient_Count DESC
LIMIT 10;

#Michael Smith has the most patients with 27, followed by John Smith in second place with 22, and Robert Smith in third with 21 patients.


##Comparative Analysis (Trends and Relationships)

#Identify the most common medical conditions 

SELECT `Medical Condition`, COUNT(*) AS Count
FROM healthcare_data2
GROUP BY `Medical Condition`
ORDER BY Count DESC
LIMIT 10;

#The most common medical conditions among patients are Arthritis (9,218 cases), 
#Diabetes (9,216 cases), and Hypertension (9,151 cases). Other prevalent conditions include Obesity (9,146 cases), 
#Cancer (9,140 cases), and Asthma (9,095 cases), with all having similar occurrence rates.

#Trend of hospital admissions by year 

SELECT YEAR(`Date of Admission`) AS Year, COUNT(*) AS Admissions
FROM healthcare_data2
GROUP BY Year
ORDER BY Year;

#Hospital admissions peaked in 2020 (11,172 cases), followed closely by 2021 (10,816 cases), 2022 (10,915 cases), 
# and 2023 (10,936 cases). Admissions were lower in 2019 (7,300 cases) and have significantly decreased in 2024 (3,827 cases so far).

#Determine which months have the highest number of admissions

SELECT MONTHNAME(`Date of Admission`) AS Month, COUNT(*) AS Admissions
FROM healthcare_data2
GROUP BY Month
ORDER BY Admissions DESC;

#The months with the highest number of hospital admissions are August (4,785 cases) and July (4,765 cases), followed by January (4,655 cases)
#and June (4,650 cases). The lowest admissions occurred in February (4,210 cases), with April (4,478 cases) and November (4,508 cases) 
#also having relatively lower numbers. The pattern shows higher admissions in the middle of the year, particularly in the summer months.

#Determine which admission type is the most expensive 

SELECT `Admission Type`, ROUND(AVG(`Billing Amount`), 2) AS Avg_Bill
FROM healthcare_data2
GROUP BY `Admission Type`
ORDER BY Avg_Bill DESC;

#The Urgent admission type has the highest average billing amount at $25,514.53, closely followed by Emergency admissions at $25,505.33, 
# and Elective admissions with an average billing of $25,612.14. The billing amounts are fairly similar across these admission types.


##Finanical Analysis

#Determine the hospitals that generate the most revenue 

SELECT Hospital, ROUND(SUM(`Billing Amount`), 2) AS Total_Revenue
FROM healthcare_data2
GROUP BY Hospital
ORDER BY Total_Revenue DESC
LIMIT 3;

#The top three hospitals by total revenue are Johnson PLC with $1,081,477.31, followed by LLC Smith with $1,030,189.87, and Smith PLC with $1,029,424.45.

#Determine which conditions are the most expensive to treat 

SELECT `Medical Condition`, ROUND(AVG(`Billing Amount`), 2) AS Avg_Cost
FROM healthcare_data2
GROUP BY `Medical Condition`
ORDER BY Avg_Cost DESC;

#The top three most expensive conditions to treat are Obesity with $25,804.36, Diabetes with $25,660.48, and Asthma with $25,633.46.


##Predictive Insights and Risk Factors 

#Determine which age groups are most frequently admitted. 

SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 17 THEN '0-17 (Children)'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35 (Young Adults)'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50 (Middle-Aged Adults)'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65 (Older Adults)'
        ELSE '65+ (Seniors)'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM healthcare_data2
WHERE Age IS NOT NULL
GROUP BY Age_Group
ORDER BY Age_Group;

#The largest age group is Seniors (65+ years) with 16,096 patients, followed by Young Adults (19-35 years) with 14,289 patients.
# The smallest group is Children (0-18 years), with only 116 patients. This distribution shows that the majority of hospital
# admissions occur among Seniors.


#Determine if certain insurance providers are associated with higher or lower costs 

SELECT `Insurance Provider`, ROUND(AVG(`Billing Amount`), 2) AS Avg_Bill
FROM healthcare_data2
GROUP BY `Insurance Provider`
ORDER BY Avg_Bill DESC;

#The top five insurance providers by average billing amount are Medicare with $25,628.32, followed by Blue Cross with $25,603.46, 
#Aetna with $25,549.69, Cigna with $25,526.00, and UnitedHealthcare with $25,414.51.

