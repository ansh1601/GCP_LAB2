SELECT visitId,
visitStartTime,
H.page.pageTitle AS pageTitle,
H.page.pagePath AS pagePath
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
cross join UNNEST(hits) H
WHERE date = '20170801'
