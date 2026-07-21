create database Netflix_db1;
show databases;

use Netflix_db1;
select * from netflix;
drop table netflix;

drop table if exists netflix;
create table netflix(
	show_id	varchar(6),
	type varchar(10),
	title varchar(150),
	director varchar(208),
	cast varchar(1000),
	country	varchar(150),
	date_added varchar(50),
	release_year int,
	rating varchar(10),	
	duration varchar(15),
	listed_in varchar(100),
	description varchar(250)
);

SHOW global variables like 'local_infile';

set global local_infile = 1;

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\netflix_titles.csv'
INTO TABLE netflix
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;

select * from netflix;
-- Business Problems
SELECT COUNT(*) FROM netflix;

-- 1. Count the number of movies vs TV shows
select distinct(type), count(*) from netflix
group by type;

-- 2. Find the most common rating for movies and TVshows
select 
	type, 
    rating 
from
(
	select type, rating, count(*), 
	 Rank() over(partition by type order by count(*) desc) as ranking
	 from netflix
	group by type, rating
	-- order by count(*) desc
) as T1
 where 
	ranking = 1;
 
 -- 3. List all the movies released in a specific year(eg., 2020)
 select * from netflix
 where 
	type = 'Movie' and
	release_year = '2020';

-- 4. Find the top 5 countries with the most content on netflix
select country, count(show_id) from netflix
group by country
order by count(show_id) desc
limit 5;

-- 5. Identify the longest movie
select * from netflix
where type = 'Movie'
 and duration = (select max(duration) from netflix);
 
 -- 6. Find content added in the last 10 years
select * from netflix
where 
  str_to_date(trim(date_added), '%M %d, %y') >= date_sub(now(), interval 10 year);
  
-- 7. Latest movie or TVshow
(SELECT type, title, release_year 
 FROM netflix 
 WHERE type = 'Movie' 
 ORDER BY release_year DESC 
 LIMIT 10)

UNION ALL

(SELECT type, title, release_year 
 FROM netflix 
 WHERE type = 'TV Show' 
 ORDER BY release_year DESC 
 LIMIT 10);

-- 8. Find all the movies/tvshows directed by 'Rajiv Chilaka'
select * from netflix
where director like '%Rajiv Chilaka%';

-- 9. List all tvshows with more than 5 seasons
select * from netflix
where type = 'TV show' 
      and 
      duration > '5 seasons';

-- 10. Find directors whose name has more than 20 characters(LENGTH), useful for detecting multiple co-directors.
SELECT director, LENGTH(director) AS name_length
FROM netflix
WHERE director IS NOT NULL
ORDER BY name_length DESC
LIMIT 10;

-- 11. Find the average gap (in days) between a title's release year and the date it was added to Netflix.
SELECT title,
       release_year,
       STR_TO_DATE(date_added, '%d-%b-%y') AS added_date,
       DATEDIFF(STR_TO_DATE(date_added, '%d-%b-%y'), MAKEDATE(release_year, 1)) AS days_after_release
FROM netflix
WHERE date_added IS NOT NULL
ORDER BY days_after_release DESC
LIMIT 10;

-- 12. For each director, find their most recent title
WITH ranked AS (
    SELECT title, director, release_year,
           ROW_NUMBER() OVER (PARTITION BY director ORDER BY release_year DESC) AS rn
    FROM netflix
    WHERE director IS NOT NULL AND director <> ''
)
SELECT director, title, release_year
FROM ranked
WHERE rn = 1;

-- 13. Find all titles released in the year that had the maximum number of releases overall.
SELECT title, release_year
FROM netflix
WHERE release_year = (
    SELECT release_year
    FROM netflix
    GROUP BY release_year
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 14. Find the percentage of titles missing a director.
SELECT
    ROUND(SUM(CASE WHEN director IS NULL OR director = '' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_missing_director
FROM netflix;

-- 15. Find pairs of titles that share the same director and were released in the same year.
SELECT a.title AS title_1, b.title AS title_2, a.director, a.release_year
FROM netflix a
JOIN netflix b
     ON a.director = b.director
    AND a.release_year = b.release_year
    AND a.show_id < b.show_id
WHERE a.director IS NOT NULL AND a.director <> '';

-- 16. Categorize all titles as 'Kids', 'Teen', or 'Adult' content based on rating.
SELECT title, rating,
       CASE
           WHEN rating IN ('G', 'TV-Y', 'TV-Y7', 'TV-G') THEN 'Kids'
           WHEN rating IN ('PG', 'PG-13', 'TV-PG', 'TV-14') THEN 'Teen'
           WHEN rating IN ('R', 'TV-MA', 'NC-17') THEN 'Adult'
           ELSE 'Unrated'
       END AS audience_category
FROM netflix;