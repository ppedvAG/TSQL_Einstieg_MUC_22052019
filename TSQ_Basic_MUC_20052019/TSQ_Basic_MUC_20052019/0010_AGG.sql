--AGGREGATE

--SUM(), MIN(), MAX(), COUNT, AVG()

select count(*) from customers --91

select * from customers

select count(region) from customers --31--NULL Werte können nicht gezählt werden

select count(orderid) from orders
select count(*) from orders

--Wieviele Kunden gibt es pro Land in Tab Customers?


select country, count(*) from customers
group by country


select country,city, count(*) from customers
group by country,city

--wieviel Frachtkosten hatte jeder Kunde?
--orders (freight, customerid)

select customerid, sum(freight) from orders
group by customerid

select * from [order details]

select orderid, sum(unitprice*quantity) as RngSumme
from [order details]
group by orderid

--welcher Angestellte war der beste??
--höchster Umsatz!!


select top 1 lastname, sum(unitprice*quantity) 
from 
	employees e inner join orders o on o.employeeid = e.employeeid
				inner join [order details] od on od.orderid = o.orderid
group by lastname
order by 2 desc

--Sicht ;-)
select top 1 lastname, sum(Possumme) from kundeumsatz
group by lastname order by 2 desc

--Liste
--des besten und schlechtesten Kunden
--gemessen an Umsatz

select top 1 companyname, sum(possumme) as Umsatz from kundeumsatz
group by companyname
order by Umsatz desc
UNION --MIST!!
select top 1 companyname, sum(possumme) as Umsatz from kundeumsatz
group by companyname
order by Umsatz asc



select top 1 companyname, sum(possumme) as Umsatz 
into #t1
from kundeumsatz
group by companyname
order by Umsatz desc

select top 1 companyname, sum(possumme) as Umsatz 
into #t2
from kundeumsatz
group by companyname
order by Umsatz asc

select * from #t1
union all
select * from #t2


--mit einer temp Tabelle
select top 1 companyname, sum(possumme) as Umsatz 
into #tXYZ
from kundeumsatz
group by companyname
order by Umsatz desc

insert into #txyz
select top 1 companyname, sum(possumme) as Umsatz 
from kundeumsatz
group by companyname
order by Umsatz asc

select * from #txyz






select * from 
(
	select top 1 companyname, sum(possumme) as Umsatz 
	from kundeumsatz
	group by companyname
	order by Umsatz desc
) t1
UNION ALL
(
	select top 1 companyname, sum(possumme) as Umsatz 
	from kundeumsatz
	group by companyname
	order by Umsatz asc
) t2

--Oder alles in eine Tabelle

select  
		companyname, sum(possumme) as Umsatz ,
into #results
from kundeumsatz
group by companyname
order by Umsatz desc

insert into #results
select  companyname, sum(possumme) as Umsatz ,
from kundeumsatz
group by companyname
order by Umsatz asc

select * from #results order by umsatz desc
select * from #results order by umsatz asc

--Alternative
select  companyname, sum(possumme) as Umsatz ,
			row_number() over (order by sum(possumme) )as Rang
	--into #tx
	from kundeumsatz	
	group by companyname
	order by Umsatz asc

	select * from #tx
	where rang = (select max(rang) from #tx)
			or
			rang = (select min(rang) from #tx)



--MIN MAX AVG
--durchschnittliche Frachtkosten in Orders

select avg(freight), Min(freight), max(freight) from orders

--wie finde ich die Zeilen aus Orders, deren Frachtkosten unter 
--dem Schnitt liegen

--error
select avg(freight)  from orders
where avg(freight) < 50

select sp, sp, agg
from tab
where sp < ..
group by sp, sp having agg > 

--Das Having ist das where des group by
--im Having sollten nur AGG stehen
--alles andere kann im Where gefiltert werden
--Aliase aus dem SELECT funktionieren nicht im having

select country , count(*) as Anzahl
from customers
group by country having count(*) > 10


---Alle Bestellungen, deren Frachtkosten unter dem Schnitt liegen?

select avg(freight) from orders

select * from orders 
	where freight > (select avg(freight) from orders)

--wie hoch ist pro Bestellung, die Abweichung vom Schnitt
select orderid , freight from orders


select orderid , freight - (select avg(freight) from orders),
			(select avg(freight) from orders)
from orders





--69
select 
		country, city , count(*)
from 
	customers
group by 
		country, city 

--91
select 
		country, city , count(*)
from 
	customers
group by 
		country, city 
with rollup


--160
select 
		country, city , count(*)
from 
	customers
group by 
		country, city 
with cube order by 1, 2,3


-----
--OLAP Datenwarehouse
--SQL: Analysis Services

--
select 
		country, city ,region ,count(*)
from 
	customers
group by 
		country, city , region
with rollup





