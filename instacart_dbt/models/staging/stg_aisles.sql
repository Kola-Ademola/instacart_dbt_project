-- staging the aisles data

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'aisles')}}
)
SELECT *
FROM source