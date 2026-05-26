{{ config(materialized='view') }}

select
    loan_id::varchar                    as loan_id,
    customer_id::varchar                as customer_id,
    upper(product)                      as product,
    principal_amount::number(18,2)      as principal_amount,
    interest_rate::float                as interest_rate,
    origination_date::date              as origination_date,
    term_months::integer                as term_months,
    upper(status)                       as loan_status,
    _loaded_at

from {{ source('raw', 'loans') }}
