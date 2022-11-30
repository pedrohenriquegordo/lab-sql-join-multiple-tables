use sakila;

#1
SELECT store.store_id AS 'Store ID', city.city AS 'City', country.country AS 'Country'
FROM store INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY store.store_id;

#2
SELECT store.store_id AS 'Store', SUM(payment.amount) AS 'Business'
FROM store INNER JOIN staff ON store.store_id = staff.store_id
INNER JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;

#3
SELECT category.name AS 'Category', ROUND(AVG(film.length)) AS 'Average Running Time'
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

#4
SELECT category.name AS 'Category', ROUND(AVG(film.length)) AS 'Average Running Time'
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY ROUND(AVG(film.length)) DESC
LIMIT 1;

#5
SELECT film.title AS 'Film'
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY rental.inventory_id
ORDER BY SUM(rental.rental_id);

#6
SELECT category.name AS 'Genres', ROUND(SUM(payment.amount)) AS 'Gross Revenue'
FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY ROUND(SUM(payment.amount)) DESC
LIMIT 1;

#7
SELECT film.title AS 'Title', store.store_id AS 'Store', COUNT(inventory.film_id) AS 'Number of Specimens'
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN store ON inventory.store_id = store.store_id
WHERE Film.title = 'Academy Dinosaur'  #AND store.store_id = 1
GROUP BY store.store_id;


