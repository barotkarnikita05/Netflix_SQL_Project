# Netflix Movies & TV Shows – SQL Data Analysis
![Netflix_logo](https://github.com/barotkarnikita05/Netflix_SQL_Project/blob/main/netflix.png)

**Overview**

This project analyzes the Netflix Movies and TV Shows dataset using MySQL. The goal is to explore content trends, identify patterns in ratings, countries, directors, and durations, and answer real business questions using SQL — from basic aggregations to window functions and CTEs.

**Objectives**

Compare the distribution of Movies vs TV Shows
Identify the most common ratings for Movies and TV Shows
Analyze content by release year, country, and duration
Find top directors and recurring collaborations
Categorize content based on audience suitability (Kids/Teen/Adult)

**Dataset**

Source: Netflix Movies and TV Shows dataset
File: netflix_titles.csv
Rows: ~8,800 titles
Columns: show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description

**Tools Used**
MySQL 8.0
SQL concepts: Aggregate functions, GROUP BY/HAVING, CASE statements, Window functions (RANK, ROW_NUMBER), CTEs, Subqueries, Self-joins, String & Date functions

**Files in this Repo**
File	Description
Netflix_data.sql	Table creation, data import, and all business problem queries
netflix_titles.csv	Raw dataset
README.md	Project documentation

**Business Problems Solved**
  1. Count of Movies vs TV Shows
  2. Most common rating per content type
  3. Movies released in a specific year
  4. Top 5 countries by content volume
  5. Longest movie on the platform
  6. Content added in the last 10 years
  7. Latest Movies and TV Shows added
  8. All titles directed by a specific director
  9. TV Shows with more than 5 seasons
  10. Directors with unusually long name fields
  11. Average gap between release year and date added
  12. Most recent title per director
  13. Titles released in the peak content year
  14. Percentage of titles missing director info
  15. Directors who released multiple titles the same year
  16. Content categorized as Kids/Teen/Adult based on rating


**Key Insights**
Movies make up a significantly larger share of the catalog than TV Shows.
TV-MA and TV-14 are the most frequent ratings, indicating Netflix's catalog skews toward mature/teen audiences.
The United States and India are consistently among the top content-producing countries.
A large share of titles were added in the last 5–10 years, reflecting Netflix's rapid content expansion.
