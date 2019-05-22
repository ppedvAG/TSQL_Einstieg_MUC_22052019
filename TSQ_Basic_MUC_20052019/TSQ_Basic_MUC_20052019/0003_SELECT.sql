--SELECT 


SELECT --das was wir sehen
		Spalten,
		f(wert),
		f(Spalte),
		* --für alle Spalten der FROM Tabellen
		Zahl, 'TEXT',
		Mathe --ALIAS
FROM  (Tabellenartiges)
ORDER BY SP1 asc, SP2 desc, ALIAS asc, Spaltennummer desc






select 100, 'ABC' from orders --
select 100*200








--richtige DB?


use northwind;
GO

select * from customers

select * from orders

--* Wildcard für alle Spalten der FROM Tabellen

--bestimmte Spalten ausgeben
select orderid, customerid, freight from orders

select * from orders

--Funktionen um Spalte in Select 
select datepart(yy,orderdate) from orders

--Liste: Bestellnr, den Lieferdatum, erfordelichen Lieferdatum, und 
--evtl Verzögerung in Tagen

select 
		  orderid
		, shippeddate
		, requireddate
    	, datediff(dd,requireddate,shippeddate) 
from orders
order by 4 desc-- die 4te Spalte absteigend

--asc  oder desc
--sortieren per Spaltenname

select * from orders order by freight desc




select 
		  orderid
		, shippeddate
		, requireddate
    	, datediff(dd,requireddate,shippeddate) as Lieferverzoegerung
from orders
order by Lieferverzoegerung desc-- die 4te Spalte absteigend




