{{ config(materialized='table') }}

select

    product,
    product_category,
    min_amount,
    max_amount,

    current_timestamp() as created_at

from {{ ref('stg_products') }}
