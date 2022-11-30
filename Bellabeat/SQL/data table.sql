-- dailyActivity_merged
select *
from Bellabeat..dailyActivity_merged$

select count(distinct Id) as [#consumers], count(distinct ActivityDate) as [#date]
from dailyActivity_merged$

--with cte as
--(
--	select Id, SUBSTRING(convert(char(8),ActivityDate,112), 1, 8) as date
--	from dailyActivity_merged$
--)
--select distinct date 
--from cte
--order by 1


-------------------------------------------------------------------------------- 

-- dailyCalories_merged
select *
from Bellabeat..dailyCalories_merged$

select count(distinct Id) as [#consumers], count(distinct ActivityDay) as [#date]
from dailyCalories_merged$

-------------------------------------------------------------------------------- 

-- dailyIntensities_merged
select *
from Bellabeat..dailyIntensities_merged$

select count(distinct Id) as [#consumers], count(distinct ActivityDay) as [#date]
from dailyIntensities_merged$

-------------------------------------------------------------------------------- 

-- dailySteps_merged
select *
from Bellabeat..dailySteps_merged$

select count(distinct Id) as [#consumers], count(distinct ActivityDay) as [#date]
from dailySteps_merged$

-------------------------------------------------------------------------------- 

-- heartrate_seconds_merged
select *
from Bellabeat..heartrate_seconds_merged$
where Time is not null
--where id = 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),Time,112), 1, 8) as date
	from heartrate_seconds_merged$
)
select count(distinct Id) as [#consumers], count(distinct date) as [#date]
where date is not null
from cte

-------------------------------------------------------------------------------- 

-- hourlyCalories_merged
select *
from hourlyCalories_merged$
--where id = 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),activityhour,112), 1, 8) as date
	from hourlyCalories_merged$
)
select distinct date 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- hourlyIntensities_merged
select *
from hourlyIntensities_merged$

select count(distinct id)
from hourlyIntensities_merged$

with cte as
(
	select Id, SUBSTRING(convert(char(8),activityhour,112), 1, 8) as date
	from hourlyIntensities_merged$
)
select distinct date 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- hourlySteps_merged
select *
from hourlySteps_merged$

select count(distinct id)
from hourlySteps_merged$

with cte as
(
	select Id, SUBSTRING(convert(char(8),activityhour,112), 1, 8) as date
	from hourlySteps_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteCaloriesNarrow_merged
select *
from minuteCaloriesNarrow_merged$

select distinct id
from minuteCaloriesNarrow_merged$

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityMinute,112), 1, 8) as date
	from minuteCaloriesNarrow_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteCaloriesNarrow_merged
select *
from minuteCaloriesNarrow_merged$

select distinct id
from minuteCaloriesNarrow_merged$

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityMinute,112), 1, 8) as date
	from minuteCaloriesNarrow_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteCaloriesWide_merged
select *
from minuteCaloriesWide_merged$

select distinct id
from minuteCaloriesWide_merged$

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityHour,112), 1, 8) as date
	from minuteCaloriesWide_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteIntensitiesNarrow_merged
select *
from minuteIntensitiesNarrow_merged$

select count(distinct id)
from minuteIntensitiesNarrow_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityMinute,112), 1, 8) as date
	from minuteIntensitiesNarrow_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteIntensitiesWide_merged
select *
from minuteIntensitiesWide_merged$

select count(distinct id)
from minuteIntensitiesWide_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityHour,112), 1, 8) as date
	from minuteIntensitiesWide_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteMETsNarrow_merged
select *
from minuteMETsNarrow_merged$

select count(distinct id)
from minuteMETsNarrow_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityMinute,112), 1, 8) as date
	from minuteMETsNarrow_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteSleep_merged
select *
from minuteSleep_merged$

select count(distinct id)
from minuteSleep_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),date,112), 1, 8) as date
	from minuteSleep_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteStepsNarrow_merged
select *
from minuteStepsNarrow_merged$

select count(distinct id)
from minuteStepsNarrow_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityMinute,112), 1, 8) as date
	from minuteStepsNarrow_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- minuteStepsWide_merged
select *
from minuteStepsWide_merged$

select count(distinct id)
from minuteStepsWide_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityHour,112), 1, 8) as date
	from minuteStepsWide_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- sleepDay_merged
select *
from sleepDay_merged$

select count(distinct id)
from sleepDay_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),ActivityHour,112), 1, 8) as date
	from sleepDay_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1

-------------------------------------------------------------------------------- 

-- weightLogInfo_merged
select *
from weightLogInfo_merged$

select count(distinct id)
from weightLogInfo_merged$
where id is not null
and id <> 0

with cte as
(
	select Id, SUBSTRING(convert(char(8),Date,112), 1, 8) as date
	from weightLogInfo_merged$
)
select count(distinct date) 
from cte
where date is not null
order by 1


