select * 
from Bellabeat..minuteSleep_merged$
where id = 4702921684
and date = '2016-05-07 01:24:00.000'

select *
from Bellabeat..minuteSleep_new_merged$
order by 1,2
--group by id, Date
--having count(*) > 1

-- create a table for minute sleep without duplicate
create table Bellabeat..minuteSleep_new_merged$
(
	Id float,
	Date datetime,
	value float,
	logId float
)
insert into Bellabeat..minuteSleep_new_merged$
select Id, Date, value, logid
from Bellabeat..minuteSleep_merged$
group by id, date, value, logId






select id, SleepDay, count(*) as [occur times]
from Bellabeat..sleepDay_merged$
group by id, SleepDay
having count(*) > 1

select * 
from Bellabeat..sleepDay_merged$
where id = 8378563200
and SleepDay = '2016-04-25 00:00:00.000'

create table Bellabeat..sleepDay_new_merged$
(
	Id float,
	SleepDay datetime,
	TotalSleepRecords float,
	TotalMinutesAsleep float,
	TotalTimeInBed float
)
insert into Bellabeat..sleepDay_new_merged$
select Id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed
from Bellabeat..sleepDay_merged$
group by id, SleepDay, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed



select id, Date, count(*) as [occur times]
from Bellabeat..weightLogInfo_merged$
group by id, Date
having count(*) > 1

----------------------------------------------------new_----------------------------------------------------
-- drop useless data

select *
from Bellabeat..dailyActivity_new_merged$

alter table bellabeat..dailyActivity_new_merged$
drop column totalDistance






