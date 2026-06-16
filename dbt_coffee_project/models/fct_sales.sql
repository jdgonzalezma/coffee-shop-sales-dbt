-- depends_on: {{ ref('stg_coffee_sales') }}
{{ config(materialized='table') }}

with sales_source as (
    select * from {{ ref('stg_coffee_sales') }}
)

select
    transaction_id,
    transaction_date,
    transaction_time,
    store_id,
    product_id,
    quantity_sold,
    unit_price,
    (quantity_sold * unit_price) as total_revenue
from sales_source