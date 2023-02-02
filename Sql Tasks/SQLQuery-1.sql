

create table Employees 
(
	Id int ,
	Name nvarchar(100),
	SurnName nvarchar(100),
	Postition nvarchar(100),
	Salary money
)
insert into Employees 
Values
(1,'Namiq','Abilov','Junior', 170  ),
(2,'Ramiz','Quliyev','Master',150),
(3,'Tural','Mamedov','Junior',170),
(4,'Murad','Aliyev','Middle',170)

select * from Employees 

--Min ,Max Slary

select MIN (Salary) from Employees
select MAX (Salary) from Employees

--Avarage Salary

select AVG(Salary) from Employees

--Maasi ortalamadan cox olan isciler 
select Name ,SurnName ,Salary from Employees where Salary >= (select AVG(Salary) from Employees)


--Task 2

create database Market

use Market

create table Products
(
	Id int,
	Name nvarchar(50),
	Price money
)
alter table Products add Brand nvarchar(50)

insert into Products
Values
(1,'T-shirt',15,'Nike'),
(2,'Jean',16,'Adidas'),
(3,'Hat',17,'Nike'),
(4,'Jean',18,'Rich'),
(5,'T-shirt',19,'Adidas'),
(6,'Jean',120,'Nike'),
(7,'T-shirt',12,'Rich')

select * from Products

select * from Products where price <= (select AVG(price) from Products)

select * from Products where price >=10 

select * from Products where len(Brand) > 5

