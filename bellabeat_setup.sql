-- BELLABEAT Projec: Database setup

-- Select the database
USE Health_Tracker;

-- Create tables for the Health Tracker database
-- Dialy Activity Table

CREATE TABLE daily_activity(
    id BIGINT,
    activity_date DATE,
    total_steps INT,
    total_distance DECIMAL(10,2),
    tracker_distance DECIMAL(10,2),
    logged_activities_distance DECIMAL(10,2),
    very_active_distance DECIMAL(10,2),
    moderately_active_distance  DECIMAL(10,2),
    light_active_distance DECIMAL(10,2),
    sedentary_active_distance DECIMAL(10,2),
    very_active_minutes INT,
    fairly_active_minutes INT,
    lightly_active_minutes INT,
    sedentary_minutes INT,
    calories INT
);

-- Daily Sleep Table
CREATE TABLE sleep_day(
    id BIGINT,
    sleep_day DATETIME,
    total_sleep_records INT,
    total_minutes_asleep INT,
    total_time_in_bed INT
);
-- Hourly steps table
CREATE TABLE hourly_steps(
    id BIGINT,
    activity_hour DATETIME,
    step_total INT
);

-- Calories Burned per hour Table
CREATE TABLE calories_burned_per_hour(
    id BIGINT,
    activity_hour DATETIME,
    calories_burned INT
);


-- Check that the tables were created successfully
SHOW TABLES;

-- chech which folder 
SHOW VARIABLES LIKE 'secure_file_priv';


-- 'secure_file_priv' variable must be set to the directory where the data files are located
-- Ran mysql -u root -p --local-infile=1 Health_Tracker -e "LOAD DATA LOCAL INFILE.. in terminal in order to load data for the tables


-- preview firts 10 rows of each table
SELECT * FROM daily_activity LIMIT 10;
SELECT * FROM sleep_day LIMIT 10;
SELECT * FROM hourly_steps LIMIT 10;
SELECT * FROM calories_burned_per_hour LIMIT 10;
-- Structure verification
DESCRIBE daily_activity;

-- clears all data from the tables, but keeps the structure intact
USE Health_Tracker;
TRUNCATE TABLE sleep_day;
TRUNCATE TABLE daily_activity;
TRUNCATE TABLE hourly_steps;

