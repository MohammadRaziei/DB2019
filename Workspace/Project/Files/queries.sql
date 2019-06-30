-- Q1
select * from customers_can_sign;

-- Q2
select AID
from Account natural join(
		select count(*) as signs, AID
		from Custumer_Account_Access
		where Access ='sign'
		group by AID 
	) 
where signs > Nsign;

-- Q3
select * from Amaade_Padakht_list;
    
-- Q4
call transactions_list(3);

-- Q5
call deleted_signs_list(2);

-- Q6
call sharing_accounts(1, 2);

-- Q7
call payment_ability_by_User(2);

-- Q8 
call payments_list_by_user(1);

-- Q9
call transactions_list_by_user(3, 150);