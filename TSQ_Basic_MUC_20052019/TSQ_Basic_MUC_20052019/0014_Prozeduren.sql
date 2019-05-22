--Prozeduren

--wie Batchdateien
--Prozeduren werden aufgerufen
exec ProcName

--Proc nicht direkt kombinierbar mit JOIN zb...
--Proz liegen auf dem Server und gelten als schnell
--Codeänderung nur an einer Stelle (auf dem Server)
--Prozeduren enthalten oft komplette BI Logik
--Im Gegensatz zur Sicht, kann in einer Proz alles mögliche stehen
--

create proc gpname
as
CODE

create proc gpDemo
as
select getdate()

exec gpdemo

--Ändern
ALTER proc gpDemo
as
select 100*200

exec gpdemo

--Löschen der Prozedur
drop proc gpdemo2


create proc gpdemo2
as
select 1
GO --GO schadet nicht.. sonst wäre das folgende exwec Bestandteil der Proc


exec gpdemo2 


create proc gpdemo3 @par1 int, @par2 int
as
select @par1+@par2
select * from orders where freight < @par2
GO


exec gpdemo3 100,200


exec gpKundeDel 'ALFKI' 
--Kunde Alfki aus der Customerstabelle löschen

begin tran
exec gpKundeDel
select * from customers
rollback

--worin liegt das Problem.... Orderdetails, orders, customers

create proc gpKundedel @kdid char(5)
as
delete from [order details]
--select orderid 
	from orders o inner join [order details] od
	on od.orderid = o.orderid 
	where o.customerid = @KDID

delete from orders where customerid = @KDID

delete from customers where customerid = @KDID
GO

--ENDE PROC
--Alternative für order details ...
select * from [order details]
where orderid 	in (select orderid from orders 
					where customerid = @kdid)


delete from [order details] 
	where orderid in 
	(Select orderid from orders where customerid = @kdid)
delete from [order details]
--select orderid 
from orders o inner join [order details] od
on od.orderid = o.orderid 
where o.customerid = @KDID


begin tran
select top 1 * from customers
exec gpKundedel 'ALFKI'
select top 1 * from customers
rollback









exec gpKDSuche 'ALFKI' --1 Ergebnis
exec gpKDSuche 'A%'    --4 Ergebnis
exec gpKDSuche '%'     --alle


--vor der Proz zuerst das SELECT ..

select * from customers where customerid like  'ALFKI'

select * from customers where customerid like  'A%'



select * from customers where customerid like  @ProcParameter


create proc gpKDsuche @CustID char(5)
as
select * from customers where customerid like @CustID
GO


exec gpKdsuche 'ALFKI'

exec gpKdsuche 'A%' --'A%___' --A mit 3 Leerzeichen am Ende


alter proc gpKDsuche @CustID varchar(5)
as
select * from customers where customerid like @CustID
GO

--a bissl flexibler

alter proc gpKDsuche @CustID varchar(5)='%'
as
select * from customers where customerid like @CustID+'%'
GO

exec gpKdSuche 'AL'





















