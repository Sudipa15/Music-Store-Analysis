----Q2 : Which countries have most invoices ?

  select count(*) as c, billing_country from invoice
group by billing_country 
order by billing_country desc
limit 3