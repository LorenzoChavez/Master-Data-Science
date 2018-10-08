/*compute a single result value from a set of input values*/

SELECT COUNT(*), AVG(age), MIN(age), MAX(age) FROM my_fb_friends;

/*use group by to aggregate by residence*/

SELECT residence, age, COUNT(*) FROM my_fb_friends
GROUP BY residence, age;


SELECT residence, COUNT(*), AVG(age) FROM my_fb_friends
GROUP BY residence HAVING AVG(age)>20;

/*use multiple queries*/

SELECT *,(SELECT AVG(age) 
		FROM my_fb_friends 
		WHERE residence='Madrid') AS Mad_average
FROM my_fb_friends 
WHERE age<(SELECT AVG(age) 
		FROM my_fb_friends WHERE residence='Madrid');


SELECT *
FROM my_fb_friends
WHERE residence IN (SELECT residence
		FROM my_fb_friends
		GROUP BY residence
		HAVING AVG(age)>35);


SELECT * FROM my_fb_friends
WHERE name = ANY (SELECT name FROM my_fb_friends 
			WHERE name LIKE '%a%');






