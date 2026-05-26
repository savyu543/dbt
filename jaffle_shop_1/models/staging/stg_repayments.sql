{{ config(materialized='view') }}

select
    repayment_id::varchar                as repayment_id,
    loan_id::varchar                     as loan_id,
    due_date::date                       as due_date,
    paid_date::date                      as paid_date,
    amount_due::number(18,2)             as amount_due,
    amount_paid::number(18,2)            as amount_paid,
    _loaded_at

from {{ source('raw', 'repayments') }}
