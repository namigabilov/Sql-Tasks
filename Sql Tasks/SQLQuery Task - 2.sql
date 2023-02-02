--Task 1
create DataBase Company

use Company
 
 create table Employees 
 (
	Id int identity Primary Key,
	FullName nvarchar(100) Not Null check(LEN(FullName) > 3),
	Email nvarchar(100) Unique Not Null
  )
  create table Department
  (
	Id int identity primary key,
	Name nvarchar(100) not null Check(LEN(Name)>2)
  )
  alter table Employees
  add DepartmentId int not null foreign key references Department(Id)


  --Task 2

  create database Shop

  use Shop

  create table Brands
  (
	Id int identity Primary Key ,
	Name nvarchar(100) not null  
  )
  insert into Brands
  Values
  ('Apple'),
  ('Asus')
   create table NoteBooks
  (
	Id int identity Primary Key ,
	Name nvarchar(100) not null ,
	BrandId int Foreign Key references Brands(Id),
	Price money
  )
  alter table NoteBooks 
  add Count int

   create table Phones
  (
	Id int identity Primary Key ,
	Name nvarchar(100) not null ,
	BrandId int Foreign Key references Brands(Id),
	Price money
  )

alter table Phones 
add Count int


  --3 , 4
  select b.Name as [Brend Adi] ,nb.Name [Cihaz Modeli] ,nb.Price as [Qiymeti] from Brands B
  join NoteBooks p
  on p.BrandId = b.Id
  join NoteBooks nb
  on nb.BrandId =b.Id

  select b.Name as [Brend Adi] ,nb.Name [Cihaz Modeli] ,nb.Price as [Qiymeti] from Brands B
  join Phones p
  on p.BrandId = b.Id
  join NoteBooks nb
  on nb.BrandId =b.Id

  --5
  select * from Brands where Name like '%s%'

  -- 6
  Select * from NoteBooks where (price Between 2000 and 5000) or price > 2000

  -- 7
  select *from Phones where (price Between 1000 and 1500) or price >1500

  --8
  select 
  SUM(nb.Count) as [Say]
  from Brands b
  join NoteBooks nb
  on nb.BrandId = b.Id
  
  --9
  select 
  SUM(p.Count) as [Say]
  from Brands b
  join Phones p
  on p.BrandId = b.Id

  --11
  select * from Brands b
  join Phones p
  on p.BrandId = b.Id
  join NoteBooks nb
  on nb.BrandId =b.Id

  --13
  select *  from Brands b
  join Phones p
  on p.BrandId = b.Id
  join NoteBooks nb
  on nb.BrandId =b.Id
  where p.Price > 1000 or nb.price > 1000

  --14
  select 
  sum(p.count) as [TotalCount],
  sum(p.Price) as [TotalPrice]
  from Brands b
  join Phones p
  on p.BrandId = b.Id

  --15

   select 
  sum(nb.Count) as [TotalCount],
  sum(nb.Price) as [TotalPrice]
  from Brands b
  join NoteBooks nb
  on nb.BrandId = b.Id