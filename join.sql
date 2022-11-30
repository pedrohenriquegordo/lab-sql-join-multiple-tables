use sakila;
#1
SELECT category.name AS 'Category', COUNT(film.film_id) AS 'Number of films'
FROM film 
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

#2
SELECT staff.first_name AS 'First name', staff.last_name AS 'Last name', address.address AS 'Address'
FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

#3
SELECT staff.first_name AS 'Staff\'s name', SUM(payment.amount) AS 'Total amount in August 2005'
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment_date < '2005-09-30 00:00:00' AND payment_date > '2005-07-31 23:59:59'
GROUP BY staff.staff_id;

#4
SELECT film.title AS 'Title', SUM(film_actor.actor_id) AS 'Number of actors'
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY SUM(film_actor.actor_id) DESC;

#5
SELECT customer.last_name AS 'Last Name', customer.first_name AS 'First Name', COUNT(payment.amount) AS 'Total Paid'
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name asc;








