use negocio_v;
-- comando update (ANSI)
select * from clientes;
update clientes set nombre='Gabriel', apellido='Martinez'
where codigo_cliente=2;

describe clientes;
update clientes set cuit='25468956' 
where codigo_cliente=3;
update clientes set cuit='28987123'
where codigo_cliente=9;


-- update masivos
update clientes set nombre='Maria'
where nombre='Mario'; -- ojo modifica todos los registros en forma masiva

set sql_safe_updates=0; -- desactivar
set sql_safe_updates=1; -- activar

-- alter table (ANSI)
alter table clientes add edad int;
update clientes set edad=25 
where codigo_cliente=8;
select * from clientes;

alter table clientes add telefono varchar(20)
after cuit;
describe clientes;
update clientes set telefono='11-569896365'
where codigo_cliente=3;
update clientes set edad=33
where codigo_cliente=5;
update clientes set edad=28
where codigo_cliente=6;


-- alter table modify

alter table clientes modify edad tinyint unsigned;

alter table clientes add dni char(8) first;
describe clientes;

-- alter table drop
alter table clientes drop telefono;
alter table clientes drop edad;
alter table clientes drop dni;


-- LABORATORIO 4
-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando 
-- el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
insert into clientes values
(null,'Matias','Lorenzo','21548789','Tucuman 456',''),
(null,'Juan','Paso','55555555','Mexico 256','');
insert into clientes values
(null,'Liliana','Mora','4444444','Chile 569','');
insert into clientes values
(null,'Javier','Marin','12356844','Peru 123','');
insert into clientes values
(null,'Jimena','Suarez','12312455','Misiones 145','');
-- 2-	Insertar 5 clientes en la tabla clientes utilizando 
-- los campos como parte de la sentencias, es decir de la forma extendida. 
-- Completar solo los campos nombre, apellido y CUIT
insert into clientes (nombre,apellido,cuit) values
('Miguel','Funes','256894578');
insert into clientes (nombre,apellido,cuit) values
('Marisa','Fuentes','57894562'),
('Paola','Martinez','145789523');
-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes set nombre='Jose'
where codigo_cliente=1;
select * from clientes;
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 
-- a Pablo Fuentes 20-21053119-0.
update clientes set nombre='Pablo',
apellido='Fuentes', cuit='20-21053119-0'
where codigo_cliente=3;
-- 5-	Actualizar todos los comentarios NULL  a ''.
update clientes set comentarios=''
where comentarios  is null;
-- 6-	Eliminar los clientes con apellido Perez.
delete from clientes 
where apellido='Perez';
-- 7-	Eliminar los clientes con CUIT Terminan en 0.
delete from clientes 
where  cuit like '%0';
-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
update articulos set precio=precio*1.2
where precio<=50;
-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
update articulos set precio=precio*1.15
where precio>50;
-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
update articulos set precio=precio*0.95
where precio>200;
-- 	11- Eliminar los artículos con stock menor a 0.
describe articulos;
insert into articulos(nombre,precio,stock) values
('Pintura 5l',2500,0);
select * from articulos;
delete from articulos
where stock<=0;
-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
alter table articulos
add StockMinimo int,
add StockMaximo int;
select * from articulos;
--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=1;
update articulos set StockMinimo=30, 
stockMaximo=110 where codigo=2;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=3;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=4;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=5;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=6;
update articulos set StockMinimo=30, 
stockMaximo=110 where codigo=7;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=8;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=9;
update articulos set StockMinimo=40, 
stockMaximo=100 where codigo=10;
--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
select codigo,precio,stock,
stockMaximo-stock cantidad_a_reponer,
StockMinimo,StockMaximo
from articulos
where stock<=StockMinimo;
--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(precio*stock) valor_venta_total
from articulos;
--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
select sum(round(precio*stock*1.21,2)) 
venta_total_con_iva
from articulos;










