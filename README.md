# Netflix Movies & TV Shows – SQL Data Analysis

**Overview**

This project analyzes the Netflix Movies and TV Shows dataset using MySQL. The goal is to explore content trends, identify patterns in ratings, countries, directors, and durations, and answer real business questions using SQL — from basic aggregations to window functions and CTEs.

##Objectives
Compare the distribution of Movies vs TV Shows
Identify the most common ratings for Movies and TV Shows
Analyze content by release year, country, and duration
Find top directors and recurring collaborations
Categorize content based on audience suitability (Kids/Teen/Adult)

##Dataset
Source: Netflix Movies and TV Shows dataset
File: netflix_titles.csv
Rows: ~8,800 titles
Columns: show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description

##Tools Used
MySQL 8.0
SQL concepts: Aggregate functions, GROUP BY/HAVING, CASE statements, Window functions (RANK, ROW_NUMBER), CTEs, Subqueries, Self-joins, String & Date functions

##Files in this Repo
File	Description
Netflix_data.sql	Table creation, data import, and all business problem queries
netflix_titles.csv	Raw dataset
README.md	Project documentation

##Business Problems Solved
Count of Movies vs TV Shows
Most common rating per content type
Movies released in a specific year
Top 5 countries by content volume
Longest movie on the platform
Content added in the last 10 years
Latest Movies and TV Shows added
All titles directed by a specific director
TV Shows with more than 5 seasons
Directors with unusually long name fields
Average gap between release year and date added
Most recent title per director
Titles released in the peak content year
Percentage of titles missing director info
Directors who released multiple titles the same year
Content categorized as Kids/Teen/Adult based on rating


##Key Insights
Movies make up a significantly larger share of the catalog than TV Shows.
TV-MA and TV-14 are the most frequent ratings, indicating Netflix's catalog skews toward mature/teen audiences.
The United States and India are consistently among the top content-producing countries.
A large share of titles were added in the last 5–10 years, reflecting Netflix's rapid content expansion.
