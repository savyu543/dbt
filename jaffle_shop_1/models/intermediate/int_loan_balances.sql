{{ config(materialized='table') }}

with repayments as (

    select
        loan_id,
        sum(amount_paid) as total_paid

    from {{ ref('stg_repayments') }}

    group by loan_id
),

loans as (

    select *
    from {{ ref('stg_loans') }}
)

select

    l.loan_id,
    l.customer_id,
    l.product,
    l.principal_amount,

    coalesce(r.total_paid, 0) as total_paid,

    l.principal_amount - coalesce(r.total_paid, 0)
        as outstanding_balance,

    case
        when l.principal_amount - coalesce(r.total_paid, 0) <= 0
        then 'CLOSED'
        else 'ACTIVE'
    end as balance_status

from loans l

left join repayments r
    on l.loan_id = r.loan_id
