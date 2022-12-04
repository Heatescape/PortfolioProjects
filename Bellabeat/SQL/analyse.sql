select *
from Bellabeat..dailySteps_merged$

select *
from Bellabeat..dailyActivity_new_merged$

-- active level
select avg(VeryActiveMinutes) as [Very Active], AVG(FairlyActiveMinutes) as [Fairly Active], 
avg(LightlyActiveMinutes) as [Lightly Active], avg(SedentaryMinutes) as Sedentary
from Bellabeat..dailyActivity_new_merged$


-- step vs sleep
select step.id, step.activityday, steptotal, TotalMinutesAsleep, TotalTimeInBed, TotalSleepRecords, TotalTimeInBed-TotalMinutesAsleep as TimeFallAsleep
from Bellabeat..dailySteps_merged$ step
join Bellabeat..sleepDay_new_merged$ sleep
	on step.id = sleep.id
	and step.ActivityDay = sleep.SleepDay

-- daily heat
select a.id, a.ActivityDate,a.TotalSteps,a.TrackerDistance,LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance,
SedentaryActiveDistance, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes,Calories, TotalMinutesAsleep, TotalTimeInBed, TotalSleepRecords
from Bellabeat..dailyActivity_new_merged$ a
join Bellabeat..sleepDay_new_merged$ sl
	on a.ActivityDate = sl.SleepDay
	and a.id = sl.Id

-- sleep quality
select 1 as value,
count(value) as Minutes
from Bellabeat..minuteSleep_new_merged$
where value = 1
union
select 2 as value,
count(value) as Minutes
from Bellabeat..minuteSleep_new_merged$
where value = 2
union
select 3 as value,
count(value) as Minutes
from Bellabeat..minuteSleep_new_merged$
where value = 3

-- calories,steps,intensities
select c.id, c.ActivityMinute, Calories, Intensity, Steps
from Bellabeat..minuteCaloriesNarrow_merged$ c
join Bellabeat..minuteIntensitiesNarrow_merged$ i
	on c.Id = i.Id
	and c.ActivityMinute = i.ActivityMinute
join Bellabeat..minuteStepsNarrow_merged$ s
	on c.Id = s.Id
	and c.ActivityMinute = s.ActivityMinute
order by 1,2

























