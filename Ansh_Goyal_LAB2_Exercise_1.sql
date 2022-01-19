with movie as(
select EXTRACT(YEAR FROM Release_Date) AS year,
Movie_Title,Production_Budget,
RANK() OVER(PARTITION BY EXTRACT(YEAR FROM Release_Date)
order by Production_Budget DESC) AS rank
FROM `nttdata-c4e-bde.uc1_18.Movie`
where Release_Date BETWEEN '2016-01-01' and '2020-12-31'
)
SELECT
  year,Movie_Title,Production_Budget,rank
FROM movie
WHERE rank < 11
ORDER BY year DESC
