-- otras operaciones
-- CASE se utiliza para crear una nueva columna en donde los valores son generados segun una serie de condiciones

select *, 
case
when
amount > LAG (amount) over (PARTITION BY customer_id order by
payment_date ASC) AND
amount > LAG (amount,2) over (PARTITION BY customer_id order by
payment_date ASC)
THEN 2

when
amount > LAG (amount) over (PARTITION BY customer_id order by
payment_date ASC)
THEN 1
ELSE 0
END AS identificador
FROM payment;

-- coalesce retorna el primer valor NO NULL
-- se usa para reemplazar datos null 
-- COALESCE (venta, 24) esto transforma los valores de null a 24



-- NULLIF retorna un null en un valor por ejemplo 0 para no dividir entre 0

-- nullif (apellido, '') as apellido 
-- aca el apellido es un espacio en blanco pero queremos que sea un null

-- fechas
--  select '2020-04-30' - '2020-04-23' devuelve un 7


select date_sub ('day','2023-04-30'); -- devuelve el 30 que es el dia

select date_part ('month','2023-04-30'); -- devuelve el 30 que es el dia

select date_trunc('month','2023-04-30'); -- pone el dia en 1 
select date_trunc('year','2023-04-30'); -- pone el mes y el dia en 1

-- select '2023-04-01' +INTERVAL '3 day'  -- agrega 3 dias

select date_trunc('day', payment_date) AS dia, Sum(amount)
from payment
group by Date_trunc ('day', payment_date)
order by 2 desc;

-- subquery consultas dentro de consultas

select film_id
from film
where rental_rate > (
select avg (rental_rate)
from film
);

with t1 AS ( -- guarda la respuesta como una variable
select 
customer_id, amunt
from payment
)