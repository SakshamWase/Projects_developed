--1. Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG(SCOST) AS AVG_SELLING_COST FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL'

--2. Display Names, Ages of all Programmers.
SELECT Pname, DATEDIFF(Year, DOB, DOJ) AS Age FROM Programmer
SELECT Pname, DATEDIFF(YEAR, DOB, GETDATE()) AS Age FROM Programmer

--3. Display the Names of those who have done the DAP Course.
SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME, DOB AS [DATE OF BIRTH] FROM PROGRAMMER WHERE DOB LIKE '%%%%-01-%%'

--5. What is the Highest Number of copies sold by a Package?
SELECT MAX(SOLD) AS MAX_SOLD FROM SOFTWARE

--6. Display lowest course Fee.
SELECT MIN([COURSE FEE]) AS MIN_COURSE_FEE FROM STUDIES

--7. How many programmers done the PGDCA Course?
SELECT COUNT(COURSE) as PGDCA_Course_Done FROM STUDIES WHERE COURSE = 'PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST*SOLD) AS SALES_OF_C FROM SOFTWARE WHERE DEVELOPIN = 'C'

--9. Display the Details of the Software Developed by Ramesh.
SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH'

--10. How many Programmers Studied at Sabhari?
SELECT COUNT(INSTITUTE) AS STUDIED_IN_SABHARI FROM STUDIES WHERE INSTITUTE = 'SABHARI'

--11. Display details of Packages whose sales crossed the 2000 Mark.
Select * from software where (SCOST*SOLD) > 2000

--12. Display the Details of Packages for which Development Cost have been recovered.
Select * from software where (Scost*Sold)>Dcost

--13. What is the cost of the costliest software development in Basic?
Select scost from SOFTWARE where DEVELOPIN = 'BASIC'

--14. How many Packages Developed in DBASE?
SELECT COUNT(DEVELOPIN) AS PACKAGES_DEVELOP_DBASE FROM SOFTWARE WHERE DEVELOPIN = 'DBASE'

--15. How many programmers studied in Pragathi?
SELECT COUNT(INSTITUTE) AS STUDIED_IN_PRAGATHI FROM STUDIES WHERE INSTITUTE = 'PRAGATHI'

--16. How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(PNAME) AS FEE_5K_TO_10k FROM STUDIES WHERE [COURSE FEE] BETWEEN 5000 AND 10000 

--17. What is AVG Course Fee
SELECT COURSE, AVG([COURSE FEE]) FROM STUDIES
GROUP BY COURSE
--18. Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'

--19. How many Programmers know either COBOL or PASCAL.
SELECT COUNT(PNAME) AS PROGRAMMER FROM PROGRAMMER WHERE PROF1 = 'PASCAL' OR PROF1 = 'COBOL' OR PROF2 = 'PASCAL' OR PROF2 = 'COBOL' 


--20. How many Programmers Don’t know PASCAL and C
SELECT COUNT(PNAME) FROM PROGRAMMER WHERE  NOT PROF1 ='PASCAL' 
AND NOT PROF1 ='C'
AND NOT PROF2= 'PASCAL'
AND NOT PROF2= 'C'


--21. How old is the Oldest Male Programmer.
Alter table programmer 
Add Age Tinyint

Update PROGRAMMER
Set AGE = (DATEDIFF(YEAR, DOB, GETDATE()))

Select PName,Max(Age) as Max_age from PROGRAMMER
Group by Pname
Order By Max_age desc

--22. What is the AVG age of Female Programmers?
Select Avg(Age) from PROGRAMMER where Gender = 'F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) as Experience FROM PROGRAMMER
ORDER BY PNAME DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT PNAME FROM programmer WHERE MONTH(DOB) = MONTH(GETDATE())

--25. How many Female Programmers are there?
--26. What are the Languages studied by Male Programmers.
Select * from Programmer where Gender = 'M'

--27. What is the AVG Salary?
SELECT AVG(SALARY) AS AVG_SALARY FROM PROGRAMMER

--28. How many people draw salary 2000 to 4000?
Select Count(PNAME) AS PROGRAMMER FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000


--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT * FROM PROGRAMMER WHERE  NOT PROF1 ='PASCAL' 
AND NOT PROF1 ='Clipper'
AND NOT PROF1 ='COBOL'
AND NOT PROF2= 'PASCAL'
AND NOT PROF2 ='Clipper'
AND NOT PROF2 ='COBOL'

--30. Display the Cost of Package Developed By each Programmer.
SELECT PNAME, sum(DCOST) as Cost_of_Package FROM SOFTWARE 
GROUP by PNAME

--31. Display the sales values of the Packages Developed by the each Programmer.
SELECT PNAME, DEVELOPIN, SCOST FROM SOFTWARE

--32. Display the Number of Packages sold by Each Programmer.
SELECT PNAME, sum(SCOST) as Cost_of_Package FROM SOFTWARE 
GROUP by PNAME

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
SELECT PNAME, DEVELOPIN, SCOST FROM SOFTWARE
ORDER BY DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN, AVG(DCOST) AS "AVERAGE DEVELOPMENT COST", AVG(SCOST*SOLD) AS "AVERAGE SELLING COST", AVG(SCOST) AS "AVERAGE PRICE PER COPY" 
FROM SOFTWARE
GROUP BY DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
SELECT PNAME, MAX(DCOST) as 'Costliest package developed', MIN(DCOST) as 'Cheapest package developed' from SOFTWARE
Group by PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE, COUNT(COURSE) AS 'NO_OF_COURSES', AVG([COURSE FEE]) AS AVG_FEE from STUDIES 
GROUP BY INSTITUTE

--37. Display each institute Name with Number of Students.
SELECT INSTITUTE, COUNT(PNAME) AS 'NO_OF_STU' from STUDIES 
GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
SELECT PNAME, GENDER FROM PROGRAMMER

--39. Display the Name of Programmers and Their Packages.
SELECT PNAME, TITLE FROM SOFTWARE

--40. Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN, COUNT(DEVELOPIN) AS 'NUMBER OF PACKAGES' FROM SOFTWARE
WHERE   NOT DEVELOPIN = 'C' AND
		NOT DEVELOPIN = 'C++'
GROUP BY DEVELOPIN

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT TITLE, DEVELOPIN, SOLD FROM SOFTWARE WHERE DCOST <1000

--42. Display AVG Difference between SCOST, DCOST for Each Package.
SELECT DEVELOPIN, AVG(SCOST-DCOST) FROM SOFTWARE
GROUP BY DEVELOPIN

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT PNAME, (SCOST*SOLD) AS 'TOTAL SCOST', DCOST, (DCOST - (SCOST*SOLD)) AS 'AMOUNT TO BE RECOVERED' FROM SOFTWARE
WHERE (DCOST - (SCOST*SOLD)) > 0

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
Select Max(Salary) as Max_Salary, Min(Salary) as Min_Salary, AVG(Salary) as Avg_Salary from PROGRAMMER Where Salary >2000

--45. Who is the Highest Paid C Programmers?
Select Pname, Salary from PROGRAMMER where PROF1 = 'C' OR PROF2 = 'C'
Order by Salary DESC

--46. Who is the Highest Paid Female COBOL Programmer?
Select PNAME, MAX(Salary) from PROGRAMMER Where GENDER = 'F' AND PROF1 = 'COBOL' OR PROF2 = 'COBOL'
Order by Salary DESC

--47. Display the names of the highest paid programmers for each Language.
SELECT 
	 PNAME AS HIGHEST_PAID_PROGRAMMERS,
    CASE 
        WHEN PROF1 = 'PASCAL' OR PROF2 = 'PASCAL' THEN 'PASCAL'
        WHEN PROF1 = 'CLIPPER' OR PROF2 = 'CLIPPER' THEN 'CLIPPER'
        WHEN PROF1 = 'COBOL' OR PROF2 = 'COBOL' THEN 'COBOL'
        WHEN PROF1 = 'C' OR PROF2 = 'C' THEN 'C'
        WHEN PROF1 = 'CPP' OR PROF2 = 'CPP' THEN 'CPP'
        WHEN PROF1 = 'BASIC' OR PROF2 = 'BASIC' THEN 'BASIC'
        WHEN PROF1 = 'ASSEMBLY' OR PROF2 = 'ASSEMBLY' THEN 'ASSEMBLY'
        WHEN PROF1 = 'DBASE' OR PROF2 = 'DBASE' THEN 'DBASE'
        WHEN PROF1 = 'FOXPRO' OR PROF2 = 'FOXPRO' THEN 'FOXPRO'
        WHEN PROF1 = 'ORACLE' OR PROF2 = 'ORACLE' THEN 'ORACLE'
    END as 'Language', 
    MAX(SALARY) AS HIGHEST_SALARY 
FROM PROGRAMMER
GROUP BY PNAME, PROF1, PROF2;

--48. Who is the least experienced Programmer.
SELECT * FROM PROGRAMMER
ORDER BY DOJ DESC 

--49. Who is the most experienced male programmer knowing PASCAL.
SELECT PNAME, DOB, Gender FROM PROGRAMMER WHERE GENDER = 'M' AND PROF1= 'PASCAL' OR PROF2='PASCAL' 
ORDER BY DOB 


--50. Which Language is known by only one Programmer?
SELECT * FROM PROGRAMMER 
WHERE PROF1 NOT IN (SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING COUNT(PROF1) > 1) AND
PROF2 NOT IN (SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF2) > 1)


--51. Who is the Above Programmer Referred in 50?
'Question not clear.'

--52. Who is the Youngest Programmer knowing DBASE?
SELECT PNAME, DOB, DOJ FROM PROGRAMMER WHERE PROF1 = 'DBASE' OR PROF2 = 'DBASE'
ORDER BY DOB DESC

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT * FROM PROGRAMMER WHERE SALARY >3000 AND GENDER ='F'
AND NOT PROF1= 'C' 
AND NOT PROF1= 'C++' 
AND NOT PROF1= 'ORACLE' 
AND NOT PROF1= 'DBASE' 
AND NOT PROF2= 'C'
AND NOT PROF2= 'C++'
AND NOT PROF2= 'ORACLE'
AND NOT PROF2= 'DBASE' 


--54. Which Institute has most number of Students?
SELECT TOP 1 INSTITUTE, SUM(1) AS NO_OF_STUDENTS
FROM STUDIES
GROUP BY INSTITUTE
ORDER BY NO_OF_STUDENTS DESC;


--55. What is the Costliest course?
SELECT COURSE FROM STUDIES
WHERE [COURSE FEE] = (SELECT MAX([COURSE FEE]) FROM STUDIES)

--56. Which course has been done by the most of the Students?
SELECT COURSE, COUNT(PNAME) AS NUM_STU FROM STUDIES
GROUP BY COURSE
ORDER BY NUM_STU DESC


--57. Which Institute conducts costliest course.
SELECT INSTITUTE FROM STUDIES
WHERE [COURSE FEE] = (SELECT MAX([COURSE FEE]) FROM STUDIES)

--58. Display the name of the Institute and Course, which has below AVG course fee.
SELECT INSTITUTE, COURSE FROM STUDIES
WHERE [COURSE FEE] < (SELECT AVG([COURSE FEE]) FROM STUDIES)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,
SELECT AVG([COURSE FEE]) FROM STUDIES

SELECT COURSE FROM STUDIES
WHERE [COURSE FEE] < (SELECT AVG([COURSE FEE]) + 1000 FROM STUDIES) 
AND [COURSE FEE] > (SELECT AVG([COURSE FEE]) - 1000 FROM STUDIES)

--60. Which package has the Highest Development cost?
SELECT DEVELOPIN FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--61. Which course has below AVG number of Students?
WITH STUDENT_COUNTS AS (
  SELECT Distinct COURSE, COUNT(PNAME) AS NUM_STUDENTS
  FROM STUDIES
  GROUP BY COURSE
),
AVG_COUNT AS (
  SELECT AVG(NUM_STUDENTS) AS AVG_STUDENTS
  FROM STUDENT_COUNTS

)
SELECT Distinct STUDENT_COUNTS.COURSE, NUM_STUDENTS FROM STUDENT_COUNTS, STUDIES, AVG_COUNT
WHERE NUM_STUDENTS < AVG_STUDENTS



--62. Which Package has the lowest selling cost?
SELECT DEVELOPIN, MIN(SCOST) AS MIN_SCOST FROM SOFTWARE
GROUP BY DEVELOPIN
ORDER BY MIN_SCOST


--63. Who Developed the Package that has sold the least number of copies?
SELECT PNAME FROM SOFTWARE
WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)

--64. Which language has used to develop the package, which has the highest sales amount?
SELECT PNAME, TITLE, DEVELOPIN FROM SOFTWARE
WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

--65. How many copies of package that has the least difference between development and selling cost where sold.
SELECT TITLE, SOLD FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE))

--66. Which is the costliest package developed in PASCAL.
SELECT TITLE, MAX(DCOST) AS DEV_COST FROM SOFTWARE 
WHERE DEVELOPIN = 'PASCAL'
GROUP BY TITLE
ORDER BY DEV_COST DESC

--67. Which language was used to develop the most number of Packages.
SELECT DEVELOPIN, COUNT(*) AS Package_Count
FROM SOFTWARE
WHERE DEVELOPIN IS NOT NULL
GROUP BY DEVELOPIN
ORDER BY Package_Count DESC


--68. Which programmer has developed the highest number of Packages?
SELECT PNAME, COUNT(TITLE) as no_Packages FROM SOFTWARE
GROUP BY PNAME
Order by no_Packages desc


--69. Who is the Author of the Costliest Package?
SELECT PNAME FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)

--70. Display the names of the packages, which have sold less than the AVG number of copies.
Select Title, SOLD from SOFTWARE
where SOLD < (Select avg(Sold) from SOFTWARE)

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
SELECT * FROM SOFTWARE WHERE (SCOST*SOLD)>(2*DCOST) 

--72. Display the programmer Name and the cheapest packages developed by them in each language.
--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN FROM SOFTWARE
WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE)
GROUP BY PNAME, DEVELOPIN
UNION
SELECT PNAME, DEVELOPIN, SOLD FROM SOFTWARE
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE)
GROUP BY PNAME, DEVELOPIN


--74. Who is the youngest male Programmer born in 1965?
SELECT PNAME, DOB, AGE FROM PROGRAMMER WHERE DOB LIKE '1965%' AND GENDER ='M'
ORDER BY DOB

--75. Who is the oldest Female Programmer who joined in 1992?
SELECT PNAME, DOB, DOJ FROM PROGRAMMER WHERE DOJ LIKE '1992%' AND GENDER ='F'
ORDER BY DOB

--76. In which year was the most number of Programmers born.
SELECT DATEPART(YEAR, DOB) AS BirthYear, COUNT(DOB) AS Num_of_Births
FROM PROGRAMMER
GROUP BY DATEPART(YEAR, DOB)
ORDER BY Num_of_Births DESC

--77. In which month did most number of programmers join?
SELECT DATEPART(MONTH, DOJ) AS JoinMonth, COUNT(DOJ) AS NumJoiners
FROM PROGRAMMER
GROUP BY DATEPART(MONTH, DOJ)
ORDER BY NumJoiners DESC

--78. In which language are most of the programmer’s proficient.
Select Prof, count(*) as 'no of programmer' from (Select PROF1 as Prof from PROGRAMMER UNION ALL Select PROF2 as Prof from PROGRAMMER) as All_Prof
group by Prof
Order by 'no of programmer' desc

--79. Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT * FROM PROGRAMMER
WHERE GENDER='M' AND SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F')

--80. Who are the Female Programmers earning more than the Highest Paid?
SELECT * FROM PROGRAMMER
WHERE GENDER='F' AND 
SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER='M')

--81. Which language has been stated as the proficiency by most of the Programmers?
SELECT Language, COUNT(*) AS ProficiencyCount
FROM (
  SELECT prof1 AS Language FROM Programmer
  UNION ALL
  SELECT prof2 AS Language FROM Programmer
) AS Languages
WHERE Language IS NOT NULL
GROUP BY Language
ORDER BY ProficiencyCount DESC


--82. Display the details of those who are drawing the same salary.
Select * from PROGRAMMER 
	where SALARY IN (Select SALARY from PROGRAMMER Group by SALARY Having count(*)>1)
Order by Salary DESC


--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT  S.DEVELOPIN,
		P.GENDER,
		P.SALARY
		FROM SOFTWARE AS S
		INNER JOIN PROGRAMMER AS P ON S.PNAME=P.PNAME
WHERE GENDER = 'M' AND SALARY>=3000


--84. Display the details of the packages developed in Pascal by the Female Programmers.
SELECT  * 
		FROM SOFTWARE AS S
		INNER JOIN PROGRAMMER P ON S.PNAME=P.PNAME
		WHERE S.DEVELOPIN = 'PASCAL' AND P.GENDER = 'F'

--85. Display the details of the Programmers who joined before 1990.
Select * from Programmer where DOJ >'1990'

--86. Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT  * 
		FROM SOFTWARE AS S
		INNER JOIN PROGRAMMER P ON S.PNAME=P.PNAME
		INNER JOIN STUDIES ST ON S.PNAME=ST.PNAME
		WHERE S.DEVELOPIN = 'C' AND P.GENDER = 'F' AND ST.INSTITUTE = 'PRAGATHI'


--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
SELECT  S.DEVELOPIN,
		P.GENDER,
		P.SALARY
		FROM SOFTWARE AS S
		INNER JOIN PROGRAMMER AS P ON S.PNAME=P.PNAME
WHERE GENDER = 'M' AND SALARY>=3000

--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
Select  ST.PNAME,
        ST.Institute,
		S.Developin,
		S.scost,
		s.dcost,
		s.sold
		from STUDIES ST
		Inner join SOFTWARE S on ST.PNAME = S.PNAME
		Inner join PROGRAMMER P on P.PNAME = ST.PNAME
		Inner join (SELECT INSTITUTE, COUNT(PNAME) AS NUMPROGRAMMERS FROM STUDIES
		GROUP BY INSTITUTE) TOP_INST on ST.INSTITUTE = TOP_INST.INSTITUTE
		Where P.GENDER = 'M' and S.DEVELOPIN = 'DBASE'
		

--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
SELECT  S.PNAME,
		ST.INSTITUTE,
		COUNT(S.DEVELOPIN) as 'Number of Packages',
		COUNT(S.SOLD) as 'No. of copies sold',
		sum(S.SCOST*S.SOLD) AS SALES_VALUES
		FROM SOFTWARE AS S
		INNER JOIN STUDIES AS ST ON S.PNAME=ST.PNAME
GROUP BY S.Pname, ST.INSTITUTE


--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
Select s.* from SOFTWARE as s
inner join PROGRAMMER as P on S.PNAME=p.PNAME
where (DEVELOPIN<>PROF1 and DEVELOPIN<>PROF2)


--91. Display the details of the software developed by the male students of Sabhari.
SELECT  S.PNAME,
		P.GENDER,
		ST.INSTITUTE,
		S.TITLE,
		S.DEVELOPIN,
		S.SCOST,
		S.DCOST,
		S.SOLD
FROM SOFTWARE AS S
INNER JOIN PROGRAMMER AS P ON S.PNAME = P.PNAME
INNER JOIN STUDIES AS ST ON S.PNAME = ST.PNAME
WHERE P.GENDER = 'M' AND ST.INSTITUTE = 'SABHARI'


--92. Display the names of the programmers who have not developed any packages.
Select Pname from PROGRAMMER
Where Pname not in (Select PNAME from SOFTWARE)

--93. What is the total cost of the Software developed by the programmers of Apple?
SELECT SUM(DCOST) FROM SOFTWARE
WHERE TITLE = APPLE

--94. Who are the programmers who joined on the same day?
SELECT PNAME, DOJ FROM PROGRAMMER
	WHERE DOJ IN (SELECT DOJ FROM PROGRAMMER GROUP BY DOJ HAVING COUNT(PNAME)>1)
ORDER BY DOJ

--95. Who are the programmers who have the same Prof2?
SELECT PNAME, PROF2 FROM PROGRAMMER
	WHERE PROF2 IN (SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF2)>1)
ORDER BY PROF2

--96. Display the total sales value of the software, institute wise.
SELECT  ST.INSTITUTE,
		SUM(SCOST*SOLD) as Total_Sales
		FROM SOFTWARE S
		INNER JOIN STUDIES AS ST ON S.PNAME=ST.PNAME
		GROUP BY INSTITUTE

--97. In which institute does the person who developed the costliest package studied.
SELECT  P.PNAME,
		S.DCOST,
		ST.INSTITUTE
		FROM PROGRAMMER AS P
		INNER JOIN SOFTWARE AS S ON P.PNAME=S.PNAME
		INNER JOIN STUDIES AS ST ON P.PNAME=ST.PNAME
where s.DCOST = (select max(DCOST) from SOFTWARE)

--98. Which language listed in prof1, prof2 has not been used to develop any package.
Select	P.PROF1,
		P.Prof2,
		S.DEvelopin
		From PROGRAMMER P
		Inner join SOFTWARE S on P.PNAME=S.PNAME
		Where DEVELOPIN NOT LIKE PROF1 AND
			  DEVELOPIN NOT like PROF2	


--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
SELECT  P.PNAME,
		P.SALARY,
		S.SCOST,
		ST.COURSE
		FROM PROGRAMMER AS P
		INNER JOIN SOFTWARE AS S ON P.PNAME=S.PNAME
		INNER JOIN STUDIES AS ST ON P.PNAME=ST.PNAME
where s.SCOST = (select max(scost) from SOFTWARE)

--100. What is the AVG salary for those whose software sales is more than 50,000/-.
Select  AVG(Salary) 
		from PROGRAMMER P
		INner join SOFTWARE S on P.PNAME = S.PNAME
		WHERE (Scost*SOLD) > 50000

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
Select  S.PNAME,
		ST.INSTITUTE,
		Count(DEVELOPIN),
		ST.[COURSE FEE]
		FROM Software as S
		Inner join STUDIES as ST on S.PNAME=ST.PNAME
		WHERE [COURSE FEE] = (Select MIN([COURSE FEE]) from STUDIES)
		Group by S.PNAME, INSTITUTE, [COURSE FEE]

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
SELECT  S.PNAME,
		COUNT(S.TITLE) as 'Packages Developed',
		ST.INSTITUTE
		FROM SOFTWARE S
		INNER JOIN STUDIES ST ON S.PNAME = ST.PNAME
		WHERE S.DCOST = (SELECT MIN(DCOST) FROM SOFTWARE)
		Group by S.PNAME, ST.INSTITUTE


--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT  P.Pname,
		Count(S.DEVELOPIN) as 'Packages Developed'
		FROM SOFTWARE AS S
		INNER JOIN PROGRAMMER AS P ON P.PNAME=S.PNAME
Where P.GENDER='F' AND P.SALARY>(Select MAX(P.SALARY) From PROGRAMMER as P Where Gender='M')
Group BY P.PNAME



--104. How many packages are developed by the most experienced programmer form BDPS.
Select  P.PNAME,
		P.DOB,
		P.DOJ,
		ST.Institute,
		Count(S.DEVELOPIN) as 'Packages Developed'
		From PROGRAMMER as P
		Inner JOIN Software as S on P.PNAME=S.PNAME
		Inner Join STUDIES as ST on P.PNAME=ST.PNAME
		Where ST.INSTITUTE= 'BDPS'
		Group BY P.PNAME, P.DOB, P.DOJ, ST.Institute
		Order BY P.DOJ

--105. List the programmers (form the software table) and the institutes they studied.
Select  S.PNAME,
		ST.Institute
		From SOFTWARE as S
		inner join STUDIES as ST on S.PNAME = ST.PNAME


--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
SELECT PROF, COUNT(*) AS Num_Programmers, SUM(Packages) AS Total_Packages
FROM (
    SELECT PROF1 AS PROF, 1 AS Packages FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 AS PROF, 1 AS Packages FROM PROGRAMMER
) AS T
GROUP BY PROF
ORDER BY Total_Packages DESC;


--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
Select  P.Pname as 'Progammers Name',
		Count(S.DEVELOPIN) as 'Packages developed'
		From Programmer as P
		Inner Join Software as S on P.PNAME=S.PNAME
		Group BY P.PNAME