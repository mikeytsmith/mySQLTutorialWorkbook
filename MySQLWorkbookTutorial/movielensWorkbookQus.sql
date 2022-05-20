#1.	List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date FROM movies WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01' ORDER BY release_date DESC;

#2.	Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT * FROM movies; 
Select * FROM ratings;
#practise stuff
#SELECT MIN(rating) FROM ratings; #1
#SELECT * FROM ratings WHERE rating = 1; 
#SELECT COUNT(id) FROM ratings; #100,000
#SELECT COUNT(id) FROM ratings where rating =1; #6110

SELECT m.title, AVG(r.rating) AS average_rating FROM ratings r 
JOIN movies m 
ON m.id=r.movie_id 
GROUP BY r.movie_id ORDER BY average_rating;

#3.	List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
#select * from genres WHERE name = 'Sci-Fi'; #id = 15
#SELECT * FROM genres_movies; #movie_id and genre_id
#SELECT * FROM occupations WHERE name = 'student'; #id = 19
#SELECT * FROM users where age = 24 AND gender = 'M' AND occupation_id = 19; #id  27 rows running count  1,4,31,69,73,75,105,132,268,293,301,369,414,431,435,456,470,472,517,567,627,641,717,832,867,,889,936
#Select * FROM ratings WHERE rating = 5; #user_id, movie_id

#SELECT * FROM movies m JOIN genres_movies gm ON m.id=gm.movie_id WHERE genre_id = 15 ;

#our answer below wasnt quite right 
SELECT DISTINCT r.movie_id FROM ratings r 
JOIN genres_movies gm ON r.movie_id=gm.movie_id
JOIN users u ON r.user_id=u.id
WHERE u.gender ='M' AND u.age = 24 AND u.occupation_id=19 AND r.rating=5 AND gm.genre_id=15
group by r.movie_id;

#tried to make it work out sci-fi = genre_id =15 (SELECT genre FROM genres g JOIN genres_movies gm ON  g.id=gm.genre_id WHERE g.name='SCI-FI')
#if i could work this out could do the same for occupation_id = 9 for student 
#would of liked to have shown movie title 

#answer from ASH
SELECT DISTINCT m.title 
FROM users u 
JOIN occupations o ON
u.occupation_id=o.id 
JOIN ratings r ON u.id=r.user_id
JOIN movies m ON 
r.movie_id=m.id
JOIN genres_movies gm ON 
gm.movie_id=m.id
JOIN genres g ON 
g.id=gm.genre_id
WHERE gender ='M'
AND g.name='Sci-Fi'
AND o.name='Student'
AND rating =5
AND age=24; 

#4.	List the unique titles of each of the movies released on the most popular release day.
SELECT * FROM movies; 
Select * FROM ratings;
SELECT DISTINCT title from movies 
WHERE release_date=
(select release_date from movies
group by release_date
order by COUNT(release_date) DESC limit 1);

#SELECT column, COUNT(*) AS magnitude FROM table GROUP BY column ORDER BY magnitude DESC LIMIT 1

#5.	Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT g.name, COUNT(gm.movie_id) AS count FROM genres_movies gm JOIN genres g ON g.id=gm.genre_id GROUP BY genre_id ORDER BY count ; 