{{ config(materialized='table') }}

select

    repayment_id,
    loan_id,
    due_date,
    paid_date,
    amount_due,
    amount_paid,

    case
        when paid_date is null then 'MISSED'

        when paid_date <= due_date
             and amount_paid >= amount_due
        then 'PAID_ON_TIME'

        when paid_date > due_date
             and amount_paid >= amount_due
        then 'PAID_LATE'

        when amount_paid < amount_due
        then 'PARTIAL_PAYMENT'

        else 'UNKNOWN'
    end as repayment_status,

    datediff(day, due_date, paid_date) as days_late

from {{ ref('stg_repayments') }}
