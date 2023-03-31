-- comando select 
select 'Hola Mundo'; -- (ctrl  enter)
select 2+2;
select 2+2 total;
select 2+2 as total; -- agrega alias a la columna
select 2+2 valor_total;
select 2+2 'valor total';
select pi();
select round(pi()) valor_pi;
select round(pi(),3) valor_pi;
select curdate() fecha_actual;
select curtime() hora_actual;
select sysdate() fecha_hora_actual;

-- LABORATORIO 1
-- 1- Borrar si existe la base de datos Agenda_v.
drop database if exists agenda_v;
-- 2- Crear la base de datos Agenda.
create database agenda_v;
-- 3- Ingresar a la base de datos creada.
use agenda_v;
-- 4- Crear una tabla llamada "datos". 
-- Debe tener los siguientes campos:
--    nombre (cadena de 20), 
--    domicilio (cadena de 30)
--    telefono (cadena de 11)
create table datos (
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);
-- 5- Visualizar las tablas existentes en 
-- la base de datos para verificar la creación de "datos".
show tables;
-- 6- Visualizar la estructura de campos de la tabla "datos". 
-- (describe).
describe datos;
-- 7- Ingresar 10 registros con valores aleatorios.
insert into datos(nombre,domicilio,telefono) values
('Maria','Tucuman 547','3659-8974'),
('Lucas','La rioja 589','4789-6359'),
('Pablo','jujuy 235','5678-1256'),
('Marina','Catamarca 56','4578-9564'),
('Marisa','Cordoba 254','4576-6321'),
('Cristian','Salta 789','5689-1234'),
('Santiago','Rosario 693','4723-1589'),
('Lucia','Santiago del Estero 326','5623-8945');
-- 8- Seleccione y muestre todos los registros de la tabla:
select * from datos;
-- Felicitaciones usted ha armado su agenda personal!!!!

-- LABORATORIO 02

-- 1- Borrar si existe la base de datos Negocio_v
drop database if exists negocio_v;
-- 2- Crear la base de datos Negocio_v.
create database negocio_v;
-- 3- Ingresar a la base de datos creada.
use negocio_v;
-- 4- Crear la tabla Clientes dentro de la base de datos 
-- con el siguiente detalle:

-- codigo		int auto_increment y PK
-- nombre		varchar(20) not null
-- apellido		varchar(20) not null
-- cuit			char(13)
-- direccion	varchar(50)
-- comentarios 	varchar(140)

-- PK significa Primary Key
create table clientes (
codigo_cliente int auto_increment,
nombre varchar(20) not null,
apellido varchar (20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key(codigo_cliente)
);
describe clientes;
-- 5- Crear la tabla Facturas dentro de la base de datos 
-- con el siguiente detalle:

-- Letra		char y PK
-- Numero		integer y PK
-- Fecha		date
-- Monto		double
create table factura (
letra char(1),
numero int,
fecha date,
monto double,
primary key (letra,numero)
);
-- observar que se esta declarando una clave primaria compuesta
-- es decir primary key(letra,codigo)
-- cada campo por si solo no es clave, ni tampoco identifica 
-- al registro pero la suma de los dos forman la clave

-- 6- Crear la tabla Articulos dentro de la base de datos 
-- con el siguiente detalle:

-- Codigo		integer auto_increment y PK 
-- Nombre 		varchar(50)
-- Precio		double
-- Stock		integer
create table articulos(
codigo int auto_increment,
nombre varchar(50),
precio double,
stock int,
primary key (codigo)
);
-- 7- Cargar 5 registros aleatorios en cada tabla.
insert into clientes(nombre,apellido,cuit,direccion) values
('juan','perez','235648980','santa fe 456'),
('jose','garcia','258965235','colombres 235'),
('maria','sanchez','253659865','peru 1245'),
('luis','marti','45789562','jujuy 125');

insert into factura(letra,numero,fecha,monto) values
('a',1001,'2023/03/12',2500),
('a',1002,curdate(),3000),
('a',1003,curdate(),5000),
('a',1004,curdate(),6000),
('a',1005,curdate(),4000);

insert into articulos(nombre,precio,stock) values
('martillo',180,20),
('lampara led',120,15),
('destornillador',155,20),
('pinza',250,35);

-- 8- Mostrar las tablas que tiene la base de datos negocio.
show tables;
-- 9- Describir (detalle de campos - METADATO) cada una de las tablas 
-- de la base de datos.
describe clientes;
describe factura;
describe articulos;
-- 10- Listar los registros de cada tabla.
select * from factura;
select * from clientes;
select * from articulos;
