# HR Analytics – Employee Attrition Analysis

An end-to-end HR analytics project focused on understanding workforce distribution, employee exits, and potential employee-retention issues using **Python, SQL, and Power BI**.

The project combines data inspection, exploratory data analysis (EDA), statistical checks, SQL business queries, and an interactive HR dashboard to convert HR data into actionable business insights.

---

## Table of Contents

- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Tools and Technologies](#tools-and-technologies)
- [Dataset Overview](#dataset-overview)
- [Project Workflow](#project-workflow)
- [Key Findings](#key-findings)
- [Exit Reason Analysis](#exit-reason-analysis)
- [Possible Business Drivers and Root-Cause Interpretation](#possible-business-drivers-and-root-cause-interpretation)
- [Business Recommendations](#business-recommendations)
- [Dashboard Overview](#dashboard-overview)
- [Data Quality and Validation Notes](#data-quality-and-validation-notes)
- [How to Run the Project](#how-to-run-the-project)
- [Repository Structure](#repository-structure)
- [Limitations and Future Improvements](#limitations-and-future-improvements)

---

## Business Problem

Employee attrition can increase recruitment and onboarding costs, affect team productivity, and result in the loss of organizational knowledge. HR teams need to understand where employees are leaving, which exit reasons are most frequently reported, and which workforce segments may require further investigation.

This project analyzes employee, department, job-role, employee-snapshot, date, and attrition data to answer HR-related business questions.

**Business question:** What patterns are visible in employee attrition, and what actions can HR consider to improve employee retention?

## Project Objectives

1. Analyze the overall employee population and workforce distribution.
2. Examine employee demographics, departments, education, and job roles.
3. Measure employee exits and calculate the attrition ratio.
4. Identify the most frequently reported reasons for employee exits.
5. Compare attrition across departments, job roles, gender, education, and overtime categories.
6. Review salary, job satisfaction, work-life balance, and tenure indicators.
7. Present HR metrics through a Power BI dashboard.
8. Translate the analysis into practical recommendations for HR stakeholders.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data inspection, analysis, and visualization |
| Pandas | Data loading, profiling, and exploratory analysis |
| NumPy | Numerical analysis |
| Matplotlib and Seaborn | Data visualization and correlation analysis |
| SQL / MySQL | Business queries, aggregations, and joins |
| Power BI | Interactive HR dashboard and KPI reporting |
| Jupyter Notebook | Analysis documentation and execution |

## Dataset Overview

The project uses six related tables:

| Table | Rows | Description |
|---|---:|---|
| `dim_date` | 4,383 | Calendar attributes such as date, year, quarter, and month |
| `dim_department` | 10 | Department master data |
| `dim_employee` | 45,000 | Employee demographics and employment attributes |
| `dim_employee_snapshot` | 45,000 | Employee status, compensation, satisfaction, tenure, and attrition attributes |
| `dim_job_role` | 23 | Job-role and department mapping |
| `fact_attrition` | 4,231 | Employee exit records and recorded exit details |

**Total employee population:** 45,000 records in the employee and snapshot tables.

**Attrition records:** 4,231 records in the attrition fact table.

> The CSV source files are required to rerun the notebooks. Add the six CSV files to a local `data/` directory if you are permitted to share them. Do not upload confidential or personally identifiable employee data to a public repository.

## Project Workflow

### 1. Data Inspection and Quality Checks – Python

The data inspection notebook reviews the structure and quality of the six tables. Checks include:

- Dataset dimensions and sample records (`head()` and `tail()`)
- Column data types and non-null counts (`info()`)
- Descriptive statistics (`describe()`)
- Missing-value counts (`isna().sum()`)
- Unique-value counts (`nunique()`)
- Duplicate-row checks (`duplicated().sum()`)
- Categorical frequency distributions (`value_counts()`)

**Observed data-quality results:**

- The employee master table contains 45,000 records and no missing values in the inspected columns.
- The employee snapshot contains 45,000 records. Its `ExitDate` field has 40,769 missing values, which is consistent with the 40,769 records marked active in the inspected data; this should be treated as an expected business condition, not automatically as a data error.
- The attrition fact table contains 4,231 records, with no missing values or duplicate rows reported by the notebook checks.
- The department and job-role lookup tables contain 10 and 23 records respectively, with no duplicate rows reported.

**Note:** The supplied notebook is primarily an inspection and profiling workflow. It does not document a complete set of data-cleaning transformations or export a final cleaned dataset. The missing `ExitDate` values for active employees should be preserved unless the business definition says otherwise.

### 2. Exploratory Data Analysis – Python

The EDA notebook explores:

- Employee age distribution
- Department and job-role structure
- Workforce attributes and categorical distributions
- Employee snapshot numerical distributions
- Attrition fact-table distributions
- Numeric correlation heatmap for the attrition fact table

These checks help understand the shape of the workforce and the available attrition information before building business summaries.

### 3. Statistical Checks – Python

The statistics notebook starts an outlier and logic-check section and calculates descriptive statistics for employee age.

The wider project also profiles numerical attributes such as age, years at company, monthly income, satisfaction scores, and notice-period days through the inspection and EDA notebooks.

**Scope note:** The supplied statistics notebook contains only a limited statistical check. It should not be described as a completed hypothesis-testing or predictive-modeling exercise.

### 4. SQL Business Analysis

The SQL script contains 15 HR analysis queries, covering:

1. Total employees
2. Gender-wise employee distribution
3. Department-wise employee distribution
4. Average employee age
5. Education-wise employee distribution
6. Job-role-wise employee distribution
7. Overall attrition count
8. Department-wise attrition
9. Average monthly income by department
10. Average job satisfaction by department
11. Employee status distribution
12. Average years at company by department
13. Overtime-wise attrition
14. Average work-life balance
15. Attrition ratio

The queries use `COUNT(DISTINCT ...)`, `JOIN`, `GROUP BY`, `ORDER BY`, conditional aggregation, `ROUND()`, and `NULLIF()`.

### 5. Power BI Dashboard

The supplied dashboard PDF shows an HR Analytics dashboard with sections for:

- Overview
- Employee Analysis
- Attrition Analysis
- Department Analysis
- Performance Analysis
- Salary Analysis
- Insights Analysis

The overview page includes KPI cards and visuals for employee distribution, department-wise employee and attrition counts, job-role analysis, gender distribution, education distribution, and attrition rate by job role.

---

## Key Findings

The following findings are calculated from the supplied notebook outputs and SQL analysis.

### 1. Overall Attrition

- Employee population in `dim_employee`: **45,000**
- Employee exit records in `fact_attrition`: **4,231**
- Calculated exit-record ratio against the employee population: **9.40%**

Calculation:

`4,231 / 45,000 × 100 = 9.40%`

This is a project-level ratio using the supplied employee population and exit-record count. It should be labelled consistently in reporting and validated against the final Power BI data model before being treated as the official HR attrition KPI.

### 2. Voluntary vs. Involuntary Exits

| Exit type | Employees | Share of exit records |
|---|---:|---:|
| Voluntary | 3,523 | 83.27% |
| Involuntary | 708 | 16.73% |
| **Total** | **4,231** | **100%** |

Voluntary exits account for the larger share of recorded exits. This makes employee-retention practices an important area for HR investigation.

### 3. Most Frequently Reported Exit Reasons

| Exit reason | Employees | Share of exit records |
|---|---:|---:|
| Better Opportunity | 1,015 | 23.99% |
| Compensation | 719 | 16.99% |
| Work-Life Balance | 568 | 13.42% |
| Career Growth | 525 | 12.41% |
| Manager/Leadership | 432 | 10.21% |
| Relocation | 354 | 8.37% |
| Personal Reasons | 351 | 8.30% |
| Job Dissatisfaction | 267 | 6.31% |

**Interpretation:** Better Opportunity, Compensation, Work-Life Balance, and Career Growth are the four most frequently recorded exit reasons. Together, they account for approximately 66.81% of the exit records.

### 4. Exit Interview Coverage

- Exit interviews completed: **3,722**
- Exit interviews not completed: **509**
- Completion share: approximately **87.97%**

The 509 exits without a completed exit interview represent a feedback gap. HR may not have the same level of detail about these exits as it has for completed interviews.

### 5. Notice Period

The attrition table reports:

- Average notice period: **37.43 days**
- Median notice period: **30 days**
- Minimum: **15 days**
- Maximum: **90 days**

This can help HR understand the notice-period pattern and plan workforce transitions.

---

## Possible Business Drivers and Root-Cause Interpretation

The dataset records exit reasons, but it does not establish causation. The following are **business hypotheses to investigate**, not proven explanations.

| Recorded pattern | Possible business issue to investigate | Suggested HR validation |
|---|---|---|
| Better Opportunity is the top exit reason | Employees may see stronger career or compensation prospects elsewhere | Review exit-interview comments, role benchmarks, and regretted exits |
| Compensation is the second most common reason | Pay may be perceived as less competitive for some roles | Compare internal pay bands and external market benchmarks |
| Work-Life Balance is frequently reported | Workload, overtime, or scheduling may be concerns | Compare overtime, workload, leave, and team-level feedback |
| Career Growth is frequently reported | Employees may perceive limited promotion or learning opportunities | Review promotion timelines, internal mobility, and training access |
| Manager/Leadership is a recorded reason | Some teams may have management or communication concerns | Use confidential feedback and manager-level trend reviews |
| 509 exit interviews are not completed | HR has incomplete feedback for a portion of exits | Improve exit-interview participation and record-keeping |

**Important distinction:** These explanations are hypotheses. To establish whether overtime, income, satisfaction, tenure, department, or management practices are associated with attrition, HR should compare leavers with retained employees and validate patterns across time and employee groups.

## Business Recommendations

1. **Review compensation competitiveness:** Benchmark pay by job role, experience, and department; investigate roles with repeated compensation-related exits.
2. **Strengthen career development:** Define transparent career paths, promotion criteria, and internal mobility opportunities.
3. **Monitor workload and overtime:** Review overtime and work-life balance indicators at department and job-role level.
4. **Improve manager effectiveness:** Use structured feedback, leadership training, and team-level retention reviews.
5. **Improve exit-interview coverage:** Investigate why 509 exit interviews were not completed and make the process easier to complete.
6. **Create an attrition monitoring routine:** Track attrition by month, department, job role, tenure, and exit reason.
7. **Prioritize evidence-based action:** Validate each suspected driver with employee feedback and comparisons between exited and active employees before implementing policy changes.

## Dashboard Overview

The supplied PDF contains a Power BI HR Analytics dashboard overview page. It presents workforce and attrition visuals with filters for year, department, job role, gender, and education.

**Dashboard validation required:** The supplied dashboard screenshot shows KPI values such as Total Employees `11K`, Active Employees `41K`, Attrition Rate `0.38`, and Total Attrition `4K`. It also shows a department table with 11,126 total employees and 40,769 active employees. These values do not reconcile with the 45,000 employee records and 4,231 exit records found in the notebooks.

Therefore, the dashboard KPI cards should **not** be treated as validated results in their current state. Check the Power BI relationships, filter context, aggregation logic, and DAX measures. In particular:

- Confirm that employee counts use the correct employee key and intended table.
- Confirm that active and exited populations are mutually exclusive and sum to the expected population.
- Confirm that the attrition numerator and denominator use the same population and filter context.
- Check for duplicate counting caused by table relationships.
- Reconcile Power BI totals with SQL results before publishing the dashboard.

## Data Quality and Validation Notes

The analysis found several points that should be addressed before publishing the project as a production-quality report:

1. **Active employee exit dates:** The 40,769 blank `ExitDate` values in the snapshot correspond to the active population shown in the notebook. These are likely expected blanks, not necessarily missing-data defects.
2. **Cleaning vs. inspection:** The supplied cleaning notebook performs data profiling and quality checks. It does not show a complete transformation pipeline. Describe it as data inspection and validation unless cleaning steps are added.
3. **Statistics scope:** The supplied statistics notebook contains an age descriptive-statistics check, not a full statistical study.
4. **Dashboard reconciliation:** Dashboard KPI values conflict with the employee and attrition table counts. Validate the model and measures before presenting those KPI values as final.
5. **Date keys:** Validate `HireDateID` and `ExitDateID` against the date dimension. The supplied notebook output shows date-key values that should be checked for consistency before time-based reporting.
6. **Causal claims:** Exit reasons are recorded categories. They do not, by themselves, prove the underlying cause of employee attrition.

## How to Run the Project

### Prerequisites

- Python 3.x
- Jupyter Notebook
- MySQL Server and MySQL Workbench (for SQL analysis)
- Power BI Desktop (for the dashboard)
- Python packages: `pandas`, `numpy`, `matplotlib`, `seaborn`

Install the Python packages:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 1. Clone the repository

```bash
git clone https://github.com/<your-username>/<repository-name>.git
cd <repository-name>
```

### 2. Add the source CSV files

Create a `data/` folder and place the six source CSV files inside it:

```text
data/
├── dim_date.csv
├── dim_department.csv
├── dim_employee.csv
├── dim_employee_snapshot.csv
├── dim_job_role.csv
└── fact_attrition.csv
```

The supplied notebooks currently refer to a local Windows path (`Desktop/csv`). Update the `csv_path` variable in each notebook to use the repository's `data/` folder, for example:

```python
from pathlib import Path

csv_path = Path("data")

dim_date = pd.read_csv(csv_path / "dim_date.csv")
dim_department = pd.read_csv(csv_path / "dim_department.csv")
dim_employee = pd.read_csv(csv_path / "dim_employee.csv")
dim_employee_snapshot = pd.read_csv(csv_path / "dim_employee_snapshot.csv")
dim_job_role = pd.read_csv(csv_path / "dim_job_role.csv")
fact_attrition = pd.read_csv(csv_path / "fact_attrition.csv")
```

### 3. Run the notebooks

Open Jupyter Notebook and run the notebooks in this order:

1. `Hr Data Cleening & Inspection.ipynb`
2. `HR Data EDA.ipynb`
3. `Hr Data Statistics.ipynb`

### 4. Run the SQL analysis

1. Create or select the MySQL database `hr_analytics_db`.
2. Import the six CSV tables using the table names referenced in the SQL script.
3. Open `Hr analysis EDA sql.sql` in MySQL Workbench.
4. Execute the queries and compare the results with the notebook findings.

### 5. Open the Power BI dashboard

Open the supplied `.pbix` file if available, refresh its data connections, and validate its measures against SQL. The uploaded project materials include a dashboard PDF preview; a Power BI `.pbix` file was not included in the supplied files.

## Repository Structure

A recommended GitHub structure is:

```text
HR-Analytics-Employee-Attrition/
│
├── data/
│   ├── dim_date.csv
│   ├── dim_department.csv
│   ├── dim_employee.csv
│   ├── dim_employee_snapshot.csv
│   ├── dim_job_role.csv
│   └── fact_attrition.csv
│
├── notebooks/
│   ├── Hr Data Cleening & Inspection.ipynb
│   ├── HR Data EDA.ipynb
│   └── Hr Data Statistics.ipynb
│
├── sql/
│   └── Hr analysis EDA sql.sql
│
├── dashboard/
│   ├── HR_Analytics_Dashboard.pbix
│   └── HR_Analytics_Dashboard_Preview.pdf
│
├── README.md
└── requirements.txt
```

Only include the CSV files and Power BI `.pbix` file if you have the right to distribute them. Otherwise, provide a data dictionary, a small anonymized sample, or instructions for obtaining the data.

## Limitations and Future Improvements

- Complete and document reproducible data-cleaning transformations.
- Add statistical comparisons between exited and active employees.
- Validate relationships and date keys across all tables.
- Reconcile all Power BI KPI cards with SQL calculations.
- Add monthly and yearly attrition trends after validating date relationships.
- Analyze attrition by tenure, salary band, overtime, satisfaction, and job role.
- Add a clearly documented data dictionary and source attribution.
- Consider a retention-risk model only after validating data quality, target definitions, and model fairness.

---

## Final Project Outcome

This project demonstrates how HR data can be inspected, explored, queried, and presented through a business intelligence dashboard. The analysis identifies **Better Opportunity, Compensation, Work-Life Balance, and Career Growth** as the most frequently recorded employee exit reasons. It also highlights the importance of voluntary-exit monitoring, exit-interview coverage, and dashboard KPI validation.

The findings can help HR teams prioritize further investigation and design evidence-based employee-retention initiatives.

**Project status:** Exploratory analysis and dashboard prototype completed; dashboard KPI reconciliation and reproducible cleaning documentation remain important next steps.
