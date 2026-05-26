{{ config(materialized='table') }}

select

    customer_id,
    signup_date,
    region,
    segment,

    current_timestamp() as created_at

from {{ ref('stg_customers') }}
