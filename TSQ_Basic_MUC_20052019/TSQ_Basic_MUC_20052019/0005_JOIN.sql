--JOIN

select Spalten...
from 
	TAB1 A inner join TAB2 B on A.SP1 = B.SP2

select * from 
	customers c inner join orders o 
				ON c.customerid = o.customerid
where
	c.country = 'UK'

--Welche Bestellungen verwalteten die Angestellten aus
--USA---







--Mehr Tabellen 

select * 
from 
	TAB1 A inner join TAB2 B ON a.Sp1 = b.sp1
		   INNER JOIN TAB3 C ON c.sp1 = b.sp2
		   INNER JOIN TAB4 D ON d.spx = c.sp3
		   INNER JOIN TAB5 E on e.sp3= c.sp5


--Welche Angestellte hatte Geschäftsbeziehungen mit welcher Firma


select c.companyname, e.lastname
from 
	customers c inner join orders o on c.customerid = o.customerid
				inner join employees e ON e.employeeid = o.EmployeeID


--Liste aller Kunden und deren Produkte, die sie kauften

--Firma , Produktnamen
--sortiert nach Firma, Produktname

select 
		c.CompanyName, p.ProductName
from 
		customers c 
				INNER  join orders o		    on c.customerid = o.customerid 
				inner join  [Order Details] od  ON o.OrderID = od.OrderID
				INNER JOIN  products p		    ON p.ProductID = od.ProductID

--Welcher Angstellte hat welche Produkte verkauft

select 
	lastname, productname		
from 
		orders o inner join [order details] od on o.orderid = od.orderid
				inner join  products p         on p.productid = od.productid
				inner join  employees e        on e.employeeid = o.employeeid
			











