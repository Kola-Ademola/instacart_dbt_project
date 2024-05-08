-- staging the orders data

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'orders') }}
)
SELECT *
FROM source