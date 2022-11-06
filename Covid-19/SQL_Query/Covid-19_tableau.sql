-- Queries for tableau

-- Cases vs Deaths global
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int)) / sum(new_cases) * 100 as DeathPercentage
from PortfolioProject..CovidDeaths
where continent is not null

-- Total Death Count
select location, sum(cast(new_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is null
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
group by location
order by TotalDeathCount DESC

-- Percentage of Population Infected
select location, population, max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected desc

--
select location, population, date, max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
GROUP BY location, population, date
ORDER BY PercentPopulationInfected desc