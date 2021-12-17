SELECT manufacturer, COUNT(sales_id), SUM(price)
FROM sales s
INNER JOIN car c ON s.car_id = c.car_id
INNER JOIN car_details cd ON cd.car_details_id = c.car_details_id
WHERE date_trunc('month', sales_date) = date_trunc('month', current_date)
GROUP BY manufacturer
ORDER BY COUNT(sales_id) desc, SUM(price) desc
LIMIT 3;