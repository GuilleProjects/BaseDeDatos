/*
Primera clase de base de datos
Base de datos SQL 
Guille
Profe: Laura Artaza
10/03/2023


Software es MySQL server
En Workbench
Alternativas: MariaDB, Oracle, SQLserver

Requerimientos de conexión: protocolo de conexion: TCP/IP CONEXION A INTERNET
Con el XAMPP simulamos una conexion al servidor. 

Lenguaje: ANSI SQL

Paquete XAMPP

X Linux/windows/mac
A apacheweb server
M MySQL server/ MariaDB
P PHP
P Perl

Paquete WAMP

w WINDOWS 
A Apacheweb server
M MySQL server/ MariaDB
P PHP
*/

-- comentario en linea
/* 
bloque de comentario 
*/

#Comentario en linea no ANSI ((NO ES ESTANDAR))

show databases;
-- SQL: structure query lenguage 

/*
DDL: DATA DEFINITION LANGUAGE 
(lenguaje de definicion de datos)

create table;
alter table; //iterar
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
TIPO 		LONGITUD
char(X)	x
x=cantidad de caracteres
varchar(x)	x+1

nombre char(20) //char de 20 caracteres
ana 	20 bytes
carlos	20 bytes
maximiliano 	20 bytes
total	60 bytes

nombre varchar(20)
ana 	3+1 bytes
carlos	6+1 bytes
maximiliano 11+1 bytes   //EL BYTE SON LAS LETRAS
total	23 bytes

*/

/*
TIPO DE DATO NUMERICOS
TIPO		LONGITUD
boolean		1 byte true or false
tiniyint	1 byte (un numero entero con rango -128 a 127)
tiniyint unsigned	1 byte (sin signo es del 0 a 255)
smallint 	2 bytes (-32768 a 32767)
mediumint	3 bytes (-8388608 a 8388607)
interger	4 bytes PARA CUALQUIER NRO EN GENERAL
float		4 bytes DECIMALES
doble		8 bytes Para nros con COMA
decimal(m, d) m+2 bytes (almacena los nros como cadena de cuantos digitos(m) y cuanto la parte decimal(d)
ejemplo:
precio(7,2) total=7+2=9 bytes
99999,99 
*/

/*
Tipo de datos de fecha y hora
TIPO			LONGITUD
date 2023/03/10	3 bytes
time hh:mm:ss	3 bytes
datime			8 bytes
*/
