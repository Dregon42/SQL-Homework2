-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name,customer.last_name,district
from customer
full join address
on customer.address_id = address.address_id
where district like 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name,amount 
from customer 
inner join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name,last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 175
	order by amount desc);

-- 4. List all customers that live in Nepal (use the city table)
select first_name,last_name,country
from customer 
inner join address 
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal';


-- 5. Which staff member had the most transactions?
select first_name, last_name,count(rental_id)  
from staff 
inner join rental 
on staff.staff_id = rental.staff_id  
group by first_name, last_name 

-- 6. How many movies of each rating are there?
select rating, count(film_id)
from film
group by rating 
order by count(film_id) desc;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer.first_name, customer.last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	where amount > 6.99)

-- 8. How many free rentals did our stores give away?
select store.store_id 
from store 
inner join inventory 
on store.store_id = inventory.store_id 
inner join rental 
on inventory.inventory_id = rental.inventory_id 
inner join payment 
on rental.rental_id = payment.rental_id 
where amount = 0.00;

select * from staff 