
 ----- Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent

WITH ca AS (
    SELECT 
        customer.first_name, 
        artist.name AS artist_name,
        artist.artist_id,  -- Added artist_id in the CTE for future reference
        SUM(invoice_line.unit_price * invoice_line.quantity) AS total
    FROM customer
    JOIN invoice ON customer.customer_id = invoice.customer_id
    JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN album ON track.album_id = album.album_id
    JOIN artist ON album.artist_id = artist.artist_id
    GROUP BY customer.first_name, artist.name, artist.artist_id 
    ORDER BY total DESC
   
)
SELECT 
    ca.first_name, 
    ca.artist_name, 
    ca.artist_id,  
    ca.total
FROM ca
 LIMIT 1
