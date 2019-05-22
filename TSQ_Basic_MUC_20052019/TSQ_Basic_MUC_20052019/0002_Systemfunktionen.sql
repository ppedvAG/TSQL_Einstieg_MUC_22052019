--Systemfunktionen

--zb Datum

--Intervalle: dd,hh,yy,ss, qq, dw (day of week)
select dateadd(dd,2,'20.5.2019')--22.5.2019

--Das jetztige Datum
select getdate() --jetzt!

--Datum in 100 Tagen
select dateadd(dd,100,getdate())

--Welches Datum hatten wir vor 50 Wochen?
select dateadd(ww,-50, getdate())

select DATEDIFF(dd,'1.1.2019', getdate())
--    +139
select DATEDIFF(dd, getdate(),'1.1.2019') 
--    -139

--Teil eines Datums
select datepart(mm,getdate()) --5
select datepart(yy,getdate()) --2019
select datepart(qq,getdate()) --2
select datepart(ww,getdate()) --21

select year(getdate())


---Datumsteil als Bezeichnung ausgeben
select datename()

--Wochentag von heute..(Montag)
--??? dd
select datename(dw,getdate()),
	   datename(mm, getdate())


--Zeichenkettenfunktionen
select left('abcdef',2)

select right('abcdef',2)


--Längenmessung
select len('Otto         ') --4
select datalength('otto       ') --11

--Achtung Leerstellen am Ende, werden 
--oft nicht berücksichtigt!!

--reverse: ZK umdrehen
select reverse('Ein Neger mit Gazelle zagt im Regen nie')

--Substring, stuff
select substring('abcdef',3,2) --cd

select substring('abcdef',1,3) --abc--ist eigtl left

--das was der substring markiert, durch eine andere
--beliebige ZK ersetzten

select stuff('abcdef',3,2,'XXX')

select upper('abc'), lower('Abc'), soundex('Maier')

select soundex('meyr')--Volltextsuche

select 'A'+'B'

---Aufgabe:
--egal welche TelNummer, die letzten 3 Ziffern müssen 
--aus geixt werden

--08677-9889-123
--086779889xxx



select reverse(stuff(reverse('08677-9889-123'),1,3,'XXX'))


















