-- Checking Data is imported correctly
SELECT *
FROM PortfolioProjectCovid..CovidDeaths$
ORDER by 3,4

SELECT *
FROM PortfolioProjectCovid..CovidVaccinations$
ORDER by 3,4

-- Selecting data that will be used:
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProjectCovid..CovidDeaths$
ORDER by location, date

-- Percentage of people who died of Covid (Total cases vs. Total deaths)
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProjectCovid..CovidDeaths$
--WHERE location like '%kingdom%'
ORDER by location, date

-- Highest infection count per country
SELECT location, population, MAX(total_cases) as HighestInfectionCounts, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProjectCovid..CovidDeaths$
GROUP BY location, population
ORDER by PercentPopulationInfected desc

-- Total Deaths in every country
-- Cast the data type to integer to allow aggregate functions
SELECT location, SUM(CAST(total_deaths as int)) as TotalDeaths
FROM PortfolioProjectCovid..CovidDeaths$
WHERE continent is not null
GROUP BY location
ORDER by TotalDeaths desc

--Highest Death Counts per country
SELECT location, MAX(CAST(total_deaths as int)) as HighestCountOfDeaths
FROM PortfolioProjectCovid..CovidDeaths$
WHERE continent is not null
GROUP BY location
ORDER by HighestCountOfDeaths desc

-- Looking at deaths by Continent
SELECT location, MAX(CAST(total_deaths as int)) as HighestCountOfDeaths
FROM PortfolioProjectCovid..CovidDeaths$
WHERE continent is null
GROUP BY location
ORDER by HighestCountOfDeaths desc