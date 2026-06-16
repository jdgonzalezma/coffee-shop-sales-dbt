{{ config(materialized='view') }}

select
    cast(transaction_id as integer) as transaction_id,
    transaction_date,
    transaction_time,
    cast(transaction_qty as integer) as quantity_sold,
    cast(store_id as integer) as store_id,
    store_location,
    cast(product_id as integer) as product_id,
    
    -- We replace the comma with a period before casting to type `double`
    cast(replace(unit_price, ',', '.') as double) as unit_price,
    
    product_category,
    product_type,
    product_detail as product_details
from {{ source('raw_coffee_data', 'raw_transactions') }}