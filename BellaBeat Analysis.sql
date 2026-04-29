
USE Health_Tracker;

-- Average minutes spent in each activity level per day
SELECT
    ROUND(AVG(sedentary_minutes),0) AS avg_sedentary_minutes,
    ROUND(AVG(lightly_active_minutes),0) AS avg_lightly_active_minutes,
    ROUND(AVG(fairly_active_minutes),0) AS avg_fairly_active_minutes,
    ROUND(AVG(very_active_minutes),0) AS avg_very_active_minutes
FROM daily_activity; 

-- How the active rates differ between weekdays and weekends
SELECT 
    CASE 
    WHEN DAYOFWEEK(activity_date) IN (1,7) THEN 'Weekend'
ELSE 'Weekday'
END AS day_type,
    ROUND(AVG(sedentary_minutes),0) AS avg_sedentary_minutes,
    ROUND(AVG(lightly_active_minutes),0) AS avg_lightly_active_minutes,
    ROUND(AVG(fairly_active_minutes),0) AS avg_fairly_active_minutes,
    ROUND(AVG(very_active_minutes),0) AS avg_very_active_minutes
FROM daily_activity
GROUP BY day_type;

-- Does the hours of sleep/ sleep quality increase as the hours of activity increase? 
SELECT 
    da.id,
   ROUND(AVG(total_minutes_asleep)/60,0) AS avg_hours_asleep,
    ROUND(AVG(very_active_minutes)/60,0) AS avg_very_active_hours
FROM daily_activity da
JOIN sleep_day sd 
    ON da.id = sd.id
    AND DATE(sd.sleep_day)= DATE(da.activity_date)
GROUP BY da.id
ORDER BY avg_very_active_hours DESC;

-- Step vs calories
SELECT 
    id,
    ROUND(AVG(total_steps),0) AS avg_total_steps,
    ROUND(AVG(calories),0) AS avg_calories
FROM daily_activity 
GROUP BY id
ORDER BY avg_total_steps DESC;

-- Percentage of total tracked time spent in each activity level
SELECT
    ROUND(SUM(sedentary_minutes) / SUM(sedentary_minutes + lightly_active_minutes + fairly_active_minutes + very_active_minutes) * 100, 2) AS sedentary_percentage,
    ROUND(SUM(lightly_active_minutes) / SUM(sedentary_minutes + lightly_active_minutes + fairly_active_minutes + very_active_minutes) * 100, 2) AS lightly_active_percentage,
    ROUND(SUM(fairly_active_minutes) / SUM(sedentary_minutes + lightly_active_minutes + fairly_active_minutes + very_active_minutes) * 100, 2) AS fairly_active_percentage,
    ROUND(SUM(very_active_minutes) / SUM(sedentary_minutes + lightly_active_minutes + fairly_active_minutes + very_active_minutes) * 100, 2) AS very_active_percentage
    FROM daily_activity;

-- Time spent in bed vs time asleep and sleep efficiency percentage
SELECT
    AVG(total_time_in_bed) AS avg_time_in_bed,
    AVG(total_minutes_asleep) AS avg_time_asleep,
    ROUND(AVG(total_minutes_asleep) / AVG(total_time_in_bed) * 100, 2) AS sleep_efficiency_percentage   
FROM sleep_day;

