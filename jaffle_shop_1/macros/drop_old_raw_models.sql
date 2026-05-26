{% macro drop_old_raw_models() %}

    {% set old_views = [
        'stg_customers',
        'stg_loans',
        'stg_repayments',
        'stg_products'
    ] %}

    {% set old_tables = [
        'int_loan_repayment_status',
        'int_loan_balances',
        'dim_customers',
        'dim_products',
        'fct_loans',
        'fct_repayments'
    ] %}

    {% for v in old_views %}
        {% set sql %}
            DROP VIEW IF EXISTS DEMO1.RAW.{{ v }};
        {% endset %}
        {% do run_query(sql) %}
        {{ log("Dropped view: RAW." ~ v, info=true) }}
    {% endfor %}

    {% for t in old_tables %}
        {% set sql %}
            DROP TABLE IF EXISTS DEMO1.RAW.{{ t }};
        {% endset %}
        {% do run_query(sql) %}
        {{ log("Dropped table: RAW." ~ t, info=true) }}
    {% endfor %}

{% endmacro %}
