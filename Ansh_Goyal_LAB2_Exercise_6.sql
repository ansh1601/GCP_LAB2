SELECT U.id AS id_user,
COUNT(P.owner_user_id) as count
FROM `bigquery-public-data.stackoverflow.users` U
INNER JOIN `bigquery-public-data.stackoverflow.posts_answers` P
ON U.id=P.owner_user_id
INNER JOIN `bigquery-public-data.stackoverflow.stackoverflow_posts` S
ON S.accepted_answer_id=P.id
WHERE S.accepted_answer_id IS NOT NULL and 
EXTRACT (YEAR FROM P.creation_date)=2010 
GROUP BY id_user
ORDER BY count DESC
LIMIT 10
