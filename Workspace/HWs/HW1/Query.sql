---------# 1 #---------
select *
from Product;

---------# 2 #---------
select *
from Product
where product_id not in (
	select product_id
	from Rating
    );
    
---------# 3 #---------
select name_, gender
from User_
where user_id in (
	select user_id
	from Order_
	where product_id in (
		select product_id
		from Product as P 
		inner join Category as C
		on (P.category_id = C.category_id)
		where C.name_ = "sport"
		)
	);
    
---------# 4 #---------
select P.name_ as product_name, C.name_ as category_name
from Product as P 
inner join Category as C
on (P.category_id = C.category_id)
where product_id in (
	select product_id
	from Rating
	where rate > 4
	);

---------# 5 #---------
select P.product_id, P.name_, sum(price*quantity) as total
from Product as P 
		inner join Order_ as O
		on (P.product_id = O.product_id)
group by P.product_id
having total > 100000;

---------# 6 #---------
select user_id, sum(price*quantity) as total
from
(select quantity, product_id, user_id
from Order_
where timestamp_ = "1396-06-06") as T
inner join Product as P
on (P.product_id = T.product_id)
group by user_id
having total > 100000;

---------# 7 #---------
select U.user_id, name_
from User_ as U
inner join (
	select user_id, count(*) as cnt
	from
		(select product_id
		from Product as P 
		inner join Category as C
		on (P.category_id = C.category_id)
		where C.name_ = "sport") as S
		inner join Order_ as O
		on (S.product_id = O.product_id)
		group by user_id
        having cnt > 3
	) as T2
on (T2.user_id = U.user_id);

---------# 8 #---------
select U.user_id , U.name_, total
from(
	select user_id , sum(quantity*price) as total
	from 
		(	select product_id, price
			from Product as P 
			inner join Category as C
			on (P.category_id = C.category_id)
			where C.name_ = "sport"
		) as S
		inner join Order_ as O
		on (S.product_id = O.product_id)
		group by user_id
        having total > 100000
	) as T1
inner join User_ as U
on (U.user_id = T1.user_id);

---------# 9 #---------
select user_id, name_
from User_
where user_id in (
	select distinct user_id
	from Order_
	where product_id in    
		(select product_id
		from Product as P
		inner join Category as C
		on (P.category_id = C.category_id)
		where C.name_ = "sport"))
and user_id	in (
	select distinct user_id
	from Order_
	where product_id in
		(select product_id
		from Product as P
		inner join Category as C
		on (P.category_id = C.category_id)
		where C.name_ = "book")
	);

---------# 11 #---------
select P.product_id, name_, sum(quantity) as total_units
from Order_ as O inner join Product as P
using(product_id)
group by product_id
order by total_units desc
limit 1;

---------# 12 #---------
select category_id, category_name , sum(quantity) as total_units
from Order_ as O
inner join
	(select product_id , category_id, C.name_ as category_name
	from Product
	inner join Category as C
	using (category_id)) as P
using (product_id)
group by category_id
order by total_units desc
limit 1;

---------# 13 #---------
select P.product_id, name_, sum(quantity) as total_units
from Order_ as O inner join Product as P
using(product_id)
group by product_id
order by total_units
limit 3;

---------# 14 #---------
select T.user_id, T.name_, T.total_buy
from (
	select O.user_id, U.name_, sum(quantity*price) as total_buy
	from Order_ as O
	inner join Product as P
	using (product_id)
    inner join User_ as U
    using(user_id)
	group by user_id
	order by total_buy desc
	) as T
join (
	select user_id, sum(quantity*price) as total_buy
	from Order_ as O
	inner join Product as P
	using (product_id)
	group by user_id
	order by total_buy desc
	limit 1
	) as M
where T.total_buy < M.total_buy
limit 1;

---------# 15 #---------
select R.user_id, R.rating
from (
	select user_id, count(*) as rating
	from Rating
	group by user_id
	order by rating desc
	) as R
join(
	select user_id, count(*) as rating
	from Rating
	group by user_id
	order by rating desc
    limit 1
    ) as M
where R.rating < M.rating
limit 1;

---------# 16 #---------
select user_id , max(MX.max_date - MN.min_date) as timestamp_difference
from(
	select user_id, max(timestamp_) as max_date
	from Rating
	group by user_id
    ) as MX
inner join(
	select user_id, min(timestamp_) as min_date
	from Rating
	group by user_id
	) as MN
using(user_id)
group by user_id
order by timestamp_difference desc
limit 1;

---------# 17 #---------
select user_id
from (
	select T1.user_id, sum(T1.price * T1.quantity) as total_buy
	from ( 
		select user_id, price, quantity
		from Order_
		inner join Product
		using (product_id)
		where timestamp_ = "1396-06-06"
		) as T1
	group by user_id
	) as T2
join(
	select avg_sell
	from(
		select timestamp_, avg(price*quantity) as avg_sell
		from Order_
		inner join Product
		using (product_id)
		group by timestamp_
		order by timestamp_
		) as A
	where timestamp_ = "1396-06-06"
	) as T3
where total_buy > avg_sell;

















