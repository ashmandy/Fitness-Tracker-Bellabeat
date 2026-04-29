# Bellabeat Smart Device Usage Analysis
### Google Data Analytics Certificate — Capstone Case Study 2

## Project Overview
This case study was completed as the capstone project for the Google Data 
Analytics Professional Certificate. As a junior data analyst on Bellabeat's 
marketing analytics team, the goal was to analyze smart device usage data 
from Fitbit users to uncover behavioral trends and apply those insights to 
Bellabeat's **Leaf wellness tracker** to inform marketing strategy.

---

## Business Task
Analyze how consumers use Bellabeat smart devices and identify trends 
that can guide Bellabeat's marketing strategy for the Leaf tracker.

---

## Dataset
- **Source:** FitBit Fitness Tracker Data — Kaggle (CC0: Public Domain, 
made available by Mobius)
- **Collection Method:** Distributed survey via Amazon Mechanical Turk 
(April 12 – May 12, 2016)
- **Participants:** 30 Fitbit users who consented to share personal 
tracker data
- **Tables Used:**

| Table | Description | Rows |
|---|---|---|
| `daily_activity` | Steps, distance, active minutes, calories | 940 |
| `sleep_day` | Sleep records, minutes asleep, time in bed | 413 |

---

## Tools Used
- **MySQL** — data storage, cleaning, and analysis
- **VS Code** — Database Client extension (query environment)
- **Tableau Public** — dashboard and visualizations (in progress)

---

## About the Leaf Tracker & Manual Logging
The Bellabeat Leaf is a wellness tracker worn as a bracelet, necklace, 
or clip. While the device automatically tracks movement and sleep patterns, 
many of its most powerful features rely on **manual user input** through 
the Bellabeat app. This is an important context for interpreting gaps and 
zeros in the dataset, as missing data may reflect forgetfulness, human 
error, or inconsistent logging habits rather than actual inactivity.

Features that require manual logging include:

- **Menstrual Cycle Tracking** — users log period start/end dates, flow 
intensity, and symptoms to help predict future cycles
- **Mood and Symptoms** — manual tracking of emotions and physical 
symptoms such as cramps and headaches
- **Hydration** — daily water intake can be manually logged (the 
Bellabeat Spring bottle tracks this automatically)
- **Food Intake and Nutrition** — users manually log meals and 
dietary habits
- **Activities and Workouts** — non-step based activities such as yoga, 
weightlifting, and swimming can be logged manually, and the app assigns 
a calorie value
- **Mindfulness and Meditation** — users log the duration and type of 
stress-reduction exercises completed
- **Sleep Editing** — while the Leaf tracks sleep automatically via 
movement, users can manually edit sleep and wake times for accuracy
- **Weight Management** — users manually input weight to track changes 
over time

The reliance on manual logging means that zeros or gaps in activity, 
sleep, and calorie data should be interpreted with caution — they may 
not reflect true user behavior.

---

## Data Limitations
- Small sample size of 30 users — findings may not be representative 
of the broader population
- No demographic information available (age, gender, location)
- Data is from 2016 — user habits and device technology have changed 
significantly since collection
- Not all users logged data every day — participation varied by category
- Dataset covers only one month of activity
- Zeros in activity data may reflect manual logging gaps rather than 
actual inactivity, as many Leaf features require user input

---

## Key Findings

### Activity Level Distribution
On average users spent the vast majority of their tracked time being 
sedentary:

| Activity Level | Avg Daily Minutes | % of Tracked Time |
|---|---|---|
| Sedentary | 991 mins (~16.5 hrs) | 81.33% |
| Lightly Active | 193 mins (~3.2 hrs) | 15.82% |
| Fairly Active | 14 mins | 1.11% |
| Very Active | 21 mins | 1.74% |

Over **81% of tracked time** was spent sedentary, highlighting a 
significant opportunity for the Leaf to encourage movement throughout 
the day.

---

### Weekday vs Weekend Activity
Activity levels remained largely consistent across weekdays and weekends 
with minimal variation:

| Activity Level | Weekday Avg (mins) | Weekend Avg (mins) |
|---|---|---|
| Sedentary | 996 | 977 |
| Lightly Active | 194 | 191 |
| Fairly Active | 13 | 15 |
| Very Active | 21 | 21 |

Users were slightly more sedentary on weekdays than weekends, consistent 
with desk based work behavior. The marginal difference suggests sedentary 
behavior is a lifestyle pattern rather than purely a work driven one.

---

### Sleep vs Very Active Hours
The analysis did not reveal a clear positive correlation between very 
active hours and hours of sleep:

- Users averaging **2 very active hours** slept between **5–7 hours**
- Users averaging **1 very active hour** slept between **6–8 hours**
- Users with **0 very active hours** showed the widest range — anywhere 
from **1–11 hours** of sleep

The inconsistency at 0 very active hours may partly reflect manual 
logging gaps — users who did not log activity may still have been 
active, but the data was not captured. Sleep quality and duration are 
also influenced by multiple factors beyond physical activity alone, 
including stress, nutrition, and overall lifestyle habits.

---

### Steps vs Calories Burned
A general positive correlation exists between steps and calories burned, 
however the relationship is inconsistent — suggesting other activities 
beyond walking contribute meaningfully to calorie burn:

| Avg Daily Steps | Avg Calories Burned |
|---|---|
| 916 (lowest) | 2,173 |
| 11,323 | 2,544 |
| 16,040 (highest) | 3,420 |

The variance in calories at similar step counts indicates users are 
engaging in non-step based activities such as cycling, yoga, or strength 
training that the step metric alone does not capture. This aligns with 
the Leaf's ability to manually log workouts and assign calorie values 
to unmeasured activities.

---

### Sleep Efficiency
- **Average sleep efficiency: 91.46%**
- Sleep efficiency measures the percentage of time in bed actually 
spent asleep
- A score above 85% is generally considered healthy
- While the average is within a healthy range, individual variation 
may indicate users who struggle with sleep onset or consistency

---

## SQL Techniques Used
- `AVG()`, `SUM()`, `ROUND()` for aggregations
- `CASE` statements for day type classification (weekday vs weekend)
- `DAYOFWEEK()` for weekday vs weekend segmentation
- `DATE()` for extracting date from datetime columns in JOIN condition
- `JOIN` across daily activity and sleep tables
- Percentage calculations using `SUM()` ratios
- Division to convert minutes to hours
- `GROUP BY` and `ORDER BY` for grouping and sorting results

---

## Marketing Recommendations for the Leaf

**1. Movement reminders throughout the day**
More than 81% of tracked time was spent sedentary, and the pattern was 
consistent across both weekdays and weekends. Adding hourly movement 
reminders to the Leaf could help users break up long periods of 
inactivity throughout the day.

**2. Sleep consistency prompts**
The data didn't show a strong connection between activity levels and 
sleep hours. Rather than relying on exercise alone to improve sleep, 
the Leaf could send simple bedtime reminders to help users build a 
more consistent sleep routine.

**3. Holistic calorie tracking**
Steps alone didn't fully account for calories burned, which suggests 
users are doing other types of activity that aren't being captured. 
Bellabeat could highlight the Leaf's ability to log workouts like yoga, 
swimming, and weightlifting, not just steps, to give users a more 
complete picture of their activity.

**4. Improve manual logging engagement**
A lot of the Leaf's features depend on users logging their own data. 
Since gaps in the data are likely due to forgetfulness or human error, 
adding gentle reminders and making the logging process quicker and 
easier could help users stay consistent.

**5. Target collegiate athletes through the NIL era**
The data points to a mostly casual, low activity user base, but the 
Leaf has a lot to offer active users too. Partnering with female 
collegiate athletes through NIL (Name, Image, and Likeness) deals 
could be a great way to reach a more active audience. These athletes 
are already living the lifestyle the Leaf supports, and many have a 
strong social media following that could help get the product in front 
of the right people.

**6. Look toward women's professional sports**
Women's sports is growing fast, more fans, more investment, and more 
visibility than ever before. Down the line, Bellabeat could explore 
partnerships with leagues like the WNBA and NWSL to position the Leaf 
as a wellness tool for women in professional sports. It's a longer term 
goal, but one that could really pay off as the space continues to grow.

---

## Files
| File | Description |
|---|---|
| `bellabeat_setup.sql` | Database setup, table creation, and CSV import |
| `bellabeat_analysis.sql` | Full SQL analysis queries with comments |

---

## Dashboard
A Tableau Public dashboard visualizing these findings is currently 
in progress and will be linked here upon completion.

---

## Author
**Mandy Langlois**
Aspiring Data Analyst | Google Data Analytics Certificate (2026)
