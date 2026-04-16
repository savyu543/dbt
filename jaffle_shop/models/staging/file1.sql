
SELECT
    "@timestamp" AS event_ts,
    "task.member.group.name.keyword" AS group_name,
    "task.reactions" AS reactions,
    "task.comments" AS comments,
    "task.views" AS views,
    "task.reach" AS reach,
    "task.emv_usd" AS emv_usd,
    "task.domain" AS domain,
    "task.member._id" AS member_id,
    "task.id" AS task_id 
    
FROM DBT_SCHEMA.TEST2
WHERE "task.id" IS NOT NULL