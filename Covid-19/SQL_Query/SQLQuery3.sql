-- Australia


select cast(date as date) as date, total_cases, new_cases, total_deaths, new_deaths, hosp_patients, icu_patients 
from Covid..deathsInCountry$
where location = 'Australia'
order by 1

-- population vs vaccination
select dea.location, cast(dea.date as date), dea.population, vac.new_vaccinations, vac.total_vaccinations,
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Covid..deathsInCountry$ dea
join Covid..vacc$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.location = 'Australia'
order by dea.date

with popvsvac(location, date, population, new_vaccinations, RollingPeopleVaccinated)
as(
select dea.location, dea.date, dea.population, vac.new_vaccinations, 
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from Covid..deathsInCountry$ dea
join Covid..vacc$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.location = 'Australia'
)
select p.location, p.date, p.population, new_vaccinations, c.new_cases, c.new_deaths, (RollingPeopleVaccinated/p.population) as [vaccinations per capita]
from popvsvac p
left join Covid..deathsInCountry$ c
	on p.date = c.date
	and p.location = c.location
order by p.date




