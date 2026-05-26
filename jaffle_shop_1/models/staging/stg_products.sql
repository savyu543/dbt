{{ config(materialized='view') }}

select
    upper(product)                    as product,
    upper(product_category)           as product_category,
    min_amount::number(18,2)          as min_amount,
    max_amount::number(18,2)          as max_amount,
    _loaded_at

from {{ source('raw', 'products') }}
