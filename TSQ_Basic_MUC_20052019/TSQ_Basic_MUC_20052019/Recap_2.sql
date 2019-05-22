/*
select 
		* 
		A.*
		f(),
		Mathe ,
		'TXT', Zahl AS ALIAS
		Spalten,
		AGG(),
		(SELECT ...) ..ein Wert!  eine Zeile eine Spalte
FROM
	TAB1 A INNER|LEFT|RIGHT|CROSS JOIN TAB2 B ON A.Spx=B.Spx
		   INNER|LEFT|RIGHT|CROSS JOIN TAB3 C ON C.Spx=A.Spx
		   INNER|LEFT|RIGHT|CROSS JOIN TAB4 D ON D.Spx=B.Spx
		   JOIN SICHT F ON F.spy = D.spy
		   JOIN (select ... from ..) talias ON talias.spz=A.spz
where 
		SP> < like in between not in not like >=...
		Wildcards:
				% kein bis bel. viele Zeichen
				_ ein Zeichen
				[] ein Zeichen.. Wertebereich
group by
	alle Spalten des Select nut die AGG nicht und keine Alias
having Filter für berechnete Agg Werte


		   ...





*/

select country, city , count(*) as Anzahl
from customers
group by  country, city having count(*) > 2--hier kein Alias


--bescheuert!!
select country, city , count(*) as Anzahl
from customers
group by  country, city having city = 'London' 
--besser
--da das where die Daten vorgefiltert hätte
--und nicht über alle Daten der Group by rechnen muss
select country, city , count(*) as Anzahl
from customers
where city = 'London' 
group by  country, city 



Select top 1 * from products
select top 1 * from [order details]

--Wieviel Umsatz haben wir mit dem Chai gemacht?
select 
		Productname, sum(od.unitprice*od.quantity) as Umsatz 
from 
		[order details] od inner join Products p
					on 
					od.productid = p.productid
where 
	p.productname = 'Chai'
group by 
	Productname


select sum(unitprice*quantity) from [order details]
where productid = 1
group by Productname






select * from [order details]

select 
		companyname, o.orderid, max(unitprice*quantity) 
from
		customers c inner join orders o 
					on 
					o.customerid = c.customerid 
					inner join [order details] od 
					on 
					od.orderid=o.orderid 
group by companyname, o.orderid
















