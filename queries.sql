CREATE DATABASE proyectoEmpresa;
USE proyectoEmpresa

/********************************TABLAS***********************************/

CREATE TABLE tb_productos(
    id_producto int NOT NULL AUTO_INCREMENT,
    nom_producto varchar(20),
    descr_producto varchar(20),
    costo_producto varchar(20),
    PRIMARY KEY (id_producto)
);

CREATE TABLE tb_sucursales(
    id_sucursal int NOT NULL AUTO_INCREMENT,
    nom_sucursal varchar(20),
    dire_sucursal varchar(20),
    PRIMARY KEY (id_sucursal)
);

CREATE TABLE tb_productos_sucursales(
    id_sucursal int NOT NULL,
    id_producto int NOT NULL,
    stock_producto varchar(20),
    PRIMARY KEY(id_sucursal, id_producto),
    FOREIGN KEY(id_sucursal) REFERENCES tb_sucursales(id_sucursal),
    FOREIGN KEY(id_producto) REFERENCES tb_productos(id_producto)
);

/*******************************INSERTS**************************************/

INSERT INTO tb_productos(nom_producto, descr_producto, costo_producto) 
    VALUES ('Motherboard','Asus Prime A320m-k','13190,00'),
           ('Motherboard','Gigabyte B365m','14999,00'),
           ('Motherboard','Gigabyte H310M-DS2','23499,00'),
           ('Microprocesador','Intel Pentium G6405','18510,18'),
           ('Microprocesador','Ryzen 5 4500','34732.28'),
           ('Microprocesador','Intel I3-10105F','20258,25'),
           ('Fuente','Thermaltake TR2 600W','10799,00'),
           ('Fuente','Corsair CX550F 550W','16337,92'),
           ('Memoria RAM','Crucial 4GB','4523,17'),
           ('Memoria RAM','OEM 16GB','14944,18'),
           ('Memoria RAM','PNY XLR8 8GB','10582,77')
;

INSERT INTO tb_sucursales(nom_sucursal, dire_sucursal)
    VALUES ('San Justo','Av Illia 2386'),
           ('Moron','Av Rivadavia 17939'),
           ('Caballito','Av Acoyte 193')
;

INSERT INTO tb_productos_sucursales(id_sucursal, id_producto, stock_producto)
    VALUES (1,1,'50'),
           (1,2,'50'),
           (1,3,'50'),
           (1,4,'50'),
           (1,5,'50'),
           (2,4,'50'),
           (2,6,'50'),
           (2,7,'50'),
           (2,9,'50'),
           (2,11,'50'),
           (3,1,'50'),
           (3,5,'50'),
           (3,3,'50'),
           (3,8,'50'),
           (3,10,'50')
;

/********************************CONSULTAS************************************/

