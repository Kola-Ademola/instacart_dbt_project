-- staging the products data

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'products') }}
),
products_transformed AS(
    SELECT product_id,
            product_name,
            aisle_id,
            department_id,
            unit_price::NUMERIC,
            unit_cost
    FROM source
)
SELECT *
FROM products_transformed