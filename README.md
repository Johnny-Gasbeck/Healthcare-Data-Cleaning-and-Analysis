## Goal

The goal of this project is to develop proficiency in healthcare data analysis by using SQL for **data cleaning, manipulation, and extraction, followed by visualization** in Tableau to communicate insights effectively. 
This project aims to analyze a synthetic healthcare dataset to **identify trends in patient demographics, hospital admissions, and medical billing**. Additionally, leveraging Tableau for visualization will enhance the 
ability to present findings in a clear and impactful manner. Through this hands-on approach, the project will provide valuable experience in SQL-based data analysis while improving skills in data-driven decision-making for healthcare applications.


## Process

I sourced a healthcare dataset from Kaggle, downloaded it in CSV format, and imported it into a **SQL database** for cleaning and analysis. Using SQL, I **removed duplicates** by identifying repeated patient records 
using `ROW_NUMBER()` and deleting unnecessary entries. I **standardized the data** by ensuring consistent formats for the columns using `UPDATE` statements. To check for **null and blank values**, I used `IS NULL`. 
After cleaning, I analyzed **patient demographics**, **admission trends, and billing trends** using SQL queries. Finally, I exported the findings to **Tableau**, creating interactive dashboards to visualize  
**patient demographics, length of stay, billing patterns, and abnormal test results** for better insights into admission trends.


## Key Findings
1. There was no statistically significant relationship between age and the number of patients.
2. Emergency admissions had the longest average hospital stay. 
3. Obesity had the greatest average billing amount.
4. The hospital that handles the most cases with Abnormal test results was Smith Group.
