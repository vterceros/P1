
-- A

SELECT * FROM dbo.ITEM i
SELECT * FROM dbo.SHIPMENT s
SELECT * FROM dbo.SHIPMENT_ITEM si

-- B

SELECT s.ShipmentID, s.ShipperName, s.ShipperInvoiceNumber FROM dbo.SHIPMENT s

-- C

SELECT s.ShipmentID, s.ShipperName, s.ShipperInvoiceNumber FROM dbo.SHIPMENT s WHERE s.InsuredValue > 10000

-- D

SELECT s.ShipmentID, s.ShipperName, s.ShipperInvoiceNumber FROM dbo.SHIPMENT s WHERE s.ShipperName LIKE 'AB%'

-- E

SELECT s.ShipmentID, s.ShipperName, s.ShipperInvoiceNumber, s.ArrivalDate FROM dbo.SHIPMENT s WHERE MONTH(s.DepartureDate) = 12

-- F

SELECT s.ShipmentID, s.ShipperName, s.ShipperInvoiceNumber, s.ArrivalDate FROM dbo.SHIPMENT s WHERE DAY(s.DepartureDate) = 10

-- G

SELECT MAX(s.InsuredValue) "MaximumInsuredValue",MIN(s.InsuredValue) "MinimunInsuredValue" FROM  dbo.SHIPMENT s

-- H

SELECT AVG(s.InsuredValue) "AverageInsuredValue" FROM  dbo.SHIPMENT s

-- I

SELECT COUNT(*) "CountNumberShip" FROM  dbo.SHIPMENT s


-- J

SELECT i.ItemID,
       i.Description,
       i.Store,
       i.LocalCurrencyAmount * i.ExchangeRate "USCurrencyAmount"
FROM dbo.ITEM i;

-- K

		SELECT 
			i.City, 
			i.Store
     	FROM dbo.ITEM i
		GROUP BY i.City, i.Store

-- L 

	SELECT 
		i.Store,
		i.City,
		COUNT(i.ItemID) "count"
	FROM dbo.ITEM i
	GROUP BY i.Store, i.City

-- M 

	
	SELECT s.ShipmentID, s.ShipperName, s.DepartureDate 
	FROM  dbo.SHIPMENT s	
	WHERE s.ShipmentID IN (SELECT si.ShipmentID FROM dbo.SHIPMENT_ITEM si WHERE si.Value >= 1000 ) 
	ORDER BY s.ShipperName ASC , s.DepartureDate DESC
		
	
-- N

	SELECT 
		s.ShipperName,
		s.ShipmentID,
		s.DepartureDate
	FROM  dbo.SHIPMENT_ITEM si, dbo.SHIPMENT s	
	WHERE si.Value >= 1000
	ORDER BY s.ShipperName ASC	, s.DepartureDate DESC

-- O

	SELECT DISTINCT
		s.ShipperName,
		s.ShipmentID,
		s.DepartureDate
	FROM dbo.SHIPMENT s
	JOIN dbo.SHIPMENT_ITEM si ON s.ShipmentID = si.ShipmentID
	WHERE si.ItemID IN (SELECT i.ItemID FROM dbo.ITEM i WHERE  i.City = 'Singapore')
	ORDER BY s.ShipperName ASC, s.DepartureDate DESC	


-- P

	SELECT DISTINCT
		s.ShipperName,
		s.ShipmentID,
		s.DepartureDate
	FROM dbo.SHIPMENT s, dbo.SHIPMENT_ITEM si,dbo.ITEM i
	WHERE i.City = 'Singapore'
	AND s.ShipmentID = si.ShipmentID
	AND si.ItemID = i.ItemID
	ORDER BY s.ShipperName ASC, s.DepartureDate DESC


-- Q

	SELECT DISTINCT
		s.ShipperName,
		s.ShipmentID,
		s.DepartureDate
	FROM dbo.SHIPMENT s
	INNER JOIN dbo.SHIPMENT_ITEM si ON si.ShipmentID = s.ShipmentID
	INNER JOIN dbo.ITEM i ON i.ItemID = si.ItemID
	WHERE i.City = 'Singapore'
	ORDER BY s.ShipperName ASC	, s.DepartureDate DESC
		

-- R

	SELECT 
		s.ShipperName,
		s.ShipmentID ,
		s.DepartureDate,
		i.Quantity,
		i.LocalCurrencyAmount
	FROM dbo.SHIPMENT s
	JOIN dbo.SHIPMENT_ITEM si ON s.ShipmentID = si.ShipmentID
	JOIN dbo.ITEM i ON si.ItemID = i.ItemID
	WHERE si.ItemID IN (SELECT i.ItemID FROM dbo.ITEM i WHERE i.City = 'Singapore')
	ORDER BY s.ShipperName ASC, s.DepartureDate DESC

