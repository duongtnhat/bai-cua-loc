create database shopingcart
go
use shopingcart
go
create table sc_user(
	id int primary key identity(1, 1),
	username nvarchar(255) not null unique,
	password nvarchar(255) not null
)
go
create table sc_product(
	id int primary key identity(1, 1),
	name nvarchar(255) not null unique,
	image nvarchar(255),
	price int
)
go
create table sc_bill(
	id int primary key identity(1, 1),
	address nvarchar(255),
	phone nvarchar(255),
	created_at DATETIME DEFAULT GETDATE()
)
go
create table sc_bill_detail(
	id int primary key identity(1, 1),
	bid int foreign key references sc_bill(id),
	pid int foreign key references sc_product(id),
	quatity int
)
go

insert into sc_product(name, image, price) values (N'Đồng Hồ Rolex Automatic size 41 RL6262', 'https://cdn.vatgia.vn/pictures/thumb/418x418/2018/08/amg1533172740.jpg', 1400000);
insert into sc_user(username, password) values('admin', 'admin');

select name from sc_product