-- staging the departments data

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'department') }}
)
SELECT *
FROM source