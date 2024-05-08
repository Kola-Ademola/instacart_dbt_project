-- staging the aisles data_

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'aisles')}}
)
SELECT *
FROM source