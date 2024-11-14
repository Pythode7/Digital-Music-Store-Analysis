--1. Customer Behavior and Sales Analysis
---- Who are the top customers by total spending?
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

--  What genres are most popular among different customer segments?
SELECT g.name AS genre, COUNT(il.track_id) AS purchase_count, c.country
FROM genre g
JOIN track t ON g.genre_id = t.genre_id
JOIN invoice_line il ON t.track_id = il.track_id
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN customer c ON i.customer_id = c.customer_id
GROUP BY g.name, c.country
ORDER BY purchase_count DESC;

-- What is the average revenue per customer, and how does it vary by country?
SELECT c.country, AVG(i.total) AS avg_revenue_per_customer
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.country
ORDER BY avg_revenue_per_customer DESC;


-- What are the peak purchasing times or days for music sales?
SELECT DAYNAME(i.invoice_date) AS purchase_day, COUNT(i.invoice_id) AS purchases
FROM invoice i
GROUP BY purchase_day
ORDER BY purchases DESC;

-- How often do customers purchase music after their first purchase?
SELECT c.customer_id, c.first_name, c.last_name, COUNT(i.invoice_id) AS purchase_count
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING purchase_count > 1
ORDER BY purchase_count DESC;


--2. Product and Inventory Optimization 
-- Which artists or albums have the highest sales volume?
SELECT a.name AS artist, al.title AS album, COUNT(il.track_id) AS sales_volume
FROM artist a
JOIN album al ON a.artist_id = al.artist_id
JOIN track t ON al.album_id = t.album_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY a.name, al.title
ORDER BY sales_volume DESC;

-- What media types (e.g., digital, CD) are most preferred by customers?
SELECT m.name AS media_type, COUNT(il.track_id) AS purchase_count
FROM media_type m
JOIN track t ON m.media_type_id = t.media_type_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY m.name
ORDER BY purchase_count DESC;

-- Which playlists have the highest engagement or usage rates?
SELECT p.name AS playlist, COUNT(pt.track_id) AS track_count
FROM playlist p
JOIN playlist_track pt ON p.playlist_id = pt.playlist_id
GROUP BY p.name
ORDER BY track_count DESC;

-- What is the most common length (duration) for tracks that customers purchase?
SELECT ROUND(AVG(t.milliseconds) / 60000, 2) AS avg_duration_in_minutes
FROM track t
JOIN invoice_line il ON t.track_id = il.track_id;


--3. Marketing and Promotions
-- Which genre of music generates the most revenue?
 SELECT g.name AS genre, SUM(il.unit_price * il.quantity) AS revenue
FROM genre g
JOIN track t ON g.genre_id = t.genre_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY g.name
ORDER BY revenue DESC;

-- What are the characteristics of customers who purchase music frequently versus infrequently?
SELECT c.customer_id, c.first_name, c.last_name, COUNT(i.invoice_id) AS purchase_count, c.country, c.city
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY purchase_count DESC;

-- Is there a difference in total spending between customers who purchase digitally vs. physically?
SELECT m.name AS media_type, SUM(il.unit_price * il.quantity) AS total_spending
FROM media_type m
JOIN track t ON m.media_type_id = t.media_type_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY m.name
ORDER BY total_spending DESC;

-- Do customers with larger playlists spend more?
SELECT c.customer_id, c.first_name, c.last_name, COUNT(pt.track_id) AS playlist_size, SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN playlist_track pt ON t.track_id = pt.track_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;


--4. Employee Performance and Support Analysis
-- How effective are support representatives in retaining high-spending customers?
SELECT e.employee_id, e.first_name, e.last_name, SUM(i.total) AS revenue_generated
FROM employee e
JOIN customer c ON e.employee_id = c.support_rep_id
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY e.employee_id
ORDER BY revenue_generated DESC;

-- Are there any patterns in support interactions that lead to higher customer satisfaction?
SELECT e.employee_id, e.first_name, e.last_name, AVG(i.total) AS avg_invoice_value, COUNT(c.customer_id) AS customer_count
FROM employee e
JOIN customer c ON e.employee_id = c.support_rep_id
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY e.employee_id
ORDER BY avg_invoice_value DESC;


--5. Operational Efficiency
-- How many purchases are made per employee support interaction?
SELECT e.employee_id, e.first_name, e.last_name, COUNT(i.invoice_id) AS total_purchases
FROM employee e
JOIN customer c ON e.employee_id = c.support_rep_id
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY e.employee_id
ORDER BY total_purchases DESC;

-- What is the average time between releases of new albums and peak sales periods?
SELECT 
    a.name AS artist, 
    al.title AS album, 
    MIN(i.invoice_date) AS first_purchase_date, 
    MAX(i.invoice_date) AS peak_purchase_date,
    DATEDIFF(MAX(i.invoice_date), MIN(i.invoice_date)) AS days_between_first_and_peak_sales
FROM 
    artist a
JOIN 
    album al ON a.artist_id = al.artist_id
JOIN 
    track t ON al.album_id = t.album_id
JOIN 
    invoice_line il ON t.track_id = il.track_id
JOIN 
    invoice i ON il.invoice_id = i.invoice_id
GROUP BY 
    al.album_id
ORDER BY 
    days_between_first_and_peak_sales;


--6. Financial and Revenue Insights
-- What is the average revenue per invoice, and how has it changed over time?
SELECT YEAR(i.invoice_date) AS year, MONTH(i.invoice_date) AS month, AVG(i.total) AS avg_revenue_per_invoice
FROM invoice i
GROUP BY year, month
ORDER BY year, month;

-- How much revenue does each genre contribute to total sales?
SELECT g.name AS genre, SUM(il.unit_price * il.quantity) AS total_revenue
FROM genre g
JOIN track t ON g.genre_id = t.genre_id
JOIN invoice_line il ON t.track_id = il.track_id
GROUP BY g.name
ORDER BY total_revenue DESC;
