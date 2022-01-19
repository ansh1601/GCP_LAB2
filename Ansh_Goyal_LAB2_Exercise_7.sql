SELECT Lan.name as language_name, Count(language) as count 
FROM `bigquery-public-data.github_repos.languages`
CROSS JOIN UNNEST(language) Lan
Group by language_name
ORDER By count DESC
LIMIT 1

