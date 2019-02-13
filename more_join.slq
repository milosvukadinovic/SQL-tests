-- 1.List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2.Give year of 'Citizen Kane'.
SELECT yr FROM movie where title = 'Citizen Kane'

-- 3.List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
-- Order results by year.


-- 4.What id number does the actor 'Glenn Close' have?
SELECT id from actor where name = 'Glenn Close'

-- 5.What is the id of the film 'Casablanca'
SELECT id from movie WHERE title = 'Casablanca'

-- 6.Obtain the cast list for 'Casablanca'.
-- what is a cast list?
-- Use movieid=11768, (or whatever value you got from the previous question)
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = (SELECT id FROM movie WHERE title = 'Casablanca');

-- 7.Obtain the cast list for the film 'Alien'
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien');

-- 8.List the films in which 'Harrison Ford' has appeared
SELECT title FROM movie JOIN casting ON id = movieid WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

-- 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title FROM movie JOIN casting ON id = movieid WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford' AND ORD != 1);

-- 10.List the films together with the leading star for all 1962 films.
SELECT title, name FROM movie JOIN casting ON movieid = id JOIN actor ON actor.id = casting.actorid WHERE movie.yr = 1962 AND ORD = 1;

-- 11.Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id where name='John Travolta'
	GROUP BY yr
	HAVING COUNT(title)=(SELECT MAX(c) FROM
	(SELECT yr,COUNT(title) AS c FROM
   	movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 	where name='John Travolta'
 	GROUP BY yr) AS t
	)
-- 12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name AS lead FROM movie JOIN casting ON (id = movieid AND ORD = 1) JOIN actor ON actorid = actor.id
  		WHERE movieid IN (SELECT movieid
                FROM  movie JOIN casting ON id = movieid
                JOIN actor ON actorid = actor.id
                WHERE name = 'Julie Andrews');

-- 13.Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
SELECT name FROM actor JOIN casting ON (id = actorid AND ORD = 1)GROUP BY name HAVING COUNT(movieid) >= 30;

-- 14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) AS num_actors FROM movie JOIN casting ON (id = movieid AND yr = 1978) GROUP BY title ORDER BY num_actors DESC, title;


-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid IN (SELECT movieid FROM actor JOIN casting ON id = actorid WHERE name = 'Art Garfunkel') AND name != 'Art Garfunkel';

-- quizz
-- 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- 2. Select the correct example of JOINing three tables
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4. Select the result that would be obtained from the following code:
 SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1

Answer is : Table-B

-- 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6. There are two sensible ways to connect movie and actor. They are:
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table

-- 7. Select the result that would be obtained from the following code:
SELECT title, yr 
   FROM movie, casting, actor 
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3

Answer is: Table-B
