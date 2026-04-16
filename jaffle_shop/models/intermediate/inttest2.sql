
SELECT
    event_ts,
    group_name,
    member_id,
    task_id,
    domain,

    TRY_TO_NUMBER(reactions) AS reactions,
    TRY_TO_NUMBER(comments) AS comments,
    TRY_TO_NUMBER(views) AS views,
    TRY_TO_NUMBER(reach) AS reach,
    TRY_TO_NUMBER(emv_usd) AS emv_usd,

    (TRY_TO_NUMBER(reactions)
     + TRY_TO_NUMBER(comments)
     + TRY_TO_NUMBER(views)) AS engagement_score,

    CURRENT_TIMESTAMP() AS load_dts,

    MD5(
        CONCAT(
            COALESCE(task_id, ''),
            '|',
            COALESCE(group_name, ''),
            '|',
            COALESCE(domain, '')
        )
    ) AS row_hash

FROM {{ ref('file1') }}