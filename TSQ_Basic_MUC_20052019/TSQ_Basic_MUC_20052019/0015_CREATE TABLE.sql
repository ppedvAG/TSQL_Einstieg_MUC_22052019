--TABELLE anlegen
--Tabelle anlegen
create table tab1
	(
		tab1id int identity,
		Famname varchar(50) not null,
		Vorname varchar(50) NULL,
		Gebdatum date,
		PLZ int
	)

--Spalte dazu
ALTER TABLE tab1 add Ort varchar(50)

--Spalte wegnehmen
ALTER TABLE tab1 drop column Ort

--Tabelle l�schen
DROP TABLE tab1 

--Sicht L�schen
DROP VIEW Sicht


DROP PROC Procname


