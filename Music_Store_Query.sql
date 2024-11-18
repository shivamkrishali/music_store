							/* Basic /*

/* Q1: Who is the senior most employee based on job title? */

select top 1 last_name,first_name,title 
from employee
order by levels desc;


/* Q2: Which countries have the most Invoices? */

select COUNT(*) as highest_transactions, billing_country
from invoice
group by billing_country
order by highest_transactions desc;


/* Q3: What are top 3 values of total invoice? */

select top 3  total 
from invoice
order by total desc;


/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

select sum(total) as total_invoice, billing_city
from invoice
group by billing_city
order by total_invoice desc;


/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select top 1 c.customer_id, c.first_name, c.last_name, sum(i.total) as money_spent
from customer c
join invoice i on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name
order by money_spent desc;



							/* Moderate /*



/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select distinct c.email,c.first_name,c.last_name,g.name
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id = il.track_id
join genre g on g.genre_id = t.genre_id
where g.name like 'Rock'
order by email;

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select top 10 a.name, sum(t.track_id) as total_songs
from artist a 
join album al on a.artist_id = al.artist_id
join track t on t.album_id = al.album_id
join genre g on g.genre_id = t.genre_id
where g.name like 'Rock'
group by a.name
order by a.name desc;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select name, milliseconds
from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track )
order by milliseconds desc;




							/* Advance /*



/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

select c.first_name, c.last_name, a.name, sum(il.quantity*il.unit_price) as total_spent
from customer c
join invoice i on i.customer_id = c.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id = il.track_id
join album al on al.album_id = t.album_id
join artist a on a.artist_id = al.artist_id
group by c.first_name, c.last_name, a.name
order by total_spent desc;


/* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

with popular_genre as 
(
	select i.billing_country, g.name, sum(il.quantity) as total_quantity,
	row_number() over(partition by i.billing_country order by sum(il.quantity) desc) as rowno
	from invoice i 
	join invoice_line il on i.invoice_id = il.invoice_id
	join track t on il.track_id = t.track_id
	join genre g on t.genre_id = g.genre_id
	group by i.billing_country, g.name
)
select * from popular_genre 
where rowno = 1;


/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

with Customter_with_country as (
		select c.customer_id,c.first_name,c.last_name,i.billing_country,sum(i.total) as total_spending,
	    row_number() over(partition by i.billing_country order by sum(i.total) desc) as RowNo 
		from invoice i
		join customer c on c.customer_id = i.customer_id
		group by c.customer_id,c.first_name,c.last_name,i.billing_country
		)
select * from Customter_with_country where RowNo <= 1


							/* END /*