CREATE TABLE [EMPLOYEE TABLE] (EMPLOYEE_ID INT PRIMARY KEY, FIRST_NAME VARCHAR(30), LAST_NAME VARCHAR(30), SALARY INT, JOINING_DATE DATETIME, DEPARTMENT VARCHAR(30)) 
CREATE TABLE [EMPLOYEE BONUS TABLE] (EMPLOYEE_ID INT, BONUS_AMOUNT INT, BONUS_DATE DATETIME, FOREIGN KEY (EMPLOYEE_ID) REFERENCES [EMPLOYEE TABLE](EMPLOYEE_ID))
CREATE TABLE [EMPLOYEE TITLE TABLE] (EMPLOYEE_REF_ID INT, EMPLOYEE_TITLE VARCHAR(30), AFFECTIVE_DATE DATETIME)

INSERT INTO [EMPLOYEE TABLE] values
--(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2011-02-16 9:00:00','HR'),
(4,'Sushant','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')

Select * from [EMPLOYEE TABLE]

INSERT INTO [EMPLOYEE BONUS TABLE] values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00')

Select * from [EMPLOYEE BONUS TABLE]

INSERT INTO [EMPLOYEE TITLE TABLE] values
(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst. Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00')

Select * from [EMPLOYEE TITLE TABLE]


Select * from [EMPLOYEE TABLE]
Select * from [EMPLOYEE BONUS TABLE]
Select * from [EMPLOYEE TITLE TABLE]

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
SELECT FIRST_NAME AS EMPLOYEE_NAME FROM [EMPLOYEE TABLE]

--2 Display “LAST_NAME” from Employee table in upper case.
SELECT UPPER(LAST_NAME) FROM [EMPLOYEE TABLE]

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
SELECT DISTINCT DEPARTMENT FROM [EMPLOYEE TABLE]

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
SELECT LEFT(LAST_NAME,3) FROM [EMPLOYEE TABLE]

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
SELECT DISTINCT DEPARTMENT, LEN(DEPARTMENT) as Length FROM [EMPLOYEE TABLE]

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME a space char should separate them..
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM [EMPLOYEE TABLE]

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
SELECT * FROM [EMPLOYEE TABLE]
ORDER BY FIRST_NAME

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM [EMPLOYEE TABLE]
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
Select * from [EMPLOYEE TABLE]
where FIRST_NAME = 'VEENA' OR FIRST_NAME = 'KARAN'

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
SELECT * FROM [EMPLOYEE TABLE]
WHERE DEPARTMENT = 'ADMIN'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
SELECT * FROM [EMPLOYEE TABLE]
WHERE FIRST_NAME LIKE 'V%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
SELECT * FROM [EMPLOYEE TABLE]
WHERE SALARY BETWEEN 100000 AND 500000

--13 Display details of the employees who have joined in Feb-2020.
SELECT * FROM [EMPLOYEE TABLE]
WHERE JOINING_DATE Between '2020-02-01 09:00:00.000' AND '2020-02-29 09:00:00.000' 

Select * from [EMPLOYEE TABLE]
--14 Display employee names with salaries >= 50000 and <= 100000.
Select * from [EMPLOYEE TABLE]
Where Salary Between 50000 AND 100000

--16 DISPLAY details of the EMPLOYEES who are also Managers.
SELECT * FROM [EMPLOYEE TABLE] AS E
	INNER JOIN [EMPLOYEE TITLE TABLE] AS ET ON E.EMPLOYEE_ID = ET.EMPLOYEE_REF_ID
	WHERE ET.EMPLOYEE_TITLE = 'MANAGER'

--17 DISPLAY duplicate records having matching data in some fields of a table.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS COUNT FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT
HAVING COUNT(DEPARTMENT) > 1



--18 Display only odd rows from a table.
Select * from [EMPLOYEE TABLE]
where EMPLOYEE_ID % 2 = 1

--19 Clone a new table from EMPLOYEE table.
SELECT *
INTO EMPLOYEE_Table_Clone
FROM [EMPLOYEE TABLE]

Select * from EMPLOYEE_Table_Clone

--20 DISPLAY the TOP 2 highest salary from a table.
Select TOP 2 Salary from [EMPLOYEE TABLE]  
Order by SALARY DESC

--21. DISPLAY the list of employees with the same salary.
SELECT * FROM [EMPLOYEE TABLE]
WHERE SALARY IN 
  (SELECT SALARY
  FROM [EMPLOYEE TABLE]
  GROUP BY SALARY
  HAVING COUNT(*) > 1)
ORDER BY SALARY

--22 Display the second highest salary from a table.
SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY FROM [EMPLOYEE TABLE]
WHERE SALARY < (SELECT MAX(SALARY) FROM [EMPLOYEE TABLE])


--23 Display the first 50% records from a table.
1.
Select TOP 50 Percent * from [EMPLOYEE BONUS TABLE]
Order by BONUS_AMOUNT

2.
Select TOP 50 Percent * from [EMPLOYEE TABLE]
Order by SALARY

--24. Display the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(*) AS EMP_COUNT FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT
HAVING COUNT(*) < 4

--25. Display all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(*) AS NUM_OF_PEOPLE FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT

--26 Display the name of employees having the highest salary in each department.
SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.SALARY, E1.DEPARTMENT FROM [EMPLOYEE TABLE] AS E1
WHERE E1.SALARY = (SELECT MAX(E2.SALARY) FROM [EMPLOYEE TABLE] AS E2 WHERE E2.DEPARTMENT=E1.DEPARTMENT)

--27 Display the names of employees who earn the highest salary.
SELECT FIRST_NAME, SALARY FROM [EMPLOYEE TABLE]
WHERE SALARY = (SELECT MAX(SALARY) FROM [EMPLOYEE TABLE])

--28 Diplay the average salaries for each department
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY FROM [EMPLOYEE TABLE]
GROUP BY DEPARTMENT

--29 display the name of the employee who has got maximum bonus
SELECT EI.EMPLOYEE_ID,
	   ET.FIRST_NAME,
	   EI.BONUS_AMOUNT
	   FROM [EMPLOYEE BONUS TABLE] AS EI
		INNER JOIN [EMPLOYEE TABLE] AS ET ON ET.EMPLOYEE_ID=EI.EMPLOYEE_ID
		WHERE BONUS_AMOUNT = (SELECT MAX(BONUS_AMOUNT) FROM [EMPLOYEE BONUS TABLE])

--30 Display the first name and title of all the employees
SELECT  ET.FIRST_NAME,
		ETT.EMPLOYEE_TITLE
		FROM [EMPLOYEE TABLE] AS ET
		INNER JOIN [EMPLOYEE TITLE TABLE] AS ETT ON ETT.EMPLOYEE_REF_ID= ET.EMPLOYEE_ID
		
