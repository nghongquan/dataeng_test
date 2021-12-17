SELECT customer_name, SUM(price)
FROM sales s
INNER JOIN car c ON s.car_id = c.car_id
INNER JOIN car_details cd ON cd.car_details_id = c.car_details_id
GROUP BY customer_name;