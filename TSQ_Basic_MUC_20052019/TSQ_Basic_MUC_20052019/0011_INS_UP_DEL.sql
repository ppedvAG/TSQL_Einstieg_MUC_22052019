--INS --UP--DEL

--INSERT

--manuelles Einfügen

insert into tabelle (Sp1,Sp2,Sp3,Sp5)
Values
					(Wert1, wert, wert3, wert4)


select * from kundenEU

insert into kundenEU (customerid, companyname)
VALUES
					('pped1', 'ppedv AG und Kuckuck')

--auch mehr Datensätze
insert into kundenEU (companyname, customerid)
values
					('bebeedfau','pped2'),
					('bäbäedweh','pped3')

--man kann auch ohne ANgaben von Spalten
--DS einfügen..
insert into kundeneu
values
		(..,...,...,...,...,...,..)
--dann muss aber jede Spalte in der 
--exakten korrekten Reihenfolge (wie Tabelle)
--angegeben werden

----> Daten aus einer Quelle in Tabelle rein..
--insert into tab.. select...

insert into kundeneu (customerid, companyname)
select top 1 left(customerid,3)+'xx', companyname
from customers
where country = 'Venezuela'


insert into kundeneu (customerid, companyname)
select 'pped5', 'ppppeeeedddvv'

--Fügt einen Wert manuell ein und einen aus einer Tabelle

---

--Daten in eine nicht existente Tabelle
select ...into 

select sp, sp, sp 
into neutabelle  --!!!  vor dem From
from tabellex
where ..usw


select top 10 * into tabtop10orders from orders

select * from tabtop10orders

--select into from
--übernimmt Spaltennamen, 
--Datentypen und identity

--Spaltennamen erforderlich..Datentyp?
select	  10		as Sp1
		, 100000	as Sp2
		, 'abc'		as Sp3 --schätz auf varchar(3)
into Tabxy

sp_help 'tabxyz'


select	  10		as Sp1
		, 100000	as Sp2
		, convert(varchar(50),'abc'	)	as Sp3 --schätz auf varchar(3)
into Tabxyz



---UPDATE

--o1 Spielwiese
select * into o1 from orders


update tabelle set spalte = Wert
				where id = 10


update tabelle set spalte1 = Wert, Spalte2= Wert
				where id = 10

select top 1 * from o1

--erhöhe die Frachtkosten auf 40
update o1 set freight = 40
		where orderid = 10248

--einer Spalte den Wert einer (anderen) Spalte zuweisen
update o1 set freight = shipvia
		where orderid = 10 

--oder berechnen lassen
--erhöhe die Frachtkosten um 10% bei der Bestnr 10248 in o1
update o1 set		freight = freight*1.1
		  where 
					orderid = 10248

-- freight+=1  ---> freight = freight +1

begin tran
update o1 set shipvia = 100
	where orderid = 10248

select * from o1

rollback --fix draussen
commit --fix drin

----senke die Frachtkosten um 10
--bei allen o1 Datensätzen vom Ang Nr 3

--verwende TX
--Prüfe Ergebnis
--fixe das Ergebnis.. Commit

begin tran
select sum(freight) from o1 where employeeid = 3

update o1 set freight = freight -10
where employeeid = 3

select freight from o1 where employeeid = 3
commit --oder rollback

--update die Frachtkosten um +10% bei denen der Kunde
--aus Germany kam...

/*
1. Zuerst den Select, der uns die betroffene Zeilen anzeigt
2. Formuliere dein Update..ohne Join etc.. nur die SPalte aktualisieren
3. kopiere dein Select direkt darunter
4. vor dem From ein Zeilenumbrich, so dass der Select alleine steht
5. zwei -- vor dem select ..auskommentieren
*/
--1.
select orderid, freight, country from 
		customers c 
			inner join orders o	on c.customerid = o.customerid
where 
		 c.country = 'Germany'

--2. 
update o1 set freight = freight * 1.1


--3.

update o1 set freight = freight * 1.1
select orderid, freight, country from 
		customers c 
			inner join orders o	on c.customerid = o.customerid
where 
		 c.country = 'Germany'

--4.

update o1 set freight = freight * 1.1
select orderid, freight, country 
from 
		customers c 
			inner join orders o	on c.customerid = o.customerid
where 
		 c.country = 'Germany'

--5.
update o1 set freight = freight * 1.1
--select orderid, freight, country 
from 
		customers c 
			inner join o1 o	on c.customerid = o.customerid
where 
		 c.country = 'Germany'


----Hänge an den Firmennamen des Kunden ein X hinten ran
--aber nur dort , wo die Bestellung über den ANG Nr 1 lief
begin tran
update customers set companyname = companyname +'-X'
--select * 
from customers c inner join orders o
on c.customerid = o.customerid
where o.employeeid = 1

select  * from customers c inner join orders o
on c.customerid = o.customerid
where o.employeeid = 1



---DELETE
--löscht Zeilen

delete from tabelle where Sp = 10


--Spielwiese
--select * into k1 from customers

--lösche den Kunden ALKFI

delete from k1 where customerid = 'ALFKI' --einer wech!


--löscht "eueren" Kunden
--alle die mit pp beginnen
delete from k1 where companyname like 'pp%'

--lösche den / die Kunden die wo frachtkosten über 50 habe
--aus k1

--zuerst select und prüfen
--dann select auskommentieren
--delete darüber setzen
--ausführen


delete from k1
--select distinct k1.* 
	   from k1 
		inner join orders o on k1.customerid = o.customerid
where 
		freight > 50

--der Kunde VINET muss für seine Bestellung : 10248
--keine Frachtkosten bezahlen
--lösche die Frachtkosten
select * from o1










--einen Wert löschen ist ein update mit NULL

update o1 set freight = NULL
	where orderid = 10248

select * from o1


