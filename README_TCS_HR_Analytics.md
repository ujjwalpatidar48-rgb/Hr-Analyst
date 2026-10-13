# HR Analytics Project | Python, SQL & Power BI

## Project Overview
This HR Analytics project explores employee workforce metrics and attrition patterns using Python, SQL, and Power BI. The workflow includes data inspection and cleaning, statistical analysis, exploratory data analysis (EDA), SQL-based business queries, and an interactive HR Analytics Dashboard.

The dashboard provides a consolidated view of employee counts, active employees, average monthly income, attrition, department-level metrics, job-role analysis, gender distribution, and education-level analysis.

> **Project naming note:** Use “TCS HR Analytics” as the repository name only if the dataset/project is genuinely based on TCS data and you have permission to publish it. Do not imply official TCS endorsement if this is a personal portfolio project.

## Objectives
- Inspect and clean HR data using Python and Pandas.
- Identify and handle missing values, duplicates, and inconsistent data.
- Calculate workforce and attrition statistics.
- Analyze employee distribution by department, job role, gender, and education.
- Build a Power BI dashboard to monitor workforce KPIs and attrition.
- Document the analytical workflow for GitHub.

## Tools & Technologies
Python, Pandas, Jupyter Notebook, SQL/MySQL, Power BI Desktop, DAX, and GitHub.

## Workflow
### 1. Data Cleaning & Inspection
Use the inspection notebook to review dataset dimensions, data types, sample records, missing values, duplicates, and column distributions. Document the final row count and exact cleaning rules from notebook outputs.

### 2. Statistical Analysis
Use the statistics notebook to document descriptive measures actually calculated in the notebook.

### 3. Python EDA
Explore workforce and attrition patterns. Relevant dashboard dimensions include department, job role, gender, education, employee status, and income, where supported by the dataset.

### 4. SQL Analysis
**Important:** The uploaded `Hr Data EDA.sql` appears to contain e-commerce database/table names and fields such as `Sales`, `Product`, `City`, `Category`, and `Payment_Method`. It does not currently appear to be an HR SQL script. Replace it with HR-specific queries before including it as this project's SQL analysis.

Recommended HR query topics, after confirming actual table and column names:
- Total and active employees
- Total attrition and attrition rate
- Attrition by department and job role
- Employee distribution by gender and education
- Average monthly income by department or job role
- Employee counts by year, if a valid date field exists

### 5. Power BI Dashboard
The supplied dashboard PDF shows:
- Total Employees: 11K
- Active Employees: 41K
- Average Monthly Income: 65.28K
- Attrition Rate: 0.38
- Total Attrition: 4K
- Total Employees Snapshot by DepartmentName
- Total Attrition by DepartmentName, Gender, JobRole, and Education
- Total Employees Snapshot by JobRole
- Attrition Rate by JobRole
- Department summary table with Total Employees and Active Employees
- Total Employees by Gender
- Slicers for Year, DepartmentName, JobRole, Gender, and Education

**Metric validation required:** The dashboard displays Total Employees as 11K and Active Employees as 41K. The department table shows 11,126 Total Employees and 40,769 Active Employees. Active employees exceeding total employees is a significant inconsistency. Validate measures, relationships, filter context, and employee definitions before publishing final results. Confirm whether Attrition Rate `0.38` is intended as a decimal (38%) or a differently formatted measure.

## How to Use the Dashboard
1. Select Year, DepartmentName, JobRole, Gender, or Education using the slicers.
2. Review KPI cards for the selected filter context.
3. Compare employee counts across departments and job roles.
4. Explore attrition by department, gender, job role, and education.
5. Review attrition rate by job role.
6. Clear slicers to return to the full view.

## Suggested GitHub Repository Structure
```text
TCS-HR-Analytics/
├── README.md
├── Dataset/
│   └── hr_dataset.csv
├── Python/
│   ├── Hr_Data_Cleaning_Inspection.ipynb
│   ├── HR_Data_EDA.ipynb
│   └── HR_Data_Statistics.ipynb
├── SQL/
│   └── hr_data_eda.sql
├── PowerBI/
│   └── HR_Analytics_Dashboard.pbix
├── Screenshots/
│   └── HR_Analytics_Dashboard.png
└── Reports/
    └── TCS_HR_Analytics_Project_Report.pdf
```

Update filenames to match the files actually uploaded. The supplied dashboard file is a PDF, not an editable `.pbix`. Add the PBIX only if available. Do not upload confidential, personal, or restricted employee data.

## Skills Demonstrated
Data inspection, data cleaning, statistical analysis, exploratory data analysis, SQL querying, workforce KPI analysis, attrition analysis, Power BI dashboard design, data visualization, and project documentation.

## Validation Checklist
- Confirm the dataset source and whether the TCS label is accurate and permitted.
- Verify Total Employees and Active Employees measures.
- Validate the Attrition Rate calculation and display format.
- Ensure Python, SQL, and Power BI use consistent definitions.
- Replace the current SQL file with HR-specific queries if it is the e-commerce script.
- Publish only findings supported by notebook outputs.

## Author
**Ujjwal Patidar**  
HR Analytics | Python • SQL • Power BI
