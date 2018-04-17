CREATE DATABASE friends;

CREATE TABLE facebook (name VARCHAR, age INT, city VARCHAR, email VARCHAR);

SELECT * FROM my_fb_friends WHERE age <18 OR age>65;

SELECT * FROM my_fb_friends WHERE residence NOT LIKE 'Madrid';
