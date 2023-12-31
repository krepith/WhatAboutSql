-- SQL JOINS
-- un join se especifica en la clausula JOIN


-- //////////left join guarda todas las conexiones de la tabla A que es la maestra

select
payment.payment_id, payment.customer_id, customer.first_name, customer.last_name
from payment left join customer on payment.customer_id = customer.customer_id;

-- /////////inner join guarda las conexiones bilaterales

select customer.first_name, payment.amount, film.title
from customer 
inner join payment on customer.customer_id = payment.customer_id
inner join rental on rental.rental_id=payment.rental_id
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id;

-- full outer muestra los registros de las dos tablas

select *
from customer
full outer join payment on customer.customer_id = payment.customer_id;

	
-- cross join combina las posibilidades de todos los registro de ambas tablas
-- se usa para generar  productos cartesianos
