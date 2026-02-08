USE demo;

CREATE TABLE cats(
	name VARCHAR(50),
    age INT
);

CREATE TABLE dogs(
	name varchar(50),
    breed varchar(50),
    age int
);

SHOW COLUMNS FROM dogs;

DESC cats;

INSERT INTO cats(name, age)
VALUES("Jackson",7);   
INSERT INTO cats(name, age)
VALUES("Blue",5);

INSERT INTO cats(name)
VALUES("Oscar");

INSERT INTO cats(name, age)
VALUES("Mittens",3),
("Whiskers",2),
("Shadow",4); 

SELECT * FROM cats;

CREATE TABLE pastries(
	name varchar(50),
    quantity int
    );
    
DROP TABLE pastries;

CREATE TABLE people(
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

INSERT INTO people(first_name, last_name, age)
VALUES("Tina", "Belcher", 13);
INSERT INTO people(first_name, last_name, age)
VALUES("Bob", "Belcher", 42);

INSERT INTO people(first_name, last_name, age)
VALUES("Linda", "Belcher", 40),
("Gene", "Belcher", 11),
("Louise", "Belcher", 9);

SELECT * FROM cats4;

DROP TABLE people;

SHOW TABLES;

CREATE TABLE cats2(
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

desc cats2;

    CREATE TABLE cats3  (    
        name VARCHAR(20) DEFAULT 'no name provided',    
        age INT DEFAULT 99  
    );

DESC cats4;
INSERT INTO cats3(age) VALUES(13);
INSERT INTO cats3() VALUES();
    CREATE TABLE cats4  (    
        name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
        age INT NOT NULL DEFAULT 99 
    );

    CREATE TABLE unique_cats (
    	cat_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL
    );

    CREATE TABLE unique_cats3 (
        cat_id INT AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL,
        PRIMARY KEY (cat_id)
    );

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed'
);

    INSERT INTO employees(first_name, last_name, age) VALUES
    ('Dora', 'Smith', 58);

SELECT * FROM employees;