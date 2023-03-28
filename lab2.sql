-- 1- Borrar si existe la base de datos Negocio.
drop database if exists negocio_v;
-- 2- Crear la base de datos Negocio.
create database negocio_v;
-- 3- Ingresar a la base de datos creada.
use negocio_v;

/*4- Crear la tabla Clientes dentro de la base de datos con el siguiente detalle:
codigo		int auto_increment y PK
nombre		varchar(20) not null
apellido		varchar(20) not null
cuit			char(13)
direccion	varchar(50)
comentarios 	varchar(140) */

create table clientes(
	codigo_clientes int auto_increment,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	cuit char(13), -- usamos char porque sabemos que el cuil es siempre de 13
	direccion varchar(50),
	comentarios varchar(140),
	primary key(codigo_clientes)
);

describe clientes; 

-- PK significa Primary Key -- Llave principal

/*5- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:
Letra		char y PK
Numero		integer y PK
Fecha		date
Monto		double */

create table factura(
	letra char(1),
	numero integer,
	fecha date,
	monto double,
	primary key(letra,numero)
);

/* observar que se esta declarando una clave primaria compuesta
es decir primary key(letra,codigo)
cada campo por si solo no es clave, ni tampoco identifica al registro
pero la suma de los dos forman la clave */

/*6- Crear la tabla Articulos dentro de la base de datos con el siguiente detalle:
Codigo		integer auto_increment y PK 
Nombre 		varchar(50)
Precio		double
Stock		integer */

create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key(codigo)
);

-- 7- Cargar 5 registros aleatorios en cada tabla.
insert into clientes(nombre,apellido,cuit,comentarios) values
('juan','perez','23343434','av santa fe 5446'),
('jose','velez','23556434','av santa fe 5646'),
('maria','kodama','24545534','av santa fe 3546'),
('luis','juez','23345454','av santa fe 1546');

insert into factura(letra,numero,fecha,monto) values
('a',1001,'2023/03/12',2500),
('a',1002,curdate(),3000),
('a',1003,curdate(),3500),
('a',1004,curdate(),4000);

insert into articulos(nombre,precio,stock) values
('martillo',180,20),
('lampara',120,15),
('destornillador',155,20),
('pinza',250,35);

-- 8- Mostrar las tablas que tiene la base de datos negocio.
show tables; -- mostrar base de negocios de las tablas que tengo
-- 9- Describir (detalle de campos - METADATO) cada una de las tablas de la base de datos.
describe clientes;
describe factura;
describe articulos;
-- 10- Listar los registros de cada tabla.
select * from clientes;
select * from factura;
select * from articulos;