declare @customer table
(
CustomerID int identity(1, 1),
CustomerName nvarchar(100)
)
insert @customer values ('Customer A')
insert @customer values ('Customer B')
insert @customer values ('Customer C')
declare @customerOperation table
(
OrderID int identity(1, 1),
CustomerID int,
TotalAmount int,
EventDate datetime
)
insert @customerOperation values (1, 1000, '2010-01-24')
insert @customerOperation values (1, 2300, '2010-03-26')
insert @customerOperation values (1, 300, '2010-05-18')
insert @customerOperation values (1, 12000, '2011-03-28')
insert @customerOperation values (1, 4000, '2011-07-05')
insert @customerOperation values (1, 7500, '2012-01-03')
insert @customerOperation values (2, 4000, '2010-01-24')
insert @customerOperation values (2, 5000, '2010-03-26')
insert @customerOperation values (2, 1000, '2010-05-18')
insert @customerOperation values (2, 2400, '2011-03-28')
insert @customerOperation values (2, 500, '2011-07-05')
insert @customerOperation values (2, 3000, '2012-01-03')
insert @customerOperation values (3, 3200, '2010-01-24')
insert @customerOperation values (3, 300, '2012-05-03')
select * from @customer
select * from @customerOperation order by CustomerID, EventDate desc;		

SELECT 
C.CustomerID,
C.CustomerName,
V.Avarage
FROM
@customer C
LEFT JOIN 
	(	SELECT  
		CustomerID,
		AVG(TotalAmount) AS Avarage
		FROM	(
						SELECT CustomerID,
							   TotalAmount,
							   ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY EventDate DESC) AS RN
						FROM @customerOperation
				) AS T	
		WHERE RN <= 3
		GROUP BY CustomerID
		HAVING COUNT(CustomerID) >= 3
	) AS V 
ON C.CustomerID = V.CustomerID





