--Variablen

/*

Variablen haben immer ein @ vorne

@var: lokale Variable
	  Gültigkeitsdauer: solange ein Batch läuft (GO!!!)
	  Gültigkeitsbereich: nur dort wo der Batch läuft


@@var: globale Varibale
	  Gültigkeitsdauer: solange ein Batch läuft (GO!!!)
	  Gültigkeitsbereich: auch in anderen sessions


	


*/



declare @i as int = 0
select @i

--GO

select @@connections

select @@SERVERNAME
declare @i as int = 0;
select @i;
GO

---Arbeiten mit Variablen

--Variablen deklarieren: Name, Datentyp und Wert zuweisen
declare @var1 as int
set @var1 = 100

declare @var2 int, @var3 int = 100 --gleich hier Wert zuweisbar
set @var2= 10
Set @var3 = 200
select @var2, @var3

select count(*) from customers where country = 'UK'

declare @AnzahlUKKunden as int

select @AnzahlUKKunden = count(*) from customers 
	where country = 'UK'

select @AnzahlUKKunden

--Illegal!!!
select @AnzahlUKKunden = count(*), count(*) from customers 
	where country = 'UK'



--Welche Bestellungen haben Frachtkosten, die unter dem Schnitt
--der Frachtkosten liegen

declare @schnitt as money
select @schnitt=avg(freight) from orders

select @schnitt
select * from orders where freight < @schnitt


select * from orders
where freight < (select avg(freight) from orders)




















