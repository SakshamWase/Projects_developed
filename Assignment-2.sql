---- Answer 1 ---- Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
CREATE TABLE CUSTOMER (CUSTOMER_ID INT, FIRST_NAME VARCHAR(50), LAST_NAME VARCHAR(50), EMAIL VARCHAR(50) UNIQUE, ADDRESS NVARCHAR(200), CITY VARCHAR(50), 
						STATE VARCHAR(50), ZIP INT)
Select * from Customer

----Answer 2 ------Insert 5 new records into the table
INSERT INTO Customer Values (1,'RAHUL','SAHRMA','RS@GMAIL.COM','ADRASH NAGAR','MUMBAI','MAHARASHTRA',460001)
INSERT INTO CUSTOMER VALUES (2,'RAJ','SHARMA','RJ@GMAIL.COM','SUBHASH NAGAR','MUMBAI','MAHARASHTRA',460002)
INSERT INTO CUSTOMER VALUES (3,'SURAJ','VERMA','SV@GMAIL.COM','Cannaught Place','DELHI','DELHI',420001)
INSERT INTO Customer Values (4,'Dheeraj','Gupta','DG@GMAIL.COM','Sarojani NAGAR','Delhi','Delhi',420003)
INSERT INTO Customer Values (5,'Shah Rukh','Khan','SRK@GMAIL.COM','Bandra','MUMBAI','MAHARASHTRA',460004)


----Answer 3 -----Select only the ‘first_name’ & ‘last_name’ columns from the customer table
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER


----Answer 4 ----- Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
INSERT INTO Customer Values (6,'Goku','Saiyyan','GS@GMAIL.COM','San Jose','California','America',520004)
INSERT INTO Customer Values (7,'Gogeta','Khan','GK@GMAIL.COM','San Jose','California','America',520004)

SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'G%'