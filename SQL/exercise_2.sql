/*Add phone and username columns to your my_facebook_friends table.*/
/*Update the phone number of all of your my_facebook_friends*/
/*Try different sql commands to explore the table and extract data*/

ALTER TABLE my_fb_friends ADD COLUMN phone INT

UPDATE my_fb_friends SET phone = 678555;

SELECT *, (age*2) as doub_age from my_fb_friends where (age*2)>49;

SELECT DISTINCT residence FROM my_fb_friends;

SELECT * FROM my_fb_friends ORDER BY age DESC;

SELECT * FROM my_fb_friends
ORDER BY age DESC, name ASC;

SELECT * FROM my_fb_friends
ORDER BY age DESC
OFFSET 5
LIMIT 3;

SELECT * FROM my_fb_friends
WHERE age BETWEEN 18 AND 30;

SELECT * FROM my_fb_friends
WHERE age NOT IN (15, 16,17);
