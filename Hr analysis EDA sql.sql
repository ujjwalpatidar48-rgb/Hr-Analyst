# HR Analytics – SQL Exploratory Data Analysis (EDA)

-- Database
USE hr_analytics_db;

-- 1. Total Employees
SELECT
    COUNT(DISTINCT EmployeeID) AS Total_Employees
FROM dim_employee;

-- 2. Gender-Wise Employee Distribution
SELECT
    Gender,
    COUNT(DISTINCT EmployeeID) AS Total_Employees
FROM dim_employee
GROUP BY Gender
ORDER BY Total_Employees DESC;

-- 3. Department-Wise Employee Distribution
SELECT
    d.DepartmentName,
    COUNT(DISTINCT e.EmployeeID) AS Total_Employees
FROM dim_employee e
JOIN dim_department d
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY Total_Employees DESC;

-- 4. Average Employee Age
SELECT
    ROUND(AVG(Age), 2) AS Average_Age
FROM dim_employee;

-- 5. Education-Wise Employee Distribution
SELECT
    Education,
    COUNT(DISTINCT EmployeeID) AS Total_Employees
FROM dim_employee
GROUP BY Education
ORDER BY Total_Employees DESC;

-- 6. Job Role-Wise Employee Distribution
SELECT
    j.JobRole,
    COUNT(DISTINCT e.EmployeeID) AS Total_Employees
FROM dim_employee e
JOIN dim_job_role j
    ON e.JobRoleID = j.JobRoleID
GROUP BY j.JobRole
ORDER BY Total_Employees DESC;

-- 7. Overall Attrition Count
SELECT
    COUNT(DISTINCT EmployeeID) AS Total_Attrition
FROM dim_employee_snapshot
WHERE Attrition = 1;

-- 8. Department-Wise Attrition
SELECT
    d.DepartmentName,
    COUNT(DISTINCT s.EmployeeID) AS Total_Attrition
FROM dim_employee_snapshot s
JOIN dim_department d
    ON s.DepartmentID = d.DepartmentID
WHERE s.Attrition = 1
GROUP BY d.DepartmentName
ORDER BY Total_Attrition DESC;

-- 9. Average Monthly Income by Department
SELECT
    d.DepartmentName,
    ROUND(AVG(s.MonthlyIncome), 2) AS Average_Monthly_Income
FROM dim_employee_snapshot s
JOIN dim_department d
    ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY Average_Monthly_Income DESC;

-- 10. Average Job Satisfaction by Department
SELECT
    d.DepartmentName,
    ROUND(AVG(s.JobSatisfaction), 2) AS Average_Job_Satisfaction
FROM dim_employee_snapshot s
JOIN dim_department d
    ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY Average_Job_Satisfaction DESC;

-- 11. Employee Status Distribution
SELECT
    Status,
    COUNT(DISTINCT EmployeeID) AS Total_Employees
FROM dim_employee_snapshot
GROUP BY Status
ORDER BY Total_Employees DESC;

-- 12. Average Years at Company by Department
SELECT
    d.DepartmentName,
    ROUND(AVG(s.YearsAtCompany), 2) AS Average_Years_At_Company
FROM dim_employee_snapshot s
JOIN dim_department d
    ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY Average_Years_At_Company DESC;

-- 13. Overtime-Wise Attrition
SELECT
    OverTime,
    COUNT(DISTINCT EmployeeID) AS Total_Attrition
FROM dim_employee_snapshot
WHERE Attrition = 1
GROUP BY OverTime
ORDER BY Total_Attrition DESC;

-- 14. Average Work-Life Balance
SELECT
    ROUND(AVG(WorkLifeBalance), 2) AS Average_Work_Life_Balance
FROM dim_employee_snapshot;

-- 15. Attrition Rate
SELECT
    COUNT(DISTINCT CASE
        WHEN Attrition = 1 THEN EmployeeID
    END) AS Total_Attrition,
    COUNT(DISTINCT EmployeeID) AS Total_Employees,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN Attrition = 1 THEN EmployeeID
        END) /
        NULLIF(COUNT(DISTINCT EmployeeID), 0),
        2
    ) AS Attrition_Rate_Percent
FROM dim_employee_snapshot;
