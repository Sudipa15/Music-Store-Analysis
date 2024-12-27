---Q3 : Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-------Return your list ordered alphabetically by email starting with A

select name,milliseconds from track 
where milliseconds>(
select avg(milliseconds) from track 
)
order by milliseconds desc
