-- 1.
Select
	title
from film
where rental_rate = 2.99
and rental_duration > 5;
-- 2.
Select
	last_name
from customer
where first_name = "mary";

-- distinct: se usa para obtener resultados no repetidos o valores unicos
-- 3.
Select
	distinct amount  
from payment;

-- count: retorna el numero de filas que complen la consulta, es decir cuenta 
Select
	count( distinct rental_rate) 
from film
where length > 90;

-- order by columna (asc o desc) para ordenar los registros en orden ascendente o descendente segun el criterio

select *
from payment 
order by payment_date desc,
amount asc;

-- limit 5 regresa los 5 primeros registros de la consulta
select title, length, rental_rate 
from film
order by length desc 
limit 10;

-- between retorna verdadero cuando la consulta esta entre 2 valores
-- not between devuelve todo menos lo que esta en el rango 

-- In se usa para comparar los registros con una listado de valores y verificar si es compatible con el listado

select *
from rental
where customer_id NOT IN (100,101,102,103);

-- LIKE 

-- _ (guion bajo) es un comodin que remplaza un caracter
-- % (porcentaje) es un comodin que remplaza varios caracteres

-- nombre like 'j%' cualquier palabra que empiece con J
-- envios like 'envio-_' encuentra "envio-3" pero no "envio-10"

-- ilike ignora mayusculas o minusculas mientras like si respeta la diferencia

-- Group by se usa despues del from y el where define que columnas deben ser usadas para dividir y agrupar la seleccion 

Select customer_id , staff_id, count(*)  as num_rentas
from rental
group by customer_id, staff_id
order by num_rentas desc;

-- SUM suma los valores de una columna

select customer_id, Sum(amount)
from payment
group by customer_id
order by 2 desc;

-- AVG retorna el promedio de una columna
-- MAX y MIN retornan el valor maximo o minimo de una columna

-- having se usa despues del gruop by permite filtrar los resultados del gruop by

--  views o ventanas

-- se usan las clausulas partition by y over over indica el inicio de una funcion view y partition by determina las columnas que se usaran para la particion de la data 

-- tambien se usan las clausulas lag, lead, first y last para referirse a los previos o siguientes N valores en una columna y firts last para el primer y ultimo valor

select customer_id, payment_date,amount, sum(amount) 
over (partition by customer_id order by payment_date asc) as "suma_acumulada"
from payment
