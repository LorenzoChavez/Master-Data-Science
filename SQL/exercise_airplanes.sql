/*Which airplane has the highest number of engines?*/

SELECT manufacturer, model 
FROM optd_aircraft WHERE nb_engines=(SELECT MAX(nb_engines) FROM optd_aircraft);


/*What number of engines is most common on airplanes?*/

SELECT nb_engines, COUNT(nb_engines) 
FROM optd_aircraft GROUP BY nb_engines ORDER BY count DESC;


/*Select all entries from ref_airline_nb_of_flights and add their names from the table optd_airlines */

SELECT rf.*, al.name FROM ref_airline_nb_of_flights AS rf
LEFT OUTER JOIN optd_airlines AS al
ON rf.airline_code_2c=al."2char_code";
