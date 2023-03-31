/* 
Curso de base de datos 
dias:viernes de 15 a 19 horas
mi correo es: laura.artaza@bue.edu.ar

software que vamos a utilizar es MySQL server
alternativos son: MariaDB, Oracle, SQLserver
Requerimentos de conexion:
protocolo de conexion: TCP/IP
Lenguiaje: ANSI SQL

Paquete XAMMP

X   Linux/Windows/Mac
A   Apacheweb server
M   MySQL server/ Maria DB
P   PHP
P   Perl

Paquete WAMP
W   Windows
A   Apache web server
M   MySQL server/ Maria DB
P   PHP
*/

/*
BLOQUE DE COMENTARIO
*/
-- COMENTARIO EN LINEA

# COMENTARIO EN LINEA NO ANSI

show databases;

-- SQL: STRUCTURE QUERY LANGUAGE

/*
DDL: DATA DEFINITION LANGUAGE
(lenguaje de definicion de datos)

create table;
alter table;
drop table;
*/

/*
DML: DATA MANIPULACION LANGUAGE
(lenguaje de manipulacion de datos)
select
insert
delete
update
*/

/*
TIPOS DE DATOS MAS COMUNES

Tipo de datos de texto
TIPO             LONGITUD
char(x)          x
varchar(X)       x+1

nombre char(20)
ana          20 bytes
carlos       20 bytes
maximiliano  20 bytes
total        60 bytes

nombre varchar(20)
ana          3+1  bytes
carlos       6+1  bytes
maximiliano  11+1 bytes
total        23   bytes

Tipo de dato numericos
tipo         longitud
boolean      1 byte
tiniyint     1 byte (un numero entero con rango -128 a 127)
tiniyint unsigned      1 byte (sin signo  es de 0 a 255 )
smallint     2 bytes (-32768 a 32767)
mediumint    3 bytes (-8388608 a 8388607)
interger     4 bytes
float        4 bytes (para numeros decimales)
doble        8 bytes (para numeros con coma)
decimal(m,d) m+2 bytes (alamacena los numeros como 
cadean de cuantos digitos(m) y cuanto la parte decimal(d)
ejemplo:
precio(7,2) total= 7+2=9 bytes
99999,99

Tipo de datos de fecha y hora
TIPO              LONGITUD
date 2023/03/10   3 bytes
time hh:mm:ss     3 bytes
datime            8 bytes
*/

