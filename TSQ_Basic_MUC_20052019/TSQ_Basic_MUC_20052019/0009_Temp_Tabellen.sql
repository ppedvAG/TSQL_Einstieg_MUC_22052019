--Temporäre Tabellen

/*
select * from Tab
select * from view

select * from #tab

2 Sorten von temp. Tabellen

#tab: lokale temp. Tabelle

##tab: globale temp. Tabelle

Unterschied zu "normalen" Tabellen:

zeitlich begrenzt

#tab: gilt nur innerhalb einer Session (> 50)
	  ist solange existent, bis er der Ersteller sie löscht
	  oder die Session beendet wird

##tab: ist für alle existent
       exisitert bis der Ersteller sie löscht
	   oder die Verbindnung des Ersteller gekillt wird

	   temporäre Tabellen werden nie automatisch aktualisiert



Sinn?

Auslagerungen.. schrittweises Vorgehen
Code wird evtl länger aber übersichtlicher

*/

select top 10 * into #t1 from customers


select * from #t1

drop table #t1 --jetzt weg


select * from 
	(
		select top 1 customerid, freight 
			from orders order by freight desc
	) t1
UNION ALL
select * from 
	(
		select top 1 customerid, freight 
		from orders order by freight asc
	) t2




select top 1 customerid, freight 
into #tkdboese
from orders order by freight desc


select top 1 customerid, freight 
into #tkdgut
from orders order by freight asc

select * from #tkdboese
union all
select * from #tkdgut











