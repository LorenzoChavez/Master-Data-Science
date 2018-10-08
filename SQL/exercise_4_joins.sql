/*Use of different types of JOIN*/

SELECT fb.email                  
FROM my_fb_friends AS fb
INNER JOIN linkedin AS ln
ON fb.email=ln.email;


SELECT fb.*, ln.contact, ln.company                  
FROM my_fb_friends AS fb
LEFT OUTER JOIN linkedin AS ln
ON fb.email=ln.email;


SELECT ln.*, fb.name, fb.age, fb.residence
FROM my_fb_friends as fb
RIGHT OUTER JOIN linkedin AS ln
ON fb.email=ln.email;


SELECT ln.*, fb.*
FROM my_fb_friends as fb
FULL JOIN linkedin AS ln
ON fb.email=ln.email;
