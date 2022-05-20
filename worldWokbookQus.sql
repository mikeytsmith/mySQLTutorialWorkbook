#1.	Using COUNT, get the number of cities in the USA.
Select code, name FROM country; #United States = USA
SELECT * FROM city; #ID and CountryCode are relevant. could maybe join COUNTRY and CITY on country code? 
#ci JOIN country c ON ci.CountryCode=c.code WHERE Code = 'United States';

SELECT DISTINCT COUNT(ID) FROM city WHERE CountryCode = 'USA';

#2.	Find out the population and life expectancy for people in Argentina.

SELECT Population, LifeExpectancy FROM country WHERE name = 'ARGENTINA';

#3.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
#did this one need not null?
SELECT name, LifeExpectancy  FROM country 
WHERE LifeExpectancy IS NOT NULL 
ORDER BY LifeExpectancy DESC 
LIMIT 1;

#4.	Using JOIN ... ON, find the capital city of Spain.

SELECT Capital, ci.name FROM country co 
JOIN city ci ON co.code=ci.CountryCode 
WHERE ci.ID =co.capital AND co.name ='SPAIN' ;

#5.	Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
Select DISTINCT cl.Language FROM country co 
JOIN CountryLanguage cl ON co.code=cl.CountryCode
WHERE co.Region = 'SouthEast Asia' ORDER By cl.Language ;  

#6.	Using a single query, list 25 cities around the world that start with the letter F.

SELECT Name FROM city 
WHERE Name IN '%F'; 

#7.	Using COUNT and JOIN ... ON, get the number of cities in China.


#8.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.


#9.	Using aggregate functions, return the number of countries the database contains.


#10.	What are the top ten largest countries by area?


#11.	List the five largest cities by population in Japan.


#12.	List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!


#13.	List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.


#14.	List every unique world language.


#15.	List the names and GNP of the world's top 10 richest countries.


#16.	List the names of, and number of languages spoken by, the top ten most multilingual countries.


#17.	List every country where over 50% of its population can speak German.


#18.	Which country has the worst life expectancy? Discard zero or null values.


#19.	List the top three most common government forms.


#20.	How many countries have gained independence since records began?


