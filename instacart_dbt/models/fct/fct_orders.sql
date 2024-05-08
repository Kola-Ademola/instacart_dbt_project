-- getting the fact order data

WITH aisles AS(
    SELECT aisle_id
    FROM {{ ref('stg_aisles') }}
),
departments AS(
    SELECT department_id
    FROM {{ ref('stg_dept') }}
),
products AS(
    SELECT product_id,
            aisle_id,
            department_id,
            unit_cost,
            unit_price
    FROM {{ ref('stg_products') }}
),
customers AS(
    SELECT customer_id
    FROM {{ ref('stg_customers') }}
),
orders AS(
    SELECT order_id,
            customer_id,
            product_id,
            quantity,
            order_dow,
            order_hour_of_day,
            days_since_prior_order,
            order_date
    FROM {{ ref('stg_orders') }}
)
SELECT o.order_id,
        c.customer_id,
        p.product_id,
        a.aisle_id,
        d.department_id,
        p.unit_price,
        p.unit_cost,
        o.quantity,
        o.order_date,
        (p.unit_price * o.quantity) AS order_amount,
        ((p.unit_price - p.unit_cost) * o.quantity) AS profit
FROM orders AS o
INNER JOIN customers AS c ON c.customer_id = o.customer_id
INNER JOIN products AS p ON p.product_id = o.product_id
INNER JOIN departments AS d ON d.department_id = p.department_id
INNER JOIN aisles AS a ON a.aisle_id = p.aisle_id