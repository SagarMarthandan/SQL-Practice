show tables;

CREATE TABLE
    customers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(50)
    );

drop table customers;

drop table orders;

CREATE TABLE
    orders (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_date DATE,
        amount DECIMAL(8, 2),
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES customers (id)
    );

INSERT INTO
    customers (first_name, last_name, email)
VALUES
    ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2016-02-10', 99.99, 1),
    ('2017-11-11', 35.50, 1),
    ('2014-12-12', 800.67, 2),
    ('2015-01-03', 12.50, 2),
    ('1999-04-11', 450.25, 5);

select
    *
from
    customers;

select
    *
from
    orders;

select
    *
from
    orders as o
    join customers as c on o.customer_id = c.id;

SELECT
    *
FROM
    orders
WHERE
    customer_id = (
        SELECT
            id
        FROM
            customers
        WHERE
            last_name = 'George'
    );

SELECT
    *
FROM
    customers,
    orders;

SELECT
    *
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id;

SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id;

SELECT
    first_name,
    last_name,
    SUM(amount) AS total
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id
GROUP BY
    first_name,
    last_name
ORDER BY
    total;

SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    customers
    LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT
    order_date,
    amount,
    first_name,
    last_name
FROM
    orders
    LEFT JOIN customers ON orders.customer_id = customers.id;

SELECT
    first_name,
    last_name,
    IFNULL (SUM(amount), 0) AS money_spent
FROM
    customers
    LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY
    first_name,
    last_name;

SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    customers
    RIGHT JOIN orders ON customers.id = orders.customer_id;

CREATE TABLE
    customers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(50)
    );

CREATE TABLE
    orders (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_date DATE,
        amount DECIMAL(8, 2),
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
    );

create table
    students (
        id int primary key auto_increment,
        first_name varchar(50)
    );

create table
    papers (
        title VARCHAR(50),
        grade INT,
        student_id INT,
        FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE
    );

INSERT INTO
    students (first_name)
VALUES
    ('Caleb'),
    ('Samantha'),
    ('Raj'),
    ('Carlos'),
    ('Lisa');

INSERT INTO
    papers (student_id, title, grade)
VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);

select
    first_name,
    title,
    grade
from
    students
    join papers on students.id = papers.student_id
order by
    grade desc;

select
    first_name,
    title,
    grade
from
    students
    left join papers on students.id = papers.student_id
order by
    grade asc;

-- Final Exercise: Displaying all students and their papers (including NULLs)
SELECT
    first_name,
    IFNULL (title, 'MISSING') AS title,
    IFNULL (grade, 0) AS grade
FROM
    students
    LEFT JOIN papers ON students.id = papers.student_id;

select
    first_name,
    ifnull (avg(grade), 0) as average
from
    students
    left join papers on students.id = papers.student_id
group by
    first_name
order by
    average desc;

select
    first_name,
    ifnull (avg(grade), 0) as average,
    CASE
        WHEN avg(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
from
    students
    left join papers on students.id = papers.student_id
group by
    first_name
order by
    average desc;