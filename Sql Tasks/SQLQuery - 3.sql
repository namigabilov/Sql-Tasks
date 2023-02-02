create database Kitabxana

use Kitabxana

create table Books
(
	Id int identity Primary Key,
	Name nvarchar(100) not null check(len(Name) > 2),
	PageCount int  not null check(PageCount > 10)
)
create table Authors 
(
	Id int identity Primary Key,	
	Name nvarchar(100) not null,
	SurName nvarchar(100) not null
)
alter table Books
add AuthorId int Foreign Key References Authors(Id)

-- Create View 

create view usv_ShowBookAndAuthorInfo
as
select 
Books.Name as [Kitab adi],
Books.PageCount as [Vereqlerin Sayi],
Authors.Name as [Yazar adi]
from Authors
join Books
on Books.AuthorId = Authors.id

select * from usv_ShowBookAndAuthorInfo 
  
-- Create Procedure

create procedure usp_SearchAuthorsByName 
@name nvarchar(100)
as 
Begin
	select 
	b.Name as [Kitab adi],
	b.PageCount as [Vereqlerin Sayi],
	a.Name as [Yazar adi]
	from Authors a
	join Books b
	on a.Id = b.AuthorId
	where a.Name = 'Stephen'
end

exec usp_SearchAuthorsByName 'Stephen'

create table ArchiveAuthors 
(
	Id int,
	Name nvarchar(100),
	Date DateTime2,
	StatmentType nvarchar(100)
)

create trigger AuthorsChanged
on Authors
after insert,delete
as
Begin
	declare @id int
	declare @name nvarchar(100)
	declare @date DateTime2
	declare @statementType nvarchar(100)	

	select @id = Authors.Id from inserted Authors
	select @name = Authors.Name from inserted Authors
	select @date = GETDATE() from inserted Authors
	select @statementType = 'Insert' from inserted Authors


	select @id = Authors.Id from deleted Authors
	select @name = Authors.Name from deleted Authors
	select @date = GETDATE() from deleted Authors
	select @statementType = 'Deleted' from deleted Authors
	
	insert into ArchiveAuthors(Id ,Name ,Date ,StatmentType)
	Values
	(@id,@name,@date,@statementType)
End


create trigger AuthorsUpdate
on Authors
after update
as
Begin
	declare @id int
	declare @name nvarchar(100)
	declare @date DateTime2
	declare @statementType nvarchar(100)	

	select @id = Authors.Id from inserted Authors
	select @name = Authors.Name from inserted Authors
	select @date = GETDATE() from inserted Authors
	select @statementType = 'Updated' from inserted Authors


	insert into ArchiveAuthors(Id ,Name ,Date ,StatmentType)
	Values
	(@id,@name,@date,@statementType)
End

alter view usv_GetFullAuthorAndBooksInfo
as
select CONCAT(a.Name, '  ' ,a.SurName) [FullName],
count(*) as [Books Count],
max(b.PageCount) as [Maks Page]
from Authors a
join Books b
on a.Id = b.AuthorId
group by a.Name , a.SurName

select * from usv_GetFullAuthorAndBooksInfo
