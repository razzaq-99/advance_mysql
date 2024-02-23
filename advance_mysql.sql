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







                                 -- Storage Procedure 

Delimiter && 
create procedure movies.get_data()
begin 
     select * from movies.flixpatrol;
end && 
Delimiter ;

call movies.get_data();




Delimiter && 
create procedure classic_models.get_data_of_orderdetails()
begin 
     select * from classic_models.order_details;
end && 
Delimiter ;

call classic_models.get_data_of_orderdetails();


Delimiter && 
create procedure movies.get_limit(in var int)
begin 
     select * from movies.flixpatrol limit var;
end && 
Delimiter ;

call movies.get_data();
call movies.get_limit(10);
call movies.get_limit(20);



Delimiter && 
create procedure movies.get_data_out(out var int)
begin 
     select max(Watchtime) into var  from movies.flixpatrol;
end && 
Delimiter ;

call movies.get_data_out(@HighestWatchTime);
select @HighestWatchTime;



Delimiter && 
create procedure classic_models.get_result_out(out var int)
begin 
     select max(classic_models.products.buyPrice) into var  from classic_models.products;
end && 
Delimiter ;

call classic_models.get_result_out(@buyprice);
select @buyprice;


-- inout in procedure
select * from classic_models.products;
Delimiter && 
create procedure classic_models.get_result_name2(inout var int)
begin 
     select productName,productDescription from classic_models.products where buyPrice > var;
end && 
Delimiter ;

set @m = 100.00;
call classic_models.get_result_name2(@m);
select @m


Delimiter && 
create procedure classic_models.get_result_name3(inout var int)
begin 
     select productName,productDescription,buyPrice from classic_models.products where buyPrice > var;
end && 
Delimiter ;

set @m = 102.00;
call classic_models.get_result_name3(@m);
select @m;






                                              -- Windows functions
select * from classic_models.customers;

select customerName,phone,country,sum(creditLimit) from classic_models.customers
group by customerName,phone,country;

select customerName,phone,country,sum(creditLimit) 
over (partition by country) from classic_models.customers;

select customerName,phone,country,rank()
over (partition by country order by customerName) from classic_models.customers;

select customerName,phone,country,dense_rank()
over (partition by country order by customerName) from classic_models.customers;


select productName,productCode,rank()
over (partition by productCode order by productName) from classic_models.products;

select productName,productCode,dense_rank()
over (partition by productCode order by productName) from classic_models.products;