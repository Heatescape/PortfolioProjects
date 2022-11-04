-- check the tables imported
Select *
From PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

--select *
--from PortfolioProject..CovidVaccinations
--order by 3,4

-- select data going to use
select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

-- total cases vs total deaths
select Location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location = 'Australia'
order by 1,2

-- total cases vs population
select Location, date, total_cases, population, (total_cases / population) * 100 as GotCovidPercentage
from PortfolioProject..CovidDeaths
where location = 'Australia'
order by 1,2

-- find the highest infection rate country(Cyprus)
select Location, max(total_cases) as HighestInfectionCount, population, max((total_cases / population)) * 100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
where continent is not null
group by Location, population
order by 4 desc

-- show countries with the highest DeathPercentage
select Location, max(cast(total_deaths as int)) as HighestDeathCount, population
from PortfolioProject..CovidDeaths
where continent is not null
group by Location
order by HighestDeathCount desc

-- break things down by continent
select continent, max(cast(total_deaths as int)) as HighestDeathCount
from PortfolioProject..CovidDeaths
where continent is not null 
group by continent
order by HighestDeathCount desc


-- global numbers

select sum(new_cases)as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int))/sum(new_cases) *100 as DeathPercent
from PortfolioProject..CovidDeaths
-- where location = 'Australia'
where continent is not null
--group by date
order by 1,2


-- vaccination table
--total population vs total vaccinations

select dea.location, dea.date, dea.population, vac.new_vaccinations, vac.total_vaccinations,
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.location = 'Australia'
order by dea.date



-- use cte
with popvsvac(location, date, population, new_vaccinations, RollingPeopleVaccinated)
as(
select dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.location = 'Australia'
-- order by dea.date
)
select*, (RollingPeopleVaccinated/population)*100
from popvsvac




--use tmp table
drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
-- order by dea.date

select*, (RollingPeopleVaccinated/population)*100
from #PercentPopulationVaccinated
order by 1,2


-- creating view to store data for later visulisations

-- create a view of the percent population get vaccinated
drop view if exists PercentPopulationVaccinated
create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
-- order by 2,3

select *
from PercentPopulationVaccinated

-- creating view of of percent population died
drop view if exists PercentPopulationDied
create view PercentPopulationDied as
select continent, location, date, total_deaths, population, total_deaths / population * 100 as PercentDeath
from PortfolioProject..CovidDeaths
where continent is not null

select *
from PercentPopulationDied
order by 2, 3

-- creating view of percent population infected
drop view if exists PercentPopulationInfected
Create view PercentPopulationInfected as
select continent, location, date, total_cases, population, total_cases / population * 100 as PercentInfect
from PortfolioProject..CovidDeaths
where continent is not null

select *
from PercentPopulationInfected
order by 2,3