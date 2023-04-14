-- LABORATORIO 3
-- 1 - Ingrese a la base de datos negocio.
use negocio_v;
show tables;
-- 2 - Ingrese 5 registros aleatorios en cada tabla.
insert into articulos (nombre,precio,stock)values
	('pinza chica',320,10),
    ('lampara led 9w',157,15),
    ('Pincel 15mm',55,20),
    ('pinza grande',450,35);
insert into clientes(nombre,apellido,cuit,direccion)values
	('juan','Martinez',66666666,'salta 16'),
    ('julia','San Martin',7777777, 'Jujuy 344'),
    ('Hector','Urquiza',33335555,'Cordoba 1256'),
    ('Paula','Mora',44446788,'Castro 589');
insert into factura(letra,numero,fecha,monto) values
	('a',1006,'2023/03/21',4500),
	('b',1002,curdate(),5000),
	('a',1007,curdate(),6000),
	('a',1008,curdate(),7000),
	('a',1009,curdate(),8000);
    
select * from clientes;
select * from articulos;
select * from factura;
-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100
select * from articulos where precio>100;
-- b-	artículos con precio entre 200 y 400 (usar < y >)
select * from articulos where precio>200 and precio<400;
-- c-	artículos con precio entre 400 y 600 (usar BETWEEN)
select * from articulos where precio between 400 and 600;
-- d-	artículos con precio = 200 y stock mayor a 30
select * from articulos where precio=200 and stock>30;
select * from articulos where precio>=200 and stock>30;
-- e-	artículos con precio (120,200,300) no usar IN
select  * from articulos 
where precio=120 
or    precio=200
or    precio=300;
-- f-	artículos con precio (120,200,300) usar el IN
select  * from articulos where precio in(120,200,300);
-- g-	artículos que su precio no sea (12,20,30)
select  * from articulos where precio not in(120,200,300);
-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
select nombre, precio, round(precio*1.21,2) precio_con_iva
from articulos
where precio >100;
-- i-   listar nombre y precio de los artículos que no cuesten $100
select nombre,precio 
from articulos 
where precio!=100;
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
insert into articulos (nombre,precio,stock) values
	('lampara led 5w',124,20),
    ('lampara led 10w',155,25),
    ('lampara led 12w',175,22),
    ('lampara led 15w',195,10),
    ('lampara led 9w',134,10);
    
select * from articulos 
where nombre 
like '%lampara%';
-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'
select * from articulos
where precio<200 and nombre not like '%a%';
-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
select * from articulos 
order by precio desc,nombre;
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
select nombre,precio,round(precio*1.21,2)precio_con_iva
from articulos;
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.

select nombre,precio cantidad_de_cuotas_3,
round(precio/3*1.05,2) valor_cuota
from articulos;

-- COMANDO INSERT

-- Insert con definicion de campos(Ansi)
insert into clientes (nombre,apellido,direccion) values
('Leandro','Mores','Lima 123');

-- INSERT SIN DEFINICION DE CAMPOS (ANSI)
describe clientes;
insert into clientes values
(null,'Juan','Cerro','252258963','San juan 568','');
select * from clientes;

-- insert set (NO ANSI)
insert clientes set nombre='Raul',apellido='Ledesma';
insert clientes set nombre='Margaa',
apellido='Vila',direccion='Larrea 256';
select * from clientes;

-- insert masivo(ANSI)
insert into clientes(nombre,apellido)values
('Jose','Castro'),
('Matias','Juarez'),
('Patricia','Paz');

-- COMANDO DELETE (ANSI)
select * from clientes;
delete from clientes 
where codigo_cliente=3;
delete from clientes 
where nombre='Patricia';

-- Borrado Masivo
insert into clientes(nombre,apellido) values
('Maria','Perez'),
('Juan','Perez'),
('Martin','Perez'),
('Luisa','Perez'),
('Jose','Perez'),
('Lucas','Perez'),
('Maximiliano','Perez'),
('Cesar','Perez'),
('Ana','Perez'),
('Pia','Perez');

delete from clientes
where apellido='Perez';
set sql_safe_updates=0; -- comando para permitir borrar 
-- activar 1 desactivar con 0
select * from clientes;
delete from clientes where nombre like '%c%';

-- delete from clientes; -- ojo!!! borra todos los clientes

select * from clientes;
insert into clientes(codigo_cliente,nombre,apellido)values
	(200,'Jose','Artigas');
insert into clientes(nombre,apellido)values
	('Maria','Garcia');
delete from clientes where codigo_cliente=200;
insert into clientes(nombre,apellido)values
	('Juan','Mendoza');

-- COMANDO TRUNCATE - elimino todos los 
-- datos que contiene la tabla
truncate clientes;
select * from clientes;

-- Funciones de agrupamiento
-- Funcion max()numerico, texto, date
select * from factura;
select max(monto) from factura;
select max(monto)'monto maximo' from factura;
select max(fecha)from factura;
select max(fecha)'Ultima fecha'from factura;
select max(nombre)from clientes;
select max(nombre)'Ultimo nombre'from clientes;
insert into clientes(nombre,apellido) values
('Victor','Acosta');

-- Funcion min()numerico, texto, date
select min(monto) from factura;
select min(monto) 'monto minimo'from factura;
select min(fecha) from factura;
select min(fecha) 'fecha inicial' from factura;
select min(apellido)from clientes;
select min(apellido) 'primer apellido' from clientes;

-- funcion sum(arg) arg=numnerico
select sum(monto) total_facturado from factura;
select sum(stock) total_mercaderia from articulos;

-- valor de venta de toda la mercaderia en stock
select sum(precio*stock) valor_venta_total from articulos;

-- funcion avg(arg) arg=numerico
select avg(monto) valor_promedio from factura;
select avg(precio) valor_promedio from articulos;
select round(avg(precio),2) precio_promedio from articulos;



