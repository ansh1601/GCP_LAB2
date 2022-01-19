CREATE or REPLACE TABLE `nttdata-c4e-bde.uc1_18.myTable`
AS
with country_from as(
    SELECT country,ARRAY_AGG(STRUCT(
        operatingSystem ,browser,rank
    )
    ) as country_rank
   FROM( SELECT geoNetwork.country as country,device.operatingSystem as operatingSystem,
    device.browser as browser,
    ROW_NUMBER()  OVER (
        PARTITION By geoNetwork.country
        ORDER BY (count(device.browser)+count(device.operatingSystem)) DESC
    ) AS rank
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
    WHERE geoNetwork.country is NOT NULL 
    group by country,operatingSystem,browser
)
WHERE rank<4 and country NOT like '(%)'
GROUP BY country
)
SELECT * FROM country_from
order by country
