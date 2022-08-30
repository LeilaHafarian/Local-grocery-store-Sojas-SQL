
USE grocerystore;

--1     Lista alla produkters namn och antal i lager. Listan ska vara sorterad på antal i lager med lägst värde först. 
SELECT ProductName, NuminStore FROM Product  ORDER BY NuminStore  ASC;   -- REVERSE IS DESC


--2Lista butikens avdelningars namn tillsammans med namnet på personen som är ansvarig för varje avdelning. 
SELECT DEPARTMENTS.Name, Employee.FirstName, Employee.LastName FROM Departments JOIN Employee ON Departments.Employee = Employee.EmployeeId ;  


--3.Skriv en fråga som räknar ut antalet anställda i butiken. 
SELECT COUNT(*) AS EMPLOYEE_COUNT FROM Employee;

-- 4många till många Lista namnet på alla produkter i avdelningen med namnet ”Mejeri” som har 3 eller färre antal kvar i lager.
select PRODUCT.ProductName from Product 
left join ProductDepartment 
on Product.productId=ProductDepartment.productId
right join Departments 
on ProductDepartment.DepartmentId=Departments.DepartmentId
where Departments.Name='dairy' and Product.NuminStore<3

-- 5 alla produkter + namnet på den anställda som senast inventerat produkten. 
SELECT Product.ProductName, EMPLOYEE.FirstName FROM product JOIN EMPLOYEE 
ON Product.EmployeeId = Employee.EmployeeId 
WHERE Product.InventorDate > DATEADD(day, -7, GETDATE())

 

  
 

	
