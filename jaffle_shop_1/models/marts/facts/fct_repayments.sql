{{
    config(
        materialized='incremental',
        unique_key='repayment_id'
    )
}}

with repayment_status as (

    select *
    from {{ ref('int_loan_repayment_status') }}
)

select

    repayment_id,
    loan_id,
    due_date,
    paid_date,
    amount_due,
    amount_paid,
    repayment_status,
    days_late,

    current_timestamp() as created_at

from repayment_status

{% if is_incremental() %}

where repayment_id not in (

    select repayment_id
    from {{ this }}

)

{% endif %}
