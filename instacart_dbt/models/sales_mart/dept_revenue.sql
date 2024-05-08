-- total revenue and profit generated by each department

WITH orders AS(
    SELECT *
    FROM {{ ref('fct_orders') }}
),
depts AS(
    SELECT *
    FROM {{ ref('stg_dept') }}
)
SELECT d.department,
        SUM(o.order_amount) AS total_revenue,
        SUM(o.profit) AS total_profit
FROM orders AS o
INNER JOIN depts AS d ON d.department_id = o.department_id
GROUP BY d.department