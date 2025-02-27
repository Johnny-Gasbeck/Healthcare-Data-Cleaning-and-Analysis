# Healthcare Data

## Project Portfolio can be found here: https://oil-octagon-e70.notion.site/Project-Portfolio-194a641f375380478404ef1198f2428c

## Columns in the dataset


- Name: This column represents the name of the patient associated with the healthcare record.
- Age: The age of the patient at the time of admission, expressed in years.
- Gender: Indicates the gender of the patient, either "Male" or "Female."
- Blood Type: The patient's blood type, which can be one of the common blood types (e.g., "A+", "O-", etc.).
- Medical Condition: This column specifies the primary medical condition or diagnosis associated with the patient, such as "Diabetes," "Hypertension," "Asthma," and more.
- Date of Admission: The date on which the patient was admitted to the healthcare facility.
- Doctor: The name of the doctor responsible for the patient's care during their admission.
- Hospital: Identifies the healthcare facility or hospital where the patient was admitted.
- Insurance Provider: This column indicates the patient's insurance provider, which can be one of several options, including "Aetna," "Blue Cross," "Cigna," "UnitedHealthcare," and "Medicare."
- Billing Amount: The amount of money billed for the patient's healthcare services during their admission. This is expressed as a floating-point number.
- Room Number: The room number where the patient was accommodated during their admission.
- Admission Type: Specifies the type of admission, which can be "Emergency," "Elective," or "Urgent," reflecting the circumstances of the admission.
- Discharge Date: The date on which the patient was discharged from the healthcare facility, based on the admission date and a random number of days within a realistic range.
- Medication: Identifies a medication prescribed or administered to the patient during their admission. Examples include "Aspirin," "Ibuprofen," "Penicillin," "Paracetamol," and "Lipitor."
- Test Results: Describes the results of a medical test conducted during the patient's admission. Possible values include "Normal," "Abnormal," or "Inconclusive," indicating the outcome of the test.

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
1. Emergency admissions had the longest average hospital stay.
2. Obesity had the greatest average billing amount. 
3. The hospital that handles the most cases with Abnormal test results was Smith Group.
4. There was no statistically significant relationship between age and the number of patients.
