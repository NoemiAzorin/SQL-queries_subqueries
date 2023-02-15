								
                                -- CREACION DE UNA BBDD E INSERCCIÓN DE DATOS--

CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

-- CREAMOS LAS TABLAS --

#1ª- TABLA ZAPATILLAS

CREATE TABLE IF NOT EXISTS zapatillas (
id_zapatilla INT NOT NULL AUTO_INCREMENT,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY (id_zapatilla) );

#2ª TABLA CLIENTES

CREATE TABLE IF NOT EXISTS clientes (
id_clientes INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
numero_telefono INT(9) NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45),
provincia VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL,
PRIMARY KEY (id_clientes) ) ;

#3ª TABLA EMPLEADOS

CREATE TABLE IF NOT EXISTS empleados (
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado) );

#4ª TABLA FACTURAS

CREATE TABLE IF NOT EXISTS facturas (
id_factura INT NOT NULL AUTO_INCREMENT,
numero_factura VARCHAR(45) NOT NULL,
fecha DATE NOT NULL,
id_zapatilla INT NOT NULL,
id_clientes INT NOT NULL,
id_empleado INT NOT NULL,
PRIMARY KEY (id_factura), 
CONSTRAINT fk_facturas_zapatillas
FOREIGN KEY (id_zapatilla)
REFERENCES zapatillas (id_zapatilla),
CONSTRAINT fk_facturas_clientes
FOREIGN KEY (id_clientes)
REFERENCES clientes (id_clientes),
CONSTRAINT fk_facturas_empleados
FOREIGN KEY (id_empleado)
REFERENCES empleados (id_empleado) );

-- HACEMOS ALGUNAS MODIFICACIONES--

ALTER TABLE zapatillas
ADD COLUMN  marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT NOT NULL ;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT NOT NULL ;

ALTER TABLE clientes
DROP COLUMN pais,
MODIFY COLUMN codigo_postal INT ;

ALTER TABLE facturas
ADD COLUMN total FLOAT ;

-- INSERTAMOS LOS DATOS--

INSERT INTO zapatillas (id_zapatilla, modelo, color, marca, talla)
VALUES (1, "XQYUN", "Negro", "Nike", 42),
(2, "UOPMN", "Rosas", "Nike", 39),
(3, "OPNYT", "Verdes", "Adidas", 35) ;

INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
VALUES (1, "Laura", "Alcobendas", 25987 , "2010-09-03"),
(2, "Maria", "Sevilla", NULL, "2001-04-11"),
(3, "Ester", "Oviedo", 30165.98, 2000-11-29) ;

INSERT INTO clientes (id_cliente, nombre, numero_telefono, email, dirección, ciudad, provincia, codigo_postal)
VALUES (1, "Monica", 1234567289, "monica@email.com", "Calle Felicidad", "Móstoles", "Madrid", 28176),
(2, "Lorena", 289345678, "lorena@email.com", "Calle Alegria", "Barcelona", "Barcelona", 2346),
(3, "Carmen", 298463759, "carmen@email.com", "Calle del Color", "Vigo" , "Pontevedra", 23456);

INSERT INTO facturas (id_factura, numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
VALUES (1, 123, "2001-12-11", 1, 2, 1, 54.98),
(2, 1234, "2005-05-23", 1, 1, 3, 89.91),
(3, 12345, 2015-09-18, 2, 3, 3, 76.23) ;

-- PERFECCIONAMOS LA BBDD--

UPDATE zapatillas
SET color = amarillo
WHERE id_zapatilla = rosas ;

UPDATE empleados
SET tienda = ACoruña
WHERE id_empleado = 1 ;

UPDATE clientes
SET numero_telefono = 12345678
WHERE id_cliente = 1 ;

UPDATE facturas
SET total = 89.91
WHERE id_factura = 2 ;


