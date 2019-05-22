--DISTINCT  TOP

/*
Distinct filtert aus dem Ergebnis doppelte Zeilen heraus
select distinct......



*/

select distinct country from customers --ohne distinct 91.. mit 21

select distinct country, customerid from customers --91

--TOP

--aus der Ergebnismenge nur die ersten x sehen
-- x Zeilen
-- x Prozent


select top 10 * from orders

--welche sind eigtl die ersten ??

--der TOP ist eigtl immer mit einem order by zu verknüpfen
--wird kein order by angeben werden die Zeilen so ausgegen, wie sie physikalisch auf der PLatte liegen

select top 10 * from orders order by freight desc

--2 Ergebnisse
-- bester und schlechtester Kunde gemessen an Frachtkosten
--hohe Frachtkosten sind schlecht

--und dann ein Ergebnis daraus basteln
select top 1 customerid, freight from orders order by freight desc


select top 1 customerid, freight from orders order by freight asc


--ein Ergebnis
select * from 
	(
		select top 1 customerid, freight from orders order by freight desc
	) t1
UNION ALL
select * from 
	(
		select top 1 customerid, freight from orders order by freight asc
	) t2


select * from orders order by freight


--Wilde 13
--Liste aller top 13 Kunden gemessen an Fracht (weniger ist bessser)
--Customerid, freight.. doppelte Customerids ignorieren wir

select  top 13 with ties  customerid
customerid, freight from orders order by freight asc

--auch Prozent möglich
select top 13 percent * from orders order by freight desc

--Problem!!!

--SUBselect

select * from (select * from customers) t1


---Tabellen  mit ähnlichen Inhalten vergleichen
--Spielwiese:

select customerid, country, city, companyname
into kunden
from Customers
	where country in ('USA','UK','Italy','France')

select * from kunden

--1 Änderung in Kunden
update kunden set city = 'Liverpool' where customerid = 'AROUT'

-- 1 Neuer DS in Kunden
insert into kunden
select 'PPEDV', 'Germany','München','ppedv AG'

--identische Kundendatensätze
select customerid, country, city, companyname
 from kunden

select customerid, country, city, companyname
from customers


--Theorie Nr1: JOIN!

select * from TAB1 A inner JOIN TAB2 B
	ON A.Sp1=B.SP1 AND A.SP2=B.SP2 AND A.SP3 = B.Sp3

--Besser: INTERSECT
--wie UNION.. Ergebniszeilen werden beobachtet

select customerid, country, city, companyname
from customers
intersect
select customerid, country, city, companyname
 from kunden


 --Reihenfolge spielt keine Rolle
select customerid, country, city, companyname
from Kunden
intersect
select customerid, country, city, companyname
 from customers

 --jetzt 34..mit City 33

select customerid, country
from customers
intersect
select customerid, country
 from kunden


 --Hmmm und die unterschiedlichen?

 --alle die in Customers sind, aber nicht in Kunden

select customerid, country, city, companyname
from customers
except
select customerid, country, city, companyname
 from kunden

--die Kunden zuerst , ander Menge

select customerid, country, city, companyname
from Kunden
except
select customerid, country, city, companyname
 from customers

 
select customerid, country, companyname
from Kunden
except
select customerid, country,  companyname
 from customers
 --except

 --Welche Länder gibts in Customers, 
 --die nicht in Employees sind


 select country   from customers
 except
 select country   from employees
