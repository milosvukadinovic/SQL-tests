-- **** Join operation

-- 1. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player FROM goal 
  WHERE teamid = 'ger'

-- 2. Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game where id='1012'

-- 3. Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)  where teamid='ger'

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT  team1 ,team2,player 
  FROM game JOIN goal ON (id=matchid)  where player like 'mario%'

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach, gtime
  FROM goal goal JOIN eteam on teamid=id
 WHERE gtime<=10

-- 6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

select mdate, teamname from game
JOIN eteam ON (team1=eteam.id)
where coach='Fernando Santos'

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

select player from game
JOIN goal ON  (id=matchid)
where game.stadium='National Stadium, Warsaw'

-- 8. Instead show the name of all players who scored a goal against Germany.

SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' or team2='ger') and (teamid<>'ger')

-- 9. Show teamname and the total number of goals scored.

SELECT teamname, count(teamid) 
  FROM goal JOIN eteam ON teamid=eteam.id
group by teamname 
ORDER BY teamname

-- 10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, count(mdate) 
  FROM goal JOIN game ON matchid=game.id
group by stadium
ORDER BY stadium

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT id,mdate, count(mdate)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by id, mdate

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT id,mdate, count(mdate)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'ger' OR team2 = 'ger') and (goal.teamid='ger')
group by id, mdate

-- 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER by mdate, matchid, team1, team2

--*****Quizz

-- 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:

game  JOIN goal ON (id=matchid)

-- 2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:

 matchid, teamid, player, gtime, id, teamname, coach

-- 3.Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).

SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- 4.Select the result that would be obtained from this code:


DEN	9 June 2012
GER	9 June 2012


-- 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.

  SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

-- 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).

SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7. Select the result that would be obtained from this code:

Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2
