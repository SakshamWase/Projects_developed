SELECT * FROM [Person].[EmailAddress]
SELECT * FROM [Person].[PersonPhone]
SELECT * FROM [Person].[PhoneNumberType]
SELECT * FROM [Person].[BusinessEntity]
SELECT * FROM [Person].[Address]
SELECT * FROM [Person].[AddressType]

1. 
SELECT E.*, B.EmailAddress, C.PhoneNumber, D.Name 
FROM [Person].[BusinessEntity] AS A
LEFT JOIN [Person].[EmailAddress] AS B ON A.BusinessEntityID = B.BusinessEntityID
LEFT JOIN [Person].[PersonPhone] AS C on A.BusinessEntityID = C.BusinessEntityID
LEFT JOIN [Person].[PhoneNumberType] AS D ON C.PhoneNumberTypeID = D.PhoneNumberTypeID
LEFT JOIN [Person].[Person] AS E ON A.BusinessEntityID = E.BusinessEntityID

2. 
SELECT * FROM [Sales].[SalesOrderHeader]
WHERE OrderDate >= '2011-05-01 00:00:00.000' AND OrderDate <= '2011-05-31 00:00:00.000'

3. 
SELECT * FROM [Sales].[SalesOrderDetail] as A
left join [Sales].[SalesOrderHeader] AS B ON A.SalesOrderID = B.SalesOrderID
WHERE B.OrderDate >= '2011-05-01 00:00:00.000' AND B.OrderDate <= '2011-05-31 00:00:00.000'

4.
SELECT SUM(A.LineTotal) AS TOTAL_MAY_SALES FROM [Sales].[SalesOrderDetail] as A
left join [Sales].[SalesOrderHeader] AS B ON A.SalesOrderID = B.SalesOrderID
WHERE B.OrderDate >= '2011-05-01 00:00:00.000' AND B.OrderDate <= '2011-05-31 00:00:00.000'

5
SELECT MONTH(B.OrderDate) AS [MONTH], SUM(A.LINETOTAL) AS [TOTAL SALES] FROM [Sales].[SalesOrderDetail] as A
left join [Sales].[SalesOrderHeader] AS B ON A.SalesOrderID = B.SalesOrderID
GROUP BY MONTH(B.OrderDate)
ORDER BY SUM(A.LINETOTAL)

6
SELECT * FROM [Sales].[SalesOrderDetail] WHERE rowguid = 'D4B6BBE9-DAF2-4887-8180-F5F433842E9B'
SELECT * FROM [Sales].SalesOrderHeader
SELECT * FROM [Sales].SalesPerson
SELECT * FROM Person.[Person]
WHERE FirstName = 'GUSTAVO' AND LastName = 'Achong'
SELECT * FROM [Person].[BusinessEntity]
WHERE BusinessEntityID = '291'

SELECT * FROM [Sales].[SalesPersonQuotaHistory]



