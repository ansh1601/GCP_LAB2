SELECT U.id AS id_user,
COUNT(P.owner_user_id) as count
FROM `bigquery-public-data.stackoverflow.users` U
JOIN
`bigquery-public-data.stackoverflow.posts_answers` P
ON U.id=P.owner_user_id
group by id_user
ORDER BY count DESC
LIMIT 10
