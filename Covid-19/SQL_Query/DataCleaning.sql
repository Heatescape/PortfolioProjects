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

update PortfolioProject..CovidDeaths
--set total_cases=0
--where total_cases is null
--set new_cases=0
--where new_cases is null
--set total_deaths=0
--where total_deaths is null
--set new_deaths=0
--where new_deaths is null
--set icu_patients=0
--where icu_patients is null
set hosp_patients=0
where hosp_patients is null

alter table PortfolioProject..CovidDeaths
--alter column total_deaths float
--alter column new_deaths float
--alter column icu_patients float
alter column hosp_patients float

update PortfolioProject..CovidVaccinations
--set total_tests=0
--where total_tests is null
--set new_tests=0
--where new_tests is null
--set total_vaccinations=0
--where total_vaccinations is null
--set people_vaccinated=0
--where people_vaccinated is null

alter table PortfolioProject..CovidVaccinations
--alter column total_tests float
--alter column new_tests float
--alter column total_vaccinations float
alter column people_vaccinated float



select *
from PortfolioProject..CovidDeaths
order by total_cases asc
