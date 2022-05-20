#1.	List all actors.

Select first_name, last_name, actor_id FROM actor;

#2.	Find the surname of the actor with the forename 'John'.

SELECT last_name FROM actor WHERE first_name='John';

#3.	Find all actors with surname 'Neeson'.

SELECT first_name FROM actor WHERE last_name = 'Neeson';

#4.	Find all actors with ID numbers divisible by 10.

Select first_name, last_name, actor_id FROM actor WHERE (actor_id%10) = 0  ;

#5.	What is the description of the movie with an ID of 100?

SELECT film_id, title, description FROM film where film_id = 100;

#6.	Find every R-rated movie.

Select title, rating FROM film where rating = 'R';

#7.	Find every non-R-rated movie.

SELECT title, rating FROM film WHERE rating != 'R';

#8.	Find the ten shortest movies.

SELECT  title, length FROM film 
ORDER BY length asc LIMIT 10 ;

#9.	Find the movies with the longest runtime, without using LIMIT.

SELECT  title, MAX(length) FROM film ;

#10.	Find all movies that have deleted scenes.

SELECT title, special_features from film WHERE special_features LIKE '%DELETED SCENES'; 

#11.	Using HAVING, reverse-alphabetically list the last names that are not repeated.

SELECT DISTINCT last_name FROM actor ORDER BY last_name DESC;
  
#12.	Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
#13.	Which actor has appeared in the most films?
#14.	When is 'Academy Dinosaur' due?
#15.	What is the average runtime of all films?
#16.	List the average runtime for every film category.
#17.	List all movies featuring a robot.
#18.	How many movies were released in 2010?
#19.	Find the titles of all the horror movies.
#20.	List the full name of the staff member with the ID of 2.
#21.	List all the movies that Fred Costner has appeared in.
#22.	How many distinct countries are there?
#23.	List the name of every language in reverse-alphabetical order.
#24.	List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
#25.	Which category contains the most films?
