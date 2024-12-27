---Q3: Write a query that determines the customer that has spent the most on music for each country. 
----Write a query that returns the country along with the top customer and how much they spent. 
----For countries where the top amount spent is shared, provide all customers who spent this amount?

WITH popular  AS(
SELECT customer.customer_id, customer.first_name,customer.country, sum(total)as total , ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY sum(total) DESC) AS RowNo
FROM  invoice

JOIN customer ON customer.customer_id = invoice.customer_id


GROUP BY 1,2,3
ORDER BY 3 ASC, 5 DESC)

SELECT * FROM popular  WHERE RowNo <=1
