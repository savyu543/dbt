{{
    config(
        materialized='table',
        transient=true
    )
}}

SELECT
    XMLGET(RAW_XML,'customer_id'):"$"::STRING    AS customer_id,
    XMLGET(RAW_XML,'signup_date'):"$"::DATE      AS signup_date,
    XMLGET(RAW_XML,'region'):"$"::STRING         AS region,
    XMLGET(RAW_XML,'segment'):"$"::STRING        AS segment,
    _LOADED_AT AS load_ts
FROM {{ source('RAW_XML', 'customers') }}