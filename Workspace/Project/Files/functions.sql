-- VIEWs :
CREATE VIEW customers_have_sign as
	select distinct CID
	from Customer_sign;


create view Amaade_Padakht_list  as 
	select AID, Nsign, count(*) as signs
	from Customer_Account_Access natural join (
				select Nsign, AID
				from (DastorPardakht as P) inner join (Account as A) 
				on A.AID = P.Origin_AID
			) 
	where Access = 'sign'
	group by AID, Nsign
	having Nsign <= signs;
	
CREATE VIEW Payment as
	select PNumber, CID, Origin_AID, State, sum(amount) as total,CNote
	From Transactions natural join DastorPardakht
	


-- PROCEDUREs
delimiter $$
CREATE PROCEDURE transactions_list(accountNumber int)
    begin
		SELECT * 
        FROM Transactions natural JOIN DastorPardakht
		WHERE Dest_AID = accountNumber and state = 0;  
    end $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE deleted_signs_list(customerNo int)
    begin
		select * 
		from Customer_sign_deleted
		where CID = customerNo;
    end $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE sharing_accounts(customerNo1 int, customerNo2 int)
    begin
		select C1 as CNumber from (
							select distinct CID as C1
							from Customer_Account_Access
							where CID = customerNo1
							
				) inner join (
							select distinct CID as C2
							from Customer_Account_Access
							where CID = customerNo2
				) 
			where C1 = C2;
    end $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE payment_ability_by_User(UID int)
	begin
		select PNumber, CNote, CID, Origin_AID, total, state
		from Customer_Account_Access inner join Payment
		on AID = Origin_AID
		where Access = 'sign' and CID = UID;
	end $$
DELIMITER ;
	
delimiter $$
CREATE PROCEDURE payments_list_by_user(UID int)
begin
	select distinct PNumber
	from Payment natural join Transactions
	where CID = UID
	not in(
			select paymentNumber
			from Payment inner join Customer_Account_Access
			on Origin_AID = AID
			where Access = 'sign' and CID = UID);
	end $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE transactions_list_by_user(User_AID int, User_amount float)
begin
	select *
	from Transactions natural join Payment
	where state = 1 and Dest_AID = User_AID and amount > User_amount;
end $$
DELIMITER ;


-- HashBytes ( 'MD5', Hash_Password ) 
