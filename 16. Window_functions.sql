CREATE TABLE
    employees (
        emp_no INT PRIMARY KEY AUTO_INCREMENT,
        department VARCHAR(20),
        salary INT
    );

INSERT INTO
    employees (department, salary)
VALUES
    ('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000);

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER ()
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    MIN(salary) OVER (),
    MAX(salary) OVER ()
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    MIN(salary),
    MAX(salary)
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY
            department
    ) AS avg_salary_by_dept
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY
            department
    ) AS dept_avg,
    AVG(salary) OVER () AS company_avg
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    COUNT(*) OVER (
        PARTITION BY
            department
    ) as dept_count
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY
            department
    ) AS dept_payroll,
    SUM(salary) OVER () AS total_payroll
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY
            department
        ORDER BY
            salary
    ) AS rolling_dept_salary,
    SUM(salary) OVER (
        PARTITION BY
            department
    ) AS total_dept_salary
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    MIN(salary) OVER (
        PARTITION BY
            department
        ORDER BY
            salary DESC
    ) as rolling_min
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    dense_rank() over (
        PARTITION BY
            department
        ORDER BY
            salary DESC
    ) as dept_rank,
    rank() over (
        order by
            salary DESC
    ) as company_rank,
    dense_rank() over (
        order by
            salary DESC
    ) as dense_company_rank,
    row_number() over (
        PARTITION BY
            department
        ORDER BY
            salary DESC
    ) as dept_rank_row,
    row_number() over (
        order by
            salary DESC
    ) as company_rank_row
FROM
    employees;

ORDER BY
    department;

SELECT
    emp_no,
    department,
    salary,
    NTILE (4) OVER (
        ORDER BY
            salary DESC
    ) AS salary_quartile
FROM
    employees
ORDER BY
    department;

SELECT
    emp_no,
    department,
    salary,
    FIRST_VALUE (emp_no) OVER (
        PARTITION BY
            department
        ORDER BY
            salary DESC
    ) as highest_paid_dept,
    FIRST_VALUE (emp_no) OVER (
        ORDER BY
            salary DESC
    ) as highest_paid_overall
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    salary - LAG (salary) OVER (
        ORDER BY
            salary DESC
    ) as salary_diff
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    salary - LAG (salary) OVER (
        PARTITION BY
            department
        ORDER BY
            salary DESC
    ) as dept_salary_diff
FROM
    employees;