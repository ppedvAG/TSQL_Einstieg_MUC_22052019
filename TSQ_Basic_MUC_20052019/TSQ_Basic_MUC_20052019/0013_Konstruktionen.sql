--Konstruktionen

--IF, WHILE, CASE

--WHILE Schleife

--WHILE (BEDINUNG)  --solange wahr
--	BEGIN
--		CODE
--	END

declare @i as int = 1

while @i < 10
	begin
		select @i
		set @i=@i+1  --am Ende 10
		continue --springt zum Schleifeneinstieg
		break --hört sofort auf.. Schleife is doad!
	end

	--Bedinung in Form von Abfragen

while (select count(*) from Tabelle) > 100 --AND OR
	BEGIN
		code
	END

--select * into o2 from orders

select max(freight) from o1

--erhöhe die Frachtkosten um 10% Schritte
--bis der Max Frachtkostenwert 2000 erreicht hat

while (select max(freight) from o1) < 2000/1.1
	begin
		update o1 set freight*=1.1
	end


--IF-- wenn dann

IF 1=1 select 'A'  --wahr--> A
IF 1=0 select 'A'  -- falsch -- kein A

IF 1=1
	select 'A'
ELSE
	select 'B'

IF 1=0
	select 'A'
ELSE
	select 'B'

IF 10=10
	select 'A'
ELSE
	select 'B'
select 'C'
--A C

--aber wenn C zum Teil2 gehören soll

IF 10=10
	BEGIN
		select 'A'
	END
ELSE
	BEGIN
		select 'B'
		select 'C'
	END


--Natürlich kann in der IF Bedingung auch ein SELECT stehen
IF (Select count(*) from customers) < 100
	BEGIN 
		select 'weniger als 100'
	end
ELSE
	BEGIN
		select 'mehr als 100'
	END

--TAB o1
--AUFGABE: erhöhe die Frachtkosten um 10% wenn der schnitt 
--unter 100 liegt
--ansonsten senke um 5 %



--CASE WHEN
--Kann Daten der Ausgabe überschreiben
--es werden nicht die Daten sebst geändert
--IM SELECT stellt der CASE WHEN eine Spalte dar..

select country, city, 
		CASE
			when country = 'UK' then 'Wissen es selber nicht'
		END as EUorNOTEU
from customers

select country, city, 
		CASE
			when country = 'UK' then 'Wissen es selber nicht'
			when country in ('Austria','Germany') then 'EU'
			else 'NOTEU'
		END as EUorNOTEU
from customers

--ABC ..(statt Union mit CASE)
--wenn Freight< 10 dann ist das ein A Kunde
--wenn die Fracht > 100 ist, dann ist es C Kunde
--alle andere sind B Kunden

select 
	orderid, freight,
	case
		when freight < 10 then 'A Kunde'
		when freight > 100 then 'C Kunde'
		else 'B Kunde'
	end
from orders

--und hier nochmal der UNION dafür

select customerid, freight, 'A' as Kundentype
from orders where freight < 10
UNION ALL
select customerid, freight, 'C'
from orders where freight > 100
UNION ALL
select customerid, freight, 'B'
from orders where freight between  10 and 100



