#1.	Using COUNT, get the number of cities in the USA.
Select code, name FROM country; #United States = USA
SELECT * FROM city; #ID and CountryCode are relevant. could maybe join COUNTRY and CITY on country code? 
#ci JOIN country c ON ci.CountryCode=c.code WHERE Code = 'United States';

SELECT DISTINCT COUNT(ID) FROM city WHERE CountryCode = 'USA';
SELECT DISTINCT COUNT(ci.ID) FROM city ci JOIN country co ON ci.CountryCode=co.code WHERE co.name = 'United States'; 
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
WHERE Name LIKE '%F'; 

#7.	Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT DISTINCT co.Name, COUNT(ci.Countrycode) from city ci 
JOIN country co
ON ci.CountryCode=co.code 
WHERE co.name='China';

#8.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT NAME, Population FROM country 
WHERE Population IS NOT NULL AND Population !=0 
ORDER BY Population Limit 1;

#9.	Using aggregate functions, return the number of countries the database contains.

SELECT COUNT(name) as NumberOfCountries FROM country;

#10.	What are the top ten largest countries by area?

SELECT NAME, SurfaceArea FROM Country
ORDER BY SurfaceArea DESC LIMIT 10;

#11.	List the five largest cities by population in Japan.

SELECT ci.name, ci.population FROM city ci 
JOIN Country Co 
ON ci.CountryCode=co.code
WHERE co.name = 'Japan'
ORDER BY ci.population DESC LIMIT 5;

#12.	List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

UPDATE country SET HeadOfState = 'Elizabeth II' WHERE HeadOfState = 'Elisabeth II';

SELECT DISTINCT Code, Name FROM country
WHERE HeadOfState = 'Elisabeth II'; #change to Elizbeth when above runs outside of safe mode. 


#13.	List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT Name, Population, SurfaceArea, Population/SurfaceArea AS ratio
FROM country
WHERE population / SurfaceArea !=0 AND Population/SurfaceArea IS NOT NULL
ORDER BY ratio LIMIT 10;

#14.	List every unique world language.

SELECT DISTINCT LANGUAGE FROM countrylanguage 
ORDER BY Language; 

#15.	List the names and GNP of the world's top 10 richest countries.

SELECT name, GNP FROM country
ORDER BY GNP DESC LIMIT 10;

#16.	List the names of, and number of languages spoken by, the top ten most multilingual countries.

SELECT co.name, COUNT(cl.language)
FROM country co
JOIN countrylanguage cl
ON co.code=cl.CountryCode
GROUP BY CountryCode
ORDER BY COUNT(Language) DESC;

#17.	List every country where over 50% of its population can speak German.

SELECT co.name, sum(cl.percentage)
FROM country co 
JOIN countrylanguage cl 
ON co.code=cl.CountryCode
WHERE cl.language = 'German'
GROUP BY cl.CountryCode
HAVING sum(cl.percentage) > 50
ORDER BY cl.percentage; 

#18.	Which country has the worst life expectancy? Discard zero or null values.

SELECT NAME, LifeExpectancy 
FROM country 
WHERE LifeExpectancy IS NOT NULL != 0 
ORDER BY LifeExpectancy LIMIT 1;

#19.	List the top three most common government forms.

SELECT GovernmentForm, COUNT(GovernmentForm)
FROM country
GROUP BY GovernmentForm
ORDER BY COUNT(GovernmentForm) DESC LIMIT 3;

#20.	How many countries have gained independence since records began?

SELECT COUNT(IndepYear) AS NumberOfIndepCountries 
FROM country
WHERE IndepYear IS NOT NULL;

