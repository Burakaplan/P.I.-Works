with a as(
SELECT country,date,
ifnull(daily_vaccinations,percentile_cont(daily_vaccinations,0.5) over(partition by country)) as daily_vaccinations,
vaccines
 FROM `country_vaccination_stats`
 )


select country,date,ifnull(daily_vaccinations,0) as daily_vaccinations,vaccines FROM a
