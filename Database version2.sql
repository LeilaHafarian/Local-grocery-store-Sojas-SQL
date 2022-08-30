USE master
if exists (select * from sysdatabases where name = 'grocerystore')
         alter database grocerystore set single_user with rollback immediate 
		 drop database grocerystore

GO
CREATE DATABASE grocerystore;
GO
USE grocerystore;
--________
CREATE TABLE Employee (
 EmployeeId int PRIMARY KEY,
 Personnummer bigint UNIQUE,
 TelefonNumber bigint NOT NULL,
 Email nvarchar(100) NOT NULL,
 FirstName nvarchar(100),
 LastName nvarchar(100)
);

CREATE TABLE Departments (
    DepartmentId int PRIMARY KEY IDENTITY(1,1),
    [Name] varchar (20),
    Employee int not null
     );

 CREATE TABLE EmployeeTelefonNumber(
	Employee varchar,
	TelefonNumber bigint,
	PRIMARY KEY ( Employee, TelefonNumber)
	);

	CREATE TABLE EmployeeEmail(
	Employee varchar,
	Email nvarchar(100) NOT NULL,
	PRIMARY KEY ( Employee, Email)
	);


 CREATE TABLE Campain(
 CampainId int  PRIMARY KEY,
 Pricedrop int
);

 CREATE TABLE Product (
 productId int not null identity(1,1) PRIMARY KEY,
 ProductName text,
 NuminStore int,
 ListOfIngredients text,
 ExpDate date,
 Price int,
 Campain int ,
 EmployeeId int not null
 );
 select *from Product

CREATE TABLE TblBarCode(
 [BarCode] int NOT NULL PRIMARY KEY,
 productId int not null,
)

CREATE TABLE ProductDepartment(
DepartmentId int NOT NULL,
productId int NOT NULL,
PRIMARY KEY (DepartmentId, productId))

--______________

--CREATE INDEX index6 ON Product (BarCode);
CREATE INDEX index7 ON Product (NuminStore);
CREATE INDEX index8 ON Product (ExpDate);
CREATE INDEX index5 ON Departments (DepartmentId);
CREATE INDEX index1 ON Employee (EmployeeId);
CREATE INDEX index2 ON Employee (TelefonNumber);
CREATE INDEX index3 ON Employee (Email);
CREATE INDEX index4 ON Employee (Personnummer);
--____________
alter table Departments
add foreign key (Employee)
references Employee(EmployeeId)


alter table TblBarCode
add foreign key(productId)
references Product(productId)

alter table Product
add foreign key(Campain)
references Campain(CampainId)

alter table Product
add foreign key(EmployeeId)
references employee(EmployeeId)

alter table ProductDepartment
add foreign key (productId)
references Product (productId)

alter table ProductDepartment
add foreign key (DepartmentId)
references Departments (DepartmentId)



--___________
INSERT INTO Employee (EmployeeId, Personnummer, TelefonNumber, Email, FirstName, LastName)
       VALUES 
	      (1, 198304274544, 0795434433, 'Jack.Nicholson65@gmail.com','Jack','Nicholson'),
		  (2, 197907227876, 0767865533, 'Marlon.Brando87@gmail.com', 'Marlon','Brando'),
		  (3, 198511217865, 0798765544, 'Katharine.Hepburn@gmail.com', 'Katharine','Hepburn'),
		  (4, 198408125544, 0765434422, 'William.Clark@gmail.com', 'William', 'Clark'),
		  (5, 198504189922, 0784324466, 'Ingrid.Bergman@gmail.com', 'Ingrid','Bergman'),
		  (6, 198310227733, 0786541167, 'Elizabeth.Taylor@gmail.com','Elizabeth','Taylor'),
		  (7, 198109119911, 0756543388, 'Leonardo DiCaprio@gmail.com','Leonardo','DiCaprio');
SELECT * FROM Employee;
SELECT * FROM Product;

 INSERT INTO Departments (Name, Employee)
       VALUES 
	      ('Dairy', 2),
		  ('fruit', 2),
		  ('pantry', 1),
		  ('drinks', 1),
		  ('bread', 1),
		  ('meat counter', 1);		  
SELECT * FROM Departments;


  INSERT INTO EmployeeTelefonNumber(Employee, TelefonNumber) 
  VALUES 
  (1, 7034455),
  (1, 7034454);

	SELECT * FROM EmployeeTelefonNumber;


 INSERT INTO EmployeeEmail(Employee, Email) 
  VALUES 
  (1, 'J@gmail.com'),
  (1, 'A@gmail.com');

SELECT * FROM EmployeeEmail;



INSERT INTO Campain (CampainId ,Pricedrop)
       VALUES 
	      (1,60),
		  (2, 40),
		  (3, 30),
		  (4, 90),
		  (5, 10);
SELECT *FROM Campain;



 INSERT INTO Product (ProductName, NuminStore, ListOfIngredients, ExpDate, Price,Campain,  EmployeeId)
       VALUES 
	      ( 'Chips', 100, 'Potatoes sunflower oil salt', '2022-12-29', 19, 1, 1),
		 ( 'Ice cream', 2, 'egg Sugar milk vanilla salt cream','2022-02-01', 3, 1,2 ),
		  ( 'Beard', 20, 'Flour Water batter yeast salt','2021-01-10', 5, 1,3 ),
		  ('Peanut butter',  78, 'peanut oil','2022-06-01', 40, 1,4),
		  ('yoghurt', 30, 'milk starter', '2022-03-01', 19, 1,5);
SELECT * FROM Product;

alter table product 
add inventorDate date

update product set inventorDate=DATEADD(day, -15, GETDATE())
where productId=5
update product set inventorDate=DATEADD(day, -10, GETDATE())
where productId=4
update product set inventorDate=DATEADD(day, -6, GETDATE())
where productId=3
update product set inventorDate=DATEADD(day, -2, GETDATE())
where productId=2
update product set inventorDate=DATEADD(day, -1, GETDATE())
where productId=1

insert into ProductDepartment values (1,1),(1,2),(2,3),(2,4),(4,5),(5,5),(5,2)


INSERT INTO TblBarCode (productId,barcode)
values (5,17654387), (1,19874398),  (2,56438754 ),  (3,98723545),  (4,76782136);
select * from TblBarCode

INSERT INTO ProductDepartment VALUES (1, 1);
INSERT INTO ProductDepartment VALUES (1,2);
INSERT INTO ProductDepartment VALUES (2, 3);
SELECT * FROM ProductDepartment;

--Övning bara
--update Product set NuminStore = 35  where productId=5;
--update Product set NuminStore= NuminStore+1 where Price>20;
--select  Price from Product where ProductName = Chips;

