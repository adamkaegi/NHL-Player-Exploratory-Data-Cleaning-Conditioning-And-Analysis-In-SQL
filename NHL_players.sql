-- Import the csv files via the import wizard

-- Inspect one of the csv files to select fields for analysis

SELECT *
From NHL_Players.."skaters (0)"

-- Comibine the tables into one table, selecting only desired columns

DROP Table if exists skaters
SELECT season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
INTO skaters
From NHL_Players.."skaters (0)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (1)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (2)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (3)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (4)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (5)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (6)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (7)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (8)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (9)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (10)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (11)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (12)"
UNION 
Select season, name, team, position, icetime, shifts, faceoffsWon, faceoffsLost, 
penalityMinutes, penalityMinutesDrawn, I_F_primaryAssists, I_F_secondaryAssists, 
I_F_shotsOnGoal, I_F_missedShots, I_F_points, I_F_goals, I_F_rebounds, situation
From NHL_Players.."skaters (13)"

-- Display the data

SELECT *
From skaters

-- The data has situations: all, 5v5, 5v4, 4v5, 4v4, other
-- Filter out any data not with the situation being all

DELETE FROM skaters WHERE situation!='all';

-- Drop the unwanted situation column

Alter Table skaters Drop COLUMN situation

-- Fix the column names

EXEC sp_rename 'skaters.I_F_primaryAssists', 'primaryAssists', 'COLUMN'
EXEC sp_rename 'skaters.I_F_secondaryAssists', 'secondaryAssists', 'COLUMN'
EXEC sp_rename 'skaters.I_F_shotsOnGoal', 'shotsOnGoal', 'COLUMN'
EXEC sp_rename 'skaters.I_F_missedShots', 'missedShots', 'COLUMN'
EXEC sp_rename 'skaters.I_F_points', 'points', 'COLUMN'
EXEC sp_rename 'skaters.I_F_goals', 'goals', 'COLUMN'
EXEC sp_rename 'skaters.I_F_rebounds', 'rebounds', 'COLUMN'

-- Check the data types (in data studio)

-- Add column for totalAssists 

ALTER TABLE skaters 
ADD totalAssists FLOAT (53) NULL

UPDATE skaters
SET totalAssists = primaryAssists + secondaryAssists

-- Check for duplicates

SELECT name, season, team, COUNT(*)
FROM skaters
GROUP BY name, season, team
HAVING COUNT(*) > 1

-- Save the csv in data studio

SELECT *
From skaters

-- Split first and last name

SELECT
SUBSTRING(name, 1, CHARINDEX(' ', name) -1 ) as firstName
, SUBSTRING(name, CHARINDEX(' ', name) + 1 , LEN(name)) as lastName
From skaters

-- Temporarily change names

Select name
, CASE When name = 'Alex Ovechkin' THEN 'Ovy'
	   END as temp
From skaters

-- Most time on ice in a season

Select name, team,season, icetime , shifts,  (icetime/shifts) as timePerShift
From skaters
order by 4 Desc

-- Top players ice time in a season(without player duplicates from diferent seasons)

Select name, team, MAX(icetime) as maxIceTime
From skaters
Group by name, team
order by maxIceTime desc

-- Most time on ice in a season on the ottawa senators

Select name, team,season, icetime , shifts,  (icetime/shifts) as timePerShift
From skaters
Where team like 'OTT'
order by 4 Desc

-- Most ice time from 2008-2021

Select name, team, SUM(icetime) as totalIceTime, SUM(shifts) as totalShifts
From skaters
group by name, team
order by 3 desc


-- Make a cte for the ottawa senators

WITH Ottawa_Senators AS (
    SELECT *
    From skaters a
    WHERE a.team like 'OTT'
)
SELECT *
FROM Ottawa_Senators;

-- Top total penalty minutes for ottawa senators from cte

WITH Ottawa_Senators AS (
    SELECT *
    From skaters a
    WHERE a.team like 'OTT'
)
Select name, SUM(penalityMinutes) as totalPenaltyMinutes
From Ottawa_Senators
group by name
order by 2 desc
