{{ config(materialized='view') }}

select
    customer_id::varchar         as customer_id,
    signup_date::date            as signup_date,
    upper(region)                as region,
    upper(segment)               as segment,
    _loaded_at

from {{ source('raw', 'customers') }}
