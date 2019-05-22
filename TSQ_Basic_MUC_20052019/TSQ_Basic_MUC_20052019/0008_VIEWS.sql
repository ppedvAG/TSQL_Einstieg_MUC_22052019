/*
Sichten sind gemerkte abfragen
..werden wie Tabellen behandelt
..haben keine Daten

create view Namedersicht
as
Select .....

Sinn?

Um "Geschreibe" zu sparen...
Komplexe Statements wiederverwendbar

aus Rechteperspektive.. Recht auf Sicht, 
--aber auf die Tab verweigern

berechnete Felder müssen benannt werden --> Alias

INS UP DEL auf Sicht möglich
*/

select * from #t1
--KundenEU

create view KundenEU
as
select * from customers
where 
	country in 
	('UK','Greece','Germany', 'Austria', 'Italy', 'France')

select * from kundeneu


--eine Sicht, die uns das (so gut wie alles) zurückgibt

Customerid, companyname, country, city --customers
orderid, freight, employeeid  --Orders
Lastname  --employees
Quantity, Unitprice, Productid --order details
Productname --products

create view KundeUmsatz
as
select		
	  c.Customerid, companyname, c.country, c.city --customers
	, o.orderid, freight, o.employeeid  --Orders
	, e.Lastname  --employees
	, od.Quantity, od.Unitprice, od.Productid --order details
	, p.Productname --products
from 
	customers c 
		inner join orders o on c.customerid = o.customerid
		inner join [order details] od on od.orderid = o.orderid
		inner join employees e on e.employeeid = o.employeeid
		inner join products p on p.productid = od.productid	



--welcher Kunde hat welche Produkte gekauft..
--wow ..easy
select distinct companyname, productname from kundeumsatz

sp_help 'Kundeumsatz'


select distinct companyname , city from kundeumsatz
where country like 'U%'


select  companyname , city from customers
where country like 'U%'



--CREATE... DROP ... ALTER

CREATE VIEW... ALTER VIEW... drop view

--Idee Possumme
alter view KundeUmsatz
as
select		
	  c.Customerid, companyname, c.country, c.city --customers
	, o.orderid, freight, o.employeeid  --Orders
	, e.Lastname  --employees
	, od.Quantity, od.Unitprice, od.Productid --order details
	, od.quantity*od.unitprice as PosSumme --auch berechnete Felder
	, p.Productname --products
from 
	customers c 
		inner join orders o on c.customerid = o.customerid
		inner join [order details] od on od.orderid = o.orderid
		inner join employees e on e.employeeid = o.employeeid
		inner join products p on p.productid = od.productid	


		select * from kundeumsatz