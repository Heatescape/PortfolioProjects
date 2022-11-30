## Table of Content
- Summary
- Ask
- Prepare
- Process
- Analyse and share
- Act
<br />

# 1. Summary 🎈
Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. In this case study, I will focus on a single Bellabeat's product, Leaf,  and analyse the smart device dataset to gain insight into how consumers are using their smart devices.

Leaf is Bellabeat's classic wellness tracker can be worn as a bracelet, necklace, or clip. The Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress.
<br />

# 2. Ask 🔍
## 2.1 Business task
- What are some trends in smart device usage?
- How could these trends apply to Bellabeat customers?
- How could these trends help influence Bellabeat marketing strategy?
## 2.2 Stakeholders
- <strong>Urška Sršen</strong>: Bellabeat’s cofounder and Chief Creative Officer.
- <strong>Sando Mur</strong>: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team.
- <strong>Bellabeat marketing analytics team</strong>: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy. You joined this team six months ago and have been busy learning about Bellabeat’’s mission and business goals — as well as how you, as a junior data analyst, can help Bellabeat achieve them.
<br />

# 3. Prepare
## 3.1 Dataset used
The dataset used for this case study is FitBit Fitness Tracker Data from Mobius on Kaggle.

## 3.2 Accessibility and privacy of data:
We can determine from the source website of the data, that this is an open source dataset. Under copyright law, we can copy, modify, distribute and perform works, even for commercial purposes, without asking permission. Provided the owner waives all his or her worldwide rights to the work to the extent permitted by law, thereby placing the work in the field of publication.

## 3.3 Information about dataset
These datasets were generated from a survey of 30 respondents conducted via Amazon Mechanical Turk between December 3, 2016 and December 5, 2016. Thirty eligible Fitbit users agreed to submit personal tracker data, including minute-by-minute output of physical activity, heart rate and sleep monitoring. Differences between outputs indicate use of different types of Fitbit trackers and individual tracking behavior/preferences.

## 3.4 Data Organizasion and verification
There are 18 CSV files in the dataset. Each file contains different data tracked by FitBit. The data is considered long, because each row is one time point for each consumer. Hence, each consumer will have data in multiple rows. For each user, there is a unique ID and different rows since data is tracked by day and time.

| Table Name                         | Type | Number of Users | Duration/day | Description                                                                                         |
|--------------------------------|------|-----------------|--------------|-----------------------------------------------------------------------------------------------------|
| dailyActivity_merged           | XLSX | 33              | 31           | Tracking daily: steps, distance, intensity, and calories.                                           |
| dailyCalories_merged           | XLSX | 33              | 31           | Tracking daily: calories.                                                                           |
| dailyIntensities_merged        | XLSX | 33              | 31           | Tracking daily: time and distance of sedentary, lightly activity, fairly active, very active state. |
| dailySteps_merged              | XLSX | 33              | 31           | Traking daily: steps.                                                                               |
| heartrate_seconds_merged       | XLSX | 7               | 13           | Tracking: heart rate every 10 to 15 secends.                                                        |
| hourlyCalories_merged          | XLSX | 33              | 13           | Tracking hourly: calories.                                                                          |
| hourlyIntensities_merged       | XLSX | 33              | 13           | Tracking hourly: intensity.                                                                         |
| hourlySteps_merged             | XLSX | 33              | 13           | Tracking hourly: steps.                                                                             |
| minuteCaloriesNarrow_merged    | XLSX | 27              | 13           | Tracking minutely: calories. Each row is a minute.                                                  |
| minuteCaloriesWide_merged      | XLSX | 33              | ???          | Tracking minutely: calories. Each row is an hour, and 60 columns for each minute.                   |
| minuteIntensitiesNarrow_merged | XLSX | 27              | 13           | Tracking minutely: intensity. Each row is a minute.                                                 |
| minuteIntensitiesWide_merged   | XLSX | 33              | ???          | Tracking minutely: intensity. Each row is an hour, and 60 columns for each minute.                  |
| minuteMETsNarrow_merged        | XLSX | 27              | 13           | Tracking minutely: metabolic equivalent.                                                            |
| minuteSleep_merged             | XLSX | 24              | 14           | Tracking minutely: value indicating the sleep state. 1 = asleep, 2 = restless, 3 = awake, and logId |
| minuteStepsNarrow_merged       | XLSX | 27              | 13           | Tracking minutely: steps.                                                                           |
| minuteStepsWide_merged         | XLSX | 33              | ???          | Tracking minutely: steps. Each row is an hour, and 60 columns for each minute.                      |
| sleepDay_merged                | XLSX | 24              | ???          | Tracking daily: total sleep records, minutes asleep, time in bed.                                   |
| weightLogInfo_merged           | XLSX | 8               | ???          | Tracking daily: weight, body fat percent, BMI, report type, logId.                                  |


<br />


































