SELECT 
S.committer.name as name, count(S.repo_name) as count
FROM `bigquery-public-data.github_repos.languages`as L
JOIN `bigquery-public-data.github_repos.sample_commits` as S
on L.repo_name = S.repo_name,
UNNEST(language) as lan
where lan.name = "Java" and EXTRACT(YEAR FROM S.committer.date)=2016
group by name
order by count desc 
limit 10
