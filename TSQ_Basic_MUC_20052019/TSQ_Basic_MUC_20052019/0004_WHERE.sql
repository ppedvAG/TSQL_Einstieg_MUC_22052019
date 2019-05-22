--WHERE

use northwind;
GO

--where filtert Datenzeilen
----> Performance

select *
from 
where --immer nach dem From
...
order by;
GO


--Vergleichsoperatoren
-- = , < > , <= , >= , !=, <>, like ,  in , between
--aber auch Wildcards bei like möglich:
	--	% beliebig viele Zeichen
	--	_ genau ein unbekanntes Zeichen


-- = exakte Übereinstimmung

select * from orders
	where orderid = 10249

--nicht exakt: like
--wildcard für beliebige Zeichen: % .. auch 0 zeichen

--alle Kunden, die aus einem Land kommen, das mit G beginnt

select * from customers
	where country like 'U%'

--dagegen
--0 Zeilen ...
select * from customers
	where country = 'U%'

--wieviele Kunden gibt es, die am Ende des Landes ein A haben..
select * from customers
where
		country like '%A'



select * from orders
where 
	freight >=0 and freight <= 100

--bessere Schreibweise: between.. Grenzen sind inklusive
select * from orders
where
	freight between 0 and 100 -->= .... <=

--alle Bestellungen, deren Buttofrachtkosten unter 10 liegen
--Annahme: freight = Netto.. Mwst = GER

--Tipp.. immer die Funktion im where von der Spalte wegbringen
--Variante 1:
select * from orders
	where
		freight < 10/1.19


--Variante 2:
select orderid, freight as Nettofracht, freight * 1.19 as Brutto
 from orders
	where
		freight * 1.19 < 10 


--Suche nach allen Kunden aus USA, UK und Italy

select * from customers
where
	country ='USA'  OR country = 'UK' or country = 'Italy'


--besser mit in:..vergl mit Liste
select * from customers
where
	country in('USA','UK','Italy')

--select * from orders
--alle Bestellungen, die der Ang Nr 5 gemanagt hat oder über Shipvia
--3 liefen und mehr als 100 Frachtkosten hatten


--wo sind deine fu*** Klammern
select employeeid, shipvia, freight
from orders
where
		employeeid=5
		or
		(shipvia = 3
		and
		freight > 100)

--mit anderen KLammern anderes Ergebnis
select employeeid, shipvia, freight
from orders
where
		(employeeid=5
		or
		shipvia = 3)
		and
		freight > 100


--alle Kunden, die im Namen ein y haben, darf abere weder vorne
--noch hinten sein...

--Verneinen einer Bedingung
-- <>   != 
--not between, not like , not in

select * from customers
where 
	companyname like '%y%' 
	and 
	companyname not like 'y%'
	and 
	companyname not like '%Y'

--  _ Wildcard für genau ein unbekanntes  Zeichen

select * from customers where customerid like 'A%A_R'

--
--Suche alle Kunden deren vorletzter Buchstabe ein L ist...
select * from customers where customerid like '%L_'

--Suche alle Kunden (companyname) , die ein % im Namen haben
select * from customers
	where 
		companyname like '%%%'       --boah.. eh??

--[] machen eine Wertebereich
select * from [order details]

select * from customers
	where 
		companyname like '%[%]%'

--[] stehen für ein Zeichen genau und können 
--tats. Wertebereiche abdecken

--zB alle Kunden aus einem Land, das mit a,b,c,d,f,g,h beginnt

select * from customers where country like '[a-h]%'

--wie könnte ein PIN Suche sein
--PIN  like  bzw not like '[0-9][0-9][0-9][0-9]'


--Suche alle Kunden, die
--im Firmennamen ein e haben , der 2te Buchstabe ein u ist
--und am Ende einen Buchstaben zwischen b-g haben

select * from customers
where
	companyname like '_u%e%[b-g]' -- 1  Treffer  Hungry Coyote


--Suche nach '  ;-) ''

select * from customers
where
	companyname like '%''%'


--alle Ang, die im Rentenalter sind: 65 Jahre
select * from employees

select datediff(dd, '1.1.2019', getdate())
--Ausgabe: Lastname, Birtdate, Alter

select lastname, birthdate 
--	datediff(yy, birthdate, getdate())   as AlterinJahre
from 
	employees
where
	datediff(yy, birthdate, getdate()) >=65

--Bestelllungen aus dem Jahre 1997
select * from orders --orderdate --408


select orderid, orderdate
		, datepart(yy,orderdate) as Jahr1
		, year (orderdate) as Jahr2
from orders
where 
		--datepart(yy,orderdate) =1997
	orderdate between '1.1.1997' and '31.12.1997'--
	--orderdate >= 1.1.    orderdate <= 31.12

	--1.1.1997 00:00:00.000 
	--31.12.1997 00:00:00.000


select orderid, orderdate
		, datepart(yy,orderdate) as Jahr1
		, year (orderdate) as Jahr2
from orders
where 
		--datepart(yy,orderdate) =1997
	orderdate between '1.1.1997' 
			and '31.12.1997 23:59:59.999'--
order by 2 desc




	













select * from orders 
where
--year(orderdate) = 1997
orderdate between '1.1.1997' AND '31.12.1997 23:59:59.999'

select * from orders where year(orderdate) = 1997
order by orderdate desc


















	







--
