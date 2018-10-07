/*Create 'friends' DB if it does not exist.*/
/*Generate 'Facebook' table where every person is identified with the name, age,
city of residence, and email. The table should at least have 10 rows*/
/*Write a query to obtain Facebook friends which are younger than <18 or older
than 65 years.*/
/*Write a query to obtain all the facebook friends which do not reside in Madrid.*/

CREATE DATABASE friends;

CREATE TABLE my_fb_friends (name VARCHAR, age INT, residence VARCHAR, email VARCHAR);

SELECT * FROM my_fb_friends WHERE age <18 OR age>65;

SELECT * FROM my_fb_friends WHERE residence NOT LIKE 'Madrid';
