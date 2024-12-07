University_Data_Cleaning
This project focuses on cleaning and preparing a dataset containing students' exam data, including their names, age, gender, admission test scores, high school percentages, and final admission status. The primary goal is to ensure that the data is accurate, consistent, and ready for analysis, enabling meaningful insights that can inform decision-making.

Key Data Features:
Names: The names of the students, which serve as unique identifiers.
Age: The age of each student, which can play a role in determining their admission eligibility.
Gender: The gender of the student, useful for analyzing gender distribution in admissions.
Admission Test Score: The score obtained by each student on the admission test, which is a crucial factor in determining their admission decision.
High School Percentage: The percentage from the student’s high school academic records, which may influence the admission status.
Admission Status: The final outcome for each student—whether they were Accepted or Rejected based on various factors.
Data Cleaning Process:
The dataset required several cleaning steps to ensure its accuracy and readiness for analysis:

Remove Duplicates: Duplicate entries were identified and removed to maintain data integrity.
Standardize the Data: Standardized inconsistent data formats, such as names or test scores, to ensure uniformity across the dataset.
Handle Null or Blank Values: Missing values were addressed through specific strategies, such as filling in numerical blanks based on related features (e.g., age or test scores).
Remove Unnecessary Columns: Columns that were irrelevant to the analysis or redundant were removed to streamline the dataset.
Tools and Techniques Used:
For this project, I used MySQL exclusively. While exploratory data analysis (EDA) was not conducted, I applied aggregate functions to handle missing values and perform basic data transformations. For example, missing values for test scores or high school percentages were filled in based on other factors such as student age or name, ensuring that the data was as complete and accurate as possible for analysis.

Explanation and Next Steps:
In this project, the focus was mainly on data cleaning, making sure the dataset was in optimal condition for further analysis or reporting. The next steps could involve performing more advanced analyses such as trend analysis, correlational studies, or even predictive modeling based on the cleaned data.
