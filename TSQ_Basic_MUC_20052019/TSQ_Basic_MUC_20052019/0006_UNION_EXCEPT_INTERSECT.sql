--UNION

/*
zwei oder mehr Abfrageergebnisse zu einem zusammenfassen
Bedingungen: 
		gleich viele Spalten
		kompatible Datentypen

UNION filtert aus dem Ergebnis doppelte Zeilen heraus
UNION ALL sucht nicht nach doppelten Zeilen

UNION auch mehrfach verwendbar

verwende immer dann UNION ALL, wenn du weisst, dass es keine doppelten geben kann




*/

select 100, NULL
UNION
select 200, 300

select 100
UNION
select 'A' ---error


--alle  Länder der Kunden und Angestellten

--aber nur 21 Datensätze??
select country, 'K' from customers --91
UNION -- ALL
select country, 'A' from employees --9

select 'A'
UNION ALL
SELECT 'A'



--ABC
--
select * from orders
/*
wenn fracht > 50 dann C Kunde
wenn fracht unter 10 liegt dann A Kunde
der Rest ist B Kunde

Customerid, freight, Bewertung (A B oder C)


*/

select customerid, freight, 'A' as Kundentype
from orders where freight < 10
UNION ALL
select customerid, freight, 'C'
from orders where freight > 50
UNION ALL
select customerid, freight, 'B'
from orders where freight between  10 and 50