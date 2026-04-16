SELECT
    task_id,
    member_id,
    group_name,
    domain,

    reactions,
    comments,
    views,
    reach,
    emv_usd,
    engagement_score,

    load_dts,
    row_hash

FROM {{ ref('inttest2') }}