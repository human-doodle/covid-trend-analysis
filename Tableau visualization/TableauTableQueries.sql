-- Queries to create tables to be importd into tableau

-- 1. Columns: total_cases, total_deaths, DeathPercentage

Select SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) as Total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null 
order by 1,2


-- 2. Columns: Continent, TotalDeathCount

Select Continent, SUM(cast(new_deaths as int)) AS TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is not null 
GROUP BY continent
order by TotalDeathCount desc


-- 3. Columns: Location, Population, HighestInfectionCount, PercentPopulationInfected

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- 4. Columns: Location, Population, Date, HighestInfectionCount, PercentPopulationInfected

Select Location, Population,Date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc

