SELECT * FROM ORDERS

-------1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

SELECT MIN(AMOUNT) AS 'MINIMUM AMOUNT', MAX(AMOUNT) AS 'MAXIMUM AMOUNT', AVG(AMOUNT) AS 'AVERAGE AMOUNT' FROM ORDERS

-------2. Create a user-defined function, which will multiply the given number with 10

CREATE FUNCTION MULTIPLY_10 (@NUM AS INT)
RETURNS INT
AS
BEGIN
RETURN(
@NUM*10
)
END

SELECT DBO.MULTIPLY_10(10)

-------3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value

SELECT CASE 
WHEN 100<200 THEN 'LESS THAN 200'
WHEN 100>200 THEN 'GREATER THAN 200'
ELSE 'EQUAL TO 200'
END