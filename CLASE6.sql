-- LABORATORIO 5
-- 1- Crear la tabla 'autos' en una nueva base de datos 
-- (Vehiculos_V) con el siguiente detalle:
drop database if exists vehiculos_V;
create database vehiculos_V;
use vehiculos_V;
-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE
create table autos (
	codigo	Int primary key,
	marca	VARCHAR(25),
	modelo	VARCHAR(25),
	color	VARCHAR(25),
	anio	INTEGER,
	precio	DOUBLE);
--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 128 en la tabla ASCII.
-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente varchar(12) after modelo;
-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
insert into autos (codigo,marca,modelo,patente,color,anio,precio) values
		('1001','ford','ka','htr125','blanco',2014,3500000),
        ('1002','ford','ka','qty678','blanco',2014,3500000),
        ('1003','ford','ka','mfr897','blanco',2012,2500000),
        ('1004','ford','ka','top458','blanco',2010,2500000),
        ('1005','ford','ka','rty965','blanco',2014,4500000),
        ('1006','peugeot','206','mvf125','rojo',2019,1500000),
        ('1007','peugeot','207','otr125','blanco',2018,2500000),
        ('1008','peugeot','306','ptr125','azul',2017,3550000),
        ('1009','peugeot','206','mtr125','blanco',2015,3650000),
        ('1010','peugeot','306','ptr125','negro',2014,3450000);
-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_maximo from autos;
-- 	b. obtener el precio mínimo.
select min(precio) precio_minimo from autos;
-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select codigo,marca,anio,min(precio) precio_minimo 
from autos
where anio between 2010 and 2018; -- correcto
select codigo,marca,anio,min(precio) precio_minimo 
from autos
where anio between 2010 and 2018
group by marca,anio;
-- 	d. obtener el precio promedio.
select avg(precio) precio_promedio from autos; -- correcto
-- 	d. obtener el precio promedio por anio.
select anio,round(avg(precio),2) precio_promedio 
from autos
group by anio;
-- 	e. obtener el precio promedio del año 2014.
select round(avg(precio),2) precio_promedio
from autos
where anio=2014; -- correcto
select marca, round(avg(precio),2) precio_promedio
from autos
where anio=2014
group by marca;
-- 	f. obtener la cantidad de autos.
select count(*) cantidad_de_autos from autos;
-- 	g. obtener la cantidad de autos que tienen un precio 
-- entre $1235000 y $3240000.
select count(*) cantidad_de_autos
from autos
where precio
between 1235000 and 3240000;
-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) cantidad
from autos
group by anio;
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select  anio,count(*) cantidad_autos,
avg(precio) promedio
from autos
group by anio;
-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio) total,
avg(precio) promedio
from autos
group by marca;
--  k. informar los autos con el menor precio.
select*from autos
where precio=(select min(precio) from autos);
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select * from autos
where precio=(select min(precio) minimo
from autos where anio between 2016 and 2018);
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos
order by marca,modelo,anio asc; 
--  n. contar cuantos autos hay de cada marca.
select marca, count(*) cantidad
from autos
group by marca;
--  o. borrar los autos del siglo pasado.
insert into autos (codigo,marca,modelo,patente,color,anio,precio) values
('1011','fiat','palio','abt125','blanco',1999,1200000);
select * from autos;

delete from autos where anio<2000;
-- si no deja borrar
set sql_safe_updates=0; -- desactivar
set sql_safe_updates=1; -- activar