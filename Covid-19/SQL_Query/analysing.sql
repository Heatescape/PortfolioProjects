alter table Covid..deathsInCountry$
--alter column date date
alter column total_deaths int



--Determining the severity of the outbreak based on the number of people infected as a percentage of the total population in country
declare @now date
set @now = (select max(date) from Covid..deathsInCountry$)

select location, total_cases, population, (total_cases/population) * 100 as infection_rate
from Covid..deathsInCountry$
where date = @now
order by 4 desc

--Determining the severity of the outbreak based on the number of people infected as a percentage of the total population in continent
declare @now date
set @now = (select max(date) from Covid..deathsInContinent$)

select location, total_cases, population, (total_cases/population) * 100 as infection_rate
from Covid..deathsInContinent$
where date = @now
order by 4 desc

----Determining the severity of the outbreak based on the number of people infected as a percentage of the total population in income
declare @now date
set @now = (select max(date) from Covid..deathsInIncome$)

select location, total_cases, population, (total_cases/population) * 100 as infection_rate
from Covid..deathsInIncome$
where date = @now
order by 4 desc

--Determining the severity of the outbreak based on the number of people dead as a percentage of the total population in country
declare @now date
set @now = (select max(date) from Covid..deathsInCountry$)

select location, total_deaths, population, (total_deaths/population) * 100 as death_rate
from Covid..deathsInCountry$
where date = @now
order by 4 desc

-- the country has the most infected people (USA)
select location, max(total_cases) as total_cases
from Covid..deathsInCountry$
group by location
order by 2 desc 

-- list top 5 countries have highest death rate
select top 5 location, max(total_deaths) as highest_death_count, max(total_cases), max(total_deaths)/max(total_cases) * 100 as death_percentage
from Covid..deathsInCountry$
where total_cases <> 0
and location <> 'North Korea'
group by location, population
order by 4 desc

-- global numbers
select sum(new_cases)as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int))/sum(new_cases) *100 as DeathPercent
from Covid..deathsInCountry$
order by 1,2

-- the continent has the most infection rate
select location, max(total_cases) as highest_infect_count, population, max(total_cases)/population * 100 as infection_percentage
from Covid..deathsInContinent$
group by location, population
order by 4 desc


drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date date,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, cast(dea.date as date), dea.population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Covid..deathsInCountry$ dea
join Covid..vacc$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null

select*, (RollingPeopleVaccinated/population)*100 as [vaccinations per capita]
from #PercentPopulationVaccinated
order by 1,2
