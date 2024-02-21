                             -- views in mysql
use classic_models;
select * from classic_models.customers;

select country, count(customerNumber) from classic_models.customers
group by country order by count(customerNumber) asc;


Create View classic_models.count_of_customers_data as 
select country, count(customerNumber) from classic_models.customers
group by country order by count(customerNumber) asc;


create view classic_models.price_of_products as 
select * from classic_models.products where buyPrice > 50.50 order by buyPrice asc ;