create table Salesman
(
salesman_id int Primary Key,
name varchar(20),
city varchar(50),
commission float
)
create table Customers
(
customer_id int Primary key,
cust_name varchar(40),
city varchar(50),
grade int,
salesman_id int FOREIGN KEY REFERENCES Salesman(salesman_id)
)
create table Orders
(
ord_no int,
purch_amt float,
ord_date date,
customer_id int FOREIGN KEY REFERENCES Customers(customer_id),
salesman_id int FOREIGN KEY REFERENCES Salesman(salesman_id)
)
create table Nobel_Win
(
year int,
subject varchar(40),
winner varchar(40),
country varchar(40),
category varchar(40)
)
insert into salesman values(5001 , 'James Hoog','New York ',0.15)
insert into salesman values(5002 , 'Nail Knite' , 'Paris' , 0.13)
insert into salesman values(5005 , 'Pit Alex',   ' London', 0.11)
insert into salesman values(5006 ,'Mc Lyon  ', 'Paris',  0.14)
insert into salesman values(5007,'Paul Adam'  ,'Rome', 0.13)
insert into salesman values(5003 ,' Lauson Hen','San Jose',0.12)
select * from salesman;
insert into Customers values(3002  , 'Nick Rimando','New York',100, 5001)
insert into Customers values(3007 ,'Brad Davis','New York',200, 5001)
insert into Customers values(3005 ,'Grahan Zusi','California',200, 5002)
insert into Customers values(3008 , 'Julian Green ','London',300, 5002 )
insert into Customers values(3004 , 'Fabian Johson','Paris', 300 , 5006)
insert into Customers values(3009,'Geoff Cameron','Berlin',100,5003)

select * from Customers;
insert into Orders values(70001,150.5,'2012-10-05',3005,5002)
insert into Orders values(70009,270.65,'2012-09-10',3001,5005)
insert into Orders values(70002,65.26,'2012-10-05',3002,5001)
insert into Orders values(70004,110.5,'2012-08-17',3009,5003)
insert into Orders values(7007,948.5,'2012-09-10',3005,5001)
insert into Orders values(7005,2400.6,'2012-07-27',3007,5001)
select * from Orders;
insert into  Nobel_Win values(1970,'Physics','Hannes Alfven','Sweden','Scientist')
insert into  Nobel_Win values(1970,'Physics','Louis Neel','France','Scientist')
insert into  Nobel_Win values(1970,'Chemistry','Luis Federico Leloir','France','Scientist')
insert into  Nobel_Win values(1970,'Physiology','Ulf von Euler' , 'Sweden','Scientist')
insert into  Nobel_Win values(1970,'Physiology', 'Bernard Katz','Germany','Scientist')
insert into  Nobel_Win values(1970,'Literature','Aleksandar Solzhenitsyn','Russia','Lingist')
insert into  Nobel_Win values(1970,'Economics','Paul Samuelson','USA','Economist')
insert into  Nobel_Win values(1970,'Physiology','Julius Axelrod','USA','Scientist')
select * from  Nobel_Win;
select name,commission from salesman
select  ord_date, salesman_id, ord_no, purch_amt from orders;
select name,city from salesman where city='Paris';
select * from Customers where grade=200;
select * from Customers where grade>100;
select * from Customers where city='New York';
select year, subject, winner, country from Nobel_Win 
select * from Nobel_Win where year=1970;
select winner from Nobel_Win where category='Literature';
select year, subject, winner, country from Nobel_Win where subject='Chemistry';
select Ord_no, Ord_date, Purch_amt from Orders where Salesman_id='5001';
select * from Orders where ord_date!='2012-09-10'AND salesman_id='505' AND Purch_amt='1000.0';
select * from Orders where Purch_amt<200 OR Ord_date>='10-02-2012'AND Customer_id='3009';

select year,subject from Nobel_Win where winner='Dennis Gabor';
select winner from Nobel_Win where year<=1950 AND subject='Physics';
select year,subject,winner,country  from Nobel_win where subject='Chemistry' AND year between '1965' and '1975';
select * from Nobel_Win where winner like 'Louis%';
select * from Nobel_win where year='1970' AND subject NOT in ('Physiology','Economics');
select * from Customers where city='New York' AND grade>100;
select * from salesman where city='paris' OR city= 'rome'; 
select * from salesman where city NOT IN('paris','rome');
select * from salesman where commission between 0.12 AND 0.14;
select * from salesman where name LIKE 'A%' AND name LIKE 'K%';
select * from salesman where name LIKE 'N___I%';
select * from Customers where customer_id in ('3007','3008','3009');
select * from customers where grade is  NULL;
select name Salesman_name ,cust_name Customers_name from Salesman s,Customers c where s.salesman_id=c.salesman_id AND s.city=c.city;

select name Salesman_name ,cust_name Customers_name from Salesman s,Customers c where s.salesman_id=c.salesman_id;
select name Salesman_name,cust_name Customers_name from Salesman s,Customers c where s.salesman_id=c.salesman_id;
select ord_no ,cust_name customer_name from Orders o,customers c where c.customer_id=o.customer_id;
select  cust_name,grade from customers c,orders o, salesman s where c.customer_id=o.customer_id 
AND s.salesman_id=c.salesman_id AND grade is NOT NULL AND s.city=c.city;
select cust_name customers_name,c.city city,name salesman_name,commission from salesman s,customers c 
where s.salesman_id=c.salesman_id AND commission between 0.12 AND 0.14;
select ord_no,cust_name,commission,purch_amt/commission earned_commission from salesman s,customers c,orders o where s.salesman_id=c.salesman_id
AND s.salesman_id=o.salesman_id AND grade>=200;
select ord_no from Orders o,salesman s where  s.salesman_id=(select salesman_id from salesman where name='Paul Adam'); 
select ord_no,purch_amt,ord_date,customer_id from Orders o,salesman s where  s.salesman_id=(select salesman_id from salesman where name='Paul Adam');
select ord_no,purch_amt,ord_date,customer_id from Orders o,salesman s where  s.salesman_id=(select salesman_id from salesman where city='London');
select ord_no,purch_amt,ord_date,o.customer_id from Orders o,customers c where  c.salesman_id!=(select salesman_id from customers c where customer_id='3007');
select commission,name salesman from salesman s,customers c where c.salesman_id=(select c.salesman_id from customers where city='paris');