{{ config(materialized='table') }}

with balances as (

    select *
    from {{ ref('int_loan_balances') }}
),

loans as (

    select *
    from {{ ref('stg_loans') }}
)

select

    l.loan_id,
    l.customer_id,
    l.product,
    l.origination_date,
    l.term_months,
    l.loan_status,
    l.principal_amount,
    l.interest_rate,

    b.total_paid,
    b.outstanding_balance,
    b.balance_status,

    current_timestamp() as created_at

from loans l

left join balances b
    on l.loan_id = b.loan_id
