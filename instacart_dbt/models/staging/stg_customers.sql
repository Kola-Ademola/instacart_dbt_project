-- staging the customers data

/*
Optional code, because I already set all models
In the staging folder to always materialize as VIEWS on the project yml file.

{{ config(materialized = 'view') }}
*/ 

WITH source AS(
    SELECT *
    FROM {{ source('instacart_db', 'customers') }}
),
customer_transformed AS (
    SELECT customer_id,
            CONCAT(first_name, ' ', last_name) AS customer_name,
            email,
            address,
            phone_number,
            country,
            age,
            gender
    FROM source
)
SELECT *
FROM customer_transformed