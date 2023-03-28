-- 1- Borrar si existe la base de datos Agenda.
drop database if exists agenda_v;
-- 2- Crear la base de datos Agenda.
create database agenda_v;
-- 3- Ingresar a la base de datos creada.
use agenda_v;
-- 4- Crear una tabla llamada "agenda". Debe tener los siguientes campos:
--    nombre (cadena de 20), 
--    domicilio (cadena de 30)
--    telefono (cadena de 11)
create table datos (
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);
-- 5- Visualizar las tablas existentes en la base de datos para verificar la creación de "agenda".
show tables;
-- 6- Visualizar la estructura de campos de la tabla "datos". (describe).
describe datos;
-- 7- Ingresar 10 registros con valores aleatorios.
insert into datos(nombre,domicilio,telefono) values
('Maria','Tucuman 547','3659-8974'),
('Lucas','La rioja 589','4789-8974'),
('Pablo','Jujuy 235','5678-1256'),
('Marina','Catamarca 56','4578-9564'),
('Marisa','Cordoba 254','4576-6321'),
('Cristina','Salta 789','5689-1234'),
('Santiago','Rosario 693','1234-5678'),
('Lucia','Santiago del Estero 326','5623-8945');

-- 8- Seleccione y muestre todos los registros de la tabla:

-- Felicitaciones usted ha armado su agenda personal!!!!
