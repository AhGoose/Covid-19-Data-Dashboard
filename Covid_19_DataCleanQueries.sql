
-- 1
-- Global Statistics
Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths,SUM((nullif(cast(new_deaths as decimal), 0)))/SUM((nullif(cast(new_cases as decimal), 0)))*100 as DeathPercentage
From CovidDeaths
--Where location like '%states%'
where continent!=''
--Group By date
order by 1,2



-- 2. 
-- Deaths per Continent

-- European Union is part of Europe

Select continent, SUM(new_deaths) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
where continent!=''
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
and continent not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by continent
order by TotalDeathCount desc




-- 3.
-- Population Infected Percentage (MAP)
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((cast(total_cases as decimal)/cast(population as decimal)))*100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc



-- 4.

-- Population Infected Percentage (Graph)
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((cast(total_cases as decimal)/cast(population as decimal)))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc




-- 5.
--Total VACCINATION count
-- European Union is part of Europe

Select location, SUM(new_vaccinations) as TotalVacCount
From CovidVaccinations
--Where location like '%states%'
where continent=''
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
order by TotalVacCount desc
