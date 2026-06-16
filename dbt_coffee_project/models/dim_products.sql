-- depends_on: {{ ref('stg_coffee_sales') }}
{{ config(materialized='table') }}

with distinct_products as (
    select distinct
        product_id,
        product_category,
        product_type,
        product_details
    from {{ ref('stg_coffee_sales') }}
)

select
    product_id,
    product_category,
    product_type,
    product_details
from distinct_products
where product_id is not null