use negocio_v;
select * from factura;
select * from clientes;
select * from articulos;

show columns from articulos;
rename table articulos to articulo;
show tables;
rename table articulo to articulos;
alter table articulos add observacion varchar(145) not null;
show columns from articulos;
alter table articulos drop column observacion;

-- columnas calculadas
select nombre, precio precio_sin_iva from articulos;

select codigo,nombre,precio,round(precio*1.21,2) precio_con_iva,stock 
from articulos;

select codigo,nombre,precio,round(precio*0.80,2) precio_con_desc 
from articulos;

select codigo,nombre,precio,round(precio*1.30,2) 'Precio con 30% de aumento'
from articulos;

-- filtrado where
select * from clientes where nombre='juan';
select * from clientes where codigo_cliente=3;

-- buscar a Sanchez y el cliente 2
select * from clientes where apellido='Sanchez';
select * from clientes where codigo_cliente=2;

-- operador != <> (distinto)
select * from clientes where codigo_cliente <>3;
select * from clientes where codigo_cliente !=3;
select * from articulos where codigo !=2;

-- operador < <= > >=
select * from clientes where codigo_cliente >2;
select * from clientes where codigo_cliente >=2;
select * from articulos where precio>100;
select * from articulos where precio <=120;

-- valores null
insert into clientes(nombre,apellido,comentarios) values
('Ana','Martinez',''),
('Javier','Lopez',null);

select * from clientes;
insert into clientes(nombre,apellido) values
('Maria','Lagos'),
('Abel','Marin');

select * from clientes where comentarios='';
select * from clientes where comentarios is null;
select * from clientes where comentarios is not null;

-- operador logico and or
select * from clientes where nombre='Juan' or nombre='Lucia';
select * from clientes where nombre='Juan' or nombre='Luis';
select * from clientes where nombre='Juan' and apellido='Perez';
select * from clientes where nombre='Juan' and apellido='Gonzalez';
select * from clientes where nombre='Juan' or apellido='Garcia';


insert into articulos (nombre,precio,stock) values
('Pintura 1l',250,15),
('Pintura 2l',350,25),
('Pintura 3l',550,15),
('Pintura 5l',750,25),
('Pintura 10l',1250,20);

select * from articulos where precio >= 300 and precio <=400;
select * from articulos where precio >=300 or precio <=400;

-- operador between not between
select * from articulos where precio between 300 and 400;
select * from articulos where precio not between 300 and 400;

select * from clientes where 
codigo_cliente=2 or
codigo_cliente=3 or
codigo_cliente=4 or
codigo_cliente=5;

-- operador in not in
select * from clientes where codigo_cliente in(2,3,4,5);
select * from clientes where codigo_cliente not in(2,3,4,5);

-- busquedas de expresiones like not like

insert into clientes(nombre,apellido) values
('Maria','Perez'),
('Mariana','Perez'),
('Mario','Perez'),
('Marcela','Perez'),
('Marcelo','Perez'),
('Mirta','Perez'),
('Marta','Paez'),
('Merlina','Paez'),
('Monica','Paez'),
('Micaela','Luna'),
('Omar','Luna'),
('armando','Perez');
select * from clientes;

delete from clientes where nombre='Luna';
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre not like 'm%';
select * from clientes where nombre like '%a';
select * from clientes where nombre like 'm%a';
select * from clientes where nombre like '%ar';
select * from clientes where nombre like 'm_r%';
select * from clientes where nombre like '___';

-- ordenamiento con ordey by
select * from clientes order by nombre;
select * from clientes order by nombre asc;
select * from clientes order by nombre desc;
select * from clientes order by nombre,apellido;
select * from clientes order by apellido desc,nombre;


-- LABORATORIO 3
-- 1 - Ingrese a la base de datos negocio.
use negocio_v;
-- 2 - Ingrese 5 registros aleatorios en cada tabla.

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100
-- b-	artículos con precio entre 20 y 40 (usar < y >)
-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
-- d-	artículos con precio = 20 y stock mayor a 30
-- e-	artículos con precio (12,20,30) no usar IN
-- f-	artículos con precio (12,20,30) usar el IN
-- g-	artículos que su precio no sea (12,20,30)
-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
-- i-   listar nombre y descripción de los artículos que no cuesten $100
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'

-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.


