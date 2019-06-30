-- Q1
insert into Customer values(	101, 0019773722, 'Mohammad', 'Raziei', SHA1('password'));
insert into Customer values(  102, 0022621121, 'Ali', 'Raziei', SHA1('PASS541054'));
insert into Customer values(  103, 00195785104, 'Simon', 'Jakson', SHA1('PASS54'));


-- Q2
insert into Account(AID, cash, AType, NSign) values(11, 1200, 'currnet', 2);
insert into Account(AID, cash, AType, NSign) values(12, 3300, 'charity', 3);
insert into Account(AID, cash, AType, NSign) values(13, 1049, 'saving', 2);


-- Q3
-- (AID, CID, ACCESS)
insert into Customer_Account values(11, 101, 'MR','blue');
insert into Customer_Account_Access values(11, 101, 'sign');
insert into Customer_Account_Access values(11, 102, 'pay');
insert into Customer_Account values(12, 102, 'AR', 'blue');
insert into Customer_Account_Access values(12, 102, 'sign');
insert into Customer_Account_Access values(12, 103, 'visit');
insert into Customer_Account values(13, 101, 'SJ', 'red');
insert into Customer_Account_Access values(13, 101, 'visit');
insert into Customer_Account_Access values(13, 103, 'pay');

delete from Customer_Account_Access 
	where (AID, CID, Access) = (13, 103, 'pay');

update Customer_Account_Access 
	set Access = 'pay'
	where (AID, CID) = (13, 101);


-- Q4
insert into DastorPardakht(PNumber, CNote, CID, Origin_AID) 
values(6062, 'this is some notes : 6062', 101, 11);


-- Q5
update DastorPardakht 
	set Origin_AID = 12
	where PNumber = 6062;

delete from DastorPardakht
	where PNumber = 6062;


-- Q10
insert into DastorPardakht(PNumber, CNote, CID, Origin_AID) 
	values(6062, 'this is some notes 6062', 101, 11);

insert into Customer_sign values(103, 6062); -- impossible (CID=103 , AID=11)
insert into Customer_sign values(101, 6062); -- possible

delete from Customer_sign 
	where (CID, PNumber) = (101, 6062);
insert into Customer_sign_deleted values(101, 6062);


-- Q7
insert into Transactions(PNumber, Dest_AID, amount) values(6062, 12, 300);
insert into Transactions(PNumber, Dest_AID, amount) values(6062, 13, 450);

delete from Transactions
	where (PNumber, Dest_AID) = (6062, 13);

update Transactions 
	set amount = 333
	where (PNumber, Dest_AID) = (6062, 12);


-- Q8
insert into Customer_Account_Access values(11, 102, 'sign');
insert into Customer_Account_Access values(11, 103, 'sign');
update DastorPardakht set state = 1 where PNumber = 6062; -- impossible 1 < 2 
insert into Customer_sign values(102, 6062);
update DastorPardakht set state = 1 where PNumber = 6062; -- possible 2 => 2 



-- Q9
/* 
This operation is fully automatic using triggers.
*/

insert into Account_soratHesab(STime, amount, AID, Descriptions, SType) 
	values (current_timestamp(), 11500, 11, 'exp1', 'receive');

insert into Account_soratHesab(STime, amount, AID, Descriptions, SType) 
	values (current_timestamp(), 24600, 12, 'exp2', 'send');