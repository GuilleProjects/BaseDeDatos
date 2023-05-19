-- Continuacin ejercicio de practica

-- 13 Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
select avg(precio) precio_promedio, f.nombre
from articulos a
join fabricante f 
on f.codigo=a.fabricante
group by f.nombre;
-- 14 Obtener los nombres de los fabricantes que ofrezcan 
-- productos cuyo precio medio sea mayor o igual a $150.
select f.nombre 
from fabricantes f
join articulos a 
on f.codigo=a.fabricante
where preciio>=150;
-- 15 Obtener el nombre y precio  del artículo más barato.
SELECT NOMBRE, PRECIO
FROM articulos 
where precio=(select min(precio) menor_precio
from articulos);
-- 16 Obtener  una  lista  con  el  nombre  y  precio  de  los  
-- artículos  más  caros  de  cada  proveedor (incluyendo el nombre del proveedor).
select nombre,precio 
from articulos a
join fabricante f
on f.codigo=a.fabricante
and a.precio=(select max(oprecio) precio_maximo
from articulos);
-- 17 Añadir un nuevo producto: Altavoces de  $ 70   
-- (del fabricante 2)
insert into articulos(nombre,precio,fabricante) values
('altavoces',70,2);
-- 18 Cambiar el nombre del producto 8 a Impresora Láser
update articulos 
set nombre='impresora laser'
where codigo=8;
-- 19 Aplicar un descuento del 10 % 
-- (multiplicar el precio por 0,9) a todos los productos.
update articulos 
set precio=precio*0.9;

-- LOS ALMACENES

----------------------------------------------
create database almacen_v;
use almacen_v;
-- -----------------------------------------------------
-- Tablemydb.almacenes
-- -----------------------------------------------------
CREATE TABLE almacenes (
 codigo INT NOT NULL,
 lugar VARCHAR(100) NULL,
 capacidad INT NULL,
  PRIMARY KEY (codigo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tablemydb.cajas
-- -----------------------------------------------------
CREATE TABLE cajas (
 NumReferencia INT NOT NULL,
 contenido VARCHAR(100) NULL,
 valor INT NULL,
 almacen INT NOT NULL,
  PRIMARY KEY (NumReferencia)
  );
-- 1.	Obtener todos los almacenes
select * from almacenes;
-- 2.	Obtener todas las cajas cuyo contenido tenga un valor superior a 150 ¤.
select * from cajas
where valor>150;
-- 3.	Obtener los tipos de contenidos de las cajas.
select distinct contenido from cajas;
-- 4.	Obtener el valor medio de todas las cajas.
select avg(valor) promedio
from cajas;
-- 5.	Obtener el valor medio de las cajas de cada almacén. Obtener  los  códigos  de  los  almacenes  en  los  cuales  el  valor  medio  de  las  cajas  sea superior a 150 ¤.
select almacen, avg(valor) promedio
from cajas
where avg(valor)>150
group by almacen;
select almacen, avg(valor) promedio
from cajas
group by almacen
having avg(valor)>150;
-- 6.	Obtener el número de referencia de cada caja junto con el 
-- nombre de la ciudad en el que se encuentra.
select NumReferencia,lugar as ciudad
from caja c
join almacen a
on a.codigo=c.almacen;
-- 7.	Obtener el número de  cajas  que  hay en cada  almacén.
select almacen, count(*) Num_cant
from cajas
group by almacen; -- no tiene en cuenta los almacenes vacio
select codigo, count(NumReferencia)
from almacenes a
join cajas c
on a.codigo=c.almacen
group by codigo; -- esta consulta cuenta los almacenes vacios
-- 8.	Obtener los códigos de los almacenes que están saturados 
-- (los almacenes donde el número de cajas es superior a la capacidad).
select codigo
from almacenes
where capacidad<(select count(*) cantidad
from cajas
where almacen=codigo);
-- 9.	Obtener los  números  de  referencia  de  las cajas  que
-- están en Bilbao.
select NumReferencia
from almacenes a
left join cajas c
on a.codigo=c.almacen
where lugar='Bilbao';
-- 10.	Insertar un nuevo  almacén en Barcelona  con capacidad 
-- para 3  cajas.
insert into almacenes (lugar,capacidad) values
('Barcelona',3);
-- 11.	Insertar una nueva caja, con número de referencia ‘H5RT’, con contenido ‘Papel’, valor 200, y situada  en el almacén 2.
insert into cajas values
('H5RT','PAPEL',200,2);
-- 12.	Rebajar el valor de todas las cajas un 15 %.
update cajas set valor=valor*0.85;
-- 13.	Rebajar un 20 % el valor de todas las cajas cuyo valor 
-- sea superior al valor medio de todas las cajas.
update cajas set valor=valor*0.8
where valor>(select avg(valor)
from cajas);
-- 14.	Eliminar todas las cajas cuyo valor sea inferior a 100 ¤.
delete from cajas 
where valor < 100;
-- 15.	Vaciar el contenido de  los  almacenes  que  están 
-- saturados.
delete from cajas 
where almacen in (select codigo 
from almacenes 
where capacidad<(select count(*)
from cajas 
where almacen=codigo));
