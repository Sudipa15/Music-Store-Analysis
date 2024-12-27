------Q4  Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals?
 select billing_city,sum(total) as total from invoice
group by billing_city
order by total desc 
limit 1