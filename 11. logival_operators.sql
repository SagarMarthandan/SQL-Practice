SELECT * FROM books
WHERE released_year != 2017;
SELECT * FROM books
WHERE title NOT LIKE '%e%';
SELECT * FROM books
WHERE released_year > 2005;
SELECT * FROM books
WHERE pages > 500;
SELECT * FROM books
WHERE pages < 200;
SELECT * FROM books
WHERE released_year < 2000;
SELECT * FROM books
WHERE released_year <= 1985;
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';
SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;
SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;    SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year,
CASE
WHEN released_year >= 2000 THEN 'modern lit'
ELSE '20th century lit' 
END AS genre
FROM books;
SELECT 
title,
stock_quantity,
CASE
    WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
    WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
    WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
    WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
    ELSE '*****'
END AS stock
FROM
books;
SELECT 
title,
stock_quantity,
CASE
    WHEN stock_quantity <= 40 THEN '*'
    WHEN stock_quantity <= 70 THEN '**'
    WHEN stock_quantity <= 100 THEN '***'
    WHEN stock_quantity <= 140 THEN '****'
    ELSE '*****'
END AS stock
FROM
books;



select * from books;
select title from books where released_year < 1980;
select title from books where author_lname = 'Lahiri' and released_year > 2000;
select title from books where author_lname LIKE 'C%' OR author_lname LIKE 'S%';
select title, author_lname,
    CASE 
        WHEN title LIKE '%stories%' OR title like '&Stories&' THEN 'Short Stories'  
        WHEN title like 'Just Kids' or title like 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM books;

select author_lname, author_fname,
    CASE 
    WHEN count(*) = 1 THEN '1 book'
    ELSE CONCAT(count(*), ' books')
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;