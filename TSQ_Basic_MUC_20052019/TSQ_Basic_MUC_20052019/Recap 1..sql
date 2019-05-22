/*
SELECT 
		Mathe as ALIAS,
		F(),
		*, --alle Spalten der From Tabellen
		'TXT', ZAHL
		Spalte,
		(select getdate()) --Unterabfragen--ein Wert!!
FROM
	Tabellenartiges A (Tabellen, Sicht, (Select ...)
	INNER|RIGHT| LEFT JOIN Tabelle  B ON A.SP1=B.SP2
WHERE
	SP > < >= <= <> !=  like Between in
	AND OR
	f(SP)> f(wert)
	SP > (select ...) auch nur ein Wert
ORDER BY
	SP asc|desc, SP2 asc|desc, ALIAS asc|desc,[.. 1,2,3,4... 
*/



--Welche Bestellungen gibt es mit mehr als 50 Frachtkosten
--und vom AngNr 2 gemanaged wurden

select * from orders
where 
		freight > 50 and employeeid = 2

--Anzeige BestellNr, Freight, AngId...und FamName des Ang

select    Orderid
		, freight
		, e.Employeeid
		, Lastname  as FamName 
from 
		orders o inner join employees e


--JOIN
--Übersicht aller Firmen , Länder, Städte der Customers, 
--Orderid und freight
--die per Shipvia 1 (orders) Waren bezogen haben

--Insofern 


select 
		c.CompanyName, c.Country, c.City, --alle Kundenspalten
		o.orderid, o.freight --alle Ordersspalten
from 
	customers c 
			inner join orders o on c.customerid = o.customerid
where
		freight > 50 and o.employeeid = 2

---LEFT RIGHT


--Left JOIN wie Inner join
--Welche Kunden haben nix bestellt?
--Abfrage auf NULL Wert mit is null
select * from orders where shipregion is null


select companyname, orderid 
from 
	customers c left join orders o
		on c.CustomerID = o.CustomerID
where 
	orderid is null


--das gleiche mit einem right join


select companyname, orderid 
from 
	orders o right join customers c 
		on c.CustomerID = o.CustomerID
where 
	orderid is null


--CROSS
select * from employees cross join customers

---Ausgabe aller potentiellen Stellvertreter
--man kann nicht sich selber vertreten
select	  e.lastname, e.city
		, e2.city, e2.lastname
from 
		employees e inner join employees e2
					ON e.city=e2.city

where 



		e.lastname != e2.lastname
order by 
		e.city,e.lastname








			

