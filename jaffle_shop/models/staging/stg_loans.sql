
{{
    config(
        materialized='table',
        transient=true
    )
}}

SELECT
    XMLGET(RAW_XML,'loan_id'):"$"::STRING            AS LOAN_ID,
    XMLGET(RAW_XML,'customer_id'):"$"::STRING        AS CUSTOMER_ID,
    XMLGET(RAW_XML,'product'):"$"::STRING            AS PRODUCT,
    XMLGET(RAW_XML,'principal_amount'):"$"::NUMBER   AS PRINCIPAL_AMOUNT,
    XMLGET(RAW_XML,'interest_rate'):"$"::FLOAT       AS INTEREST_RATE,
    XMLGET(RAW_XML,'origination_date'):"$"::DATE     AS ORIGINATION_DATE,
    XMLGET(RAW_XML,'term_months'):"$"::NUMBER        AS TERM_MONTHS,
    XMLGET(RAW_XML,'status'):"$"::STRING             AS STATUS,
    _loaded_at AS load_ts

from {{ source('RAW_XML', 'loans') }}