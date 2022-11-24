select *
from PortfolioProject..CovidDeaths
order by location asc

-- check duplicates
select location, date, count(*)
from PortfolioProject..CovidDeaths
group by [location], date
having count(*) > 1

-- missing data
select location, cast(max(date) as date) as [last day no case]
from PortfolioProject..CovidDeaths
where total_cases is null
group by location
order by 1

select distinct location 
from PortfolioProject..CovidDeaths
where continent is null

-- keep relevant data only
-- country aspect
select continent, location, cast(date as date) as date, population, total_cases, new_cases, total_deaths, new_deaths, hosp_patients, icu_patients
from PortfolioProject..CovidDeaths
where continent is not null
order by 2,3

-- income aspect
select location, cast(date as date) as date, population, total_cases, new_cases, total_deaths, new_deaths, hosp_patients, icu_patients
from PortfolioProject..CovidDeaths
where continent is null
and location like '%income'
order by 1,2

-- continent aspect
select location, cast(date as date) as date, population, total_cases, new_cases, total_deaths, new_deaths, hosp_patients, icu_patients
from PortfolioProject..CovidDeaths
where continent is null
and location not like '%income'
and location <> 'International'
and location <> 'World'
and location <> 'European Union'
order by 1,2

