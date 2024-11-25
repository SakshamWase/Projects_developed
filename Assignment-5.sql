sp_rename 'order_2', 'orders'


----1 Arrange the ‘Orders’ dataset in decreasing order of amount

Select * from orders
order by Amount desc

----2 Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table.

Create table Employee_details1(EMP_ID INT, EMP_NAME Varchar(50), EMP_SALARY INT)
Select * into Employee_details2 FROM Employee_details1
Select * from Employee_details2

----3 Apply the union operator on these two tables
SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details1
UNION ALL
SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details2

----4 Apply the intersect operator on these two tables

SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details1
Intersect
SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details2

----5 Apply the except operator on these two tables
SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details1
Intersect
SELECT EMP_ID, EMP_NAME, EMP_Salary
FROM Employee_details2