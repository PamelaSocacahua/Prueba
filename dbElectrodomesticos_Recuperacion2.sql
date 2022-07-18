/*Crear Base de datos*/
CREATE DATABASE dbElectrodomesticos;
USE dbElectrodomesticos;

/*Tabla Cliente*/
CREATE TABLE CLIENTE
(
CODCLI char(4),
    NOMCLI varchar(60),
    APECLI varchar(80),
    EMACLI varchar(80),
    CELCLI char(9),
    DIRCLI varchar(70),
    ESTCLI char(1),
     CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

/*Tabla Vendedor*/
CREATE TABLE VENDEDOR
(
CODVEND char(4),
    NOMVEND varchar(60),
    APEVEND varchar(80),
    EMAVEND varchar(80),
    CELVEND char(9),
    DIRVEND varchar(70),
    ESTVEND char(1),
     CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
);

/*Tabla producto*/
CREATE TABLE PRODUCTO
(
CODPRO char(5),
    DESCPRO varchar(80),
    CATPRO char(1),
    PREPRO decimal(8,2),
    STOCKPRO int,
    ESTPRO char(1),
     CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

/*Tabla proveedor*/
CREATE TABLE PROVEEDOR
(
CODPROV char(5),
RAZSOCPROV varchar(90),
RUCPROV varchar(11),
EMAPROV varchar(70),
ESTPROV char(1),
     CONSTRAINT CODPROV_PK PRIMARY KEY (CODPROV)
);

/*Tabla venta*/
CREATE TABLE VENTA
(
CODVEN char(5),
FECVEN datetime,
CODCLI char(4),
CODVEND char(4),
ESTVEN char(1),
     CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN)
);

/*Tabla venta detalle*/
CREATE TABLE VENTADETALLE
(
IDVENDET int,
    CODVEN char(5),
    CODPRO char(5),
    CANTPRO int,
     CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET)
);

/*Tabla compra*/
CREATE TABLE COMPRA
(
CODCOM char(5),
    FECCOM datetime,
CODVEND char(4),
CODPROV char(5),
    ESTCOM char(1),
     CONSTRAINT CODCOM_PK PRIMARY KEY (CODCOM)
);

/*Tabla compra detalle*/
CREATE TABLE COMPRADETALLE
(
IDCOMDET int,
CODCOM char(5),
CODPRO char(5),
    CANTPRO int,
     CONSTRAINT IDCOMDET_PK PRIMARY KEY (IDCOMDET)
);

/*relaciones*/

/* Relacionar COMPRADETALLE - COMPRA */
ALTER TABLE COMPRADETALLE
ADD CONSTRAINT COMPRADETALLE_COMPRA FOREIGN KEY COMPRADETALLE_COMPRA (COMPRA_CODCOM)
    REFERENCES COMPRA (CODCOM);

/* Relacionar COMPRADETALLE - PRODUCTO */
ALTER TABLE COMPRADETALLE
ADD CONSTRAINT COMPRADETALLE_PRODUCTO FOREIGN KEY COMPRADETALLE_PRODUCTO (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO);

/*Relacionar COMPRA - PROVEEDOR*/
ALTER TABLE COMPRA
ADD CONSTRAINT COMPRA_PROVEEDOR FOREIGN KEY COMPRA_PROVEEDOR (PROVEEDOR_CODPROV)
    REFERENCES PROVEEDOR (CODPROV);

/* Relacionar COMPRA - VENDEDOR */
ALTER TABLE COMPRA
ADD CONSTRAINT COMPRA_VENDEDOR FOREIGN KEY COMPRA_VENDEDOR (VENDEDOR_CODVEND)
    REFERENCES VENDEDOR (CODVEND);

/* Relacionar VENTADETALLE - PRODUCTO */
ALTER TABLE VENTADETALLE
ADD CONSTRAINT VENTADETALLE_PRODUCTO FOREIGN KEY VENTADETALLE_PRODUCTO (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO);

/* Relacionar VENTADETALLE - VENTA */
ALTER TABLE VENTADETALLE
ADD CONSTRAINT VENTADETALLE_VENTA FOREIGN KEY VENTADETALLE_VENTA (VENTA_CODVEN)
    REFERENCES VENTA (CODVEN);

/* Relacionar VENTA - CLIENTE */
ALTER TABLE VENTA
ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CLIENTE_CODCLI)
    REFERENCES CLIENTE (CODCLI);

/* Relacionar VENTA - VENDEDOR */
ALTER TABLE VENTA
ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_CODVEND)
    REFERENCES VENDEDOR (CODVEND);

SHOW TABLES FROM dbElectrodomesticos;

/*Insertar registros en la tabla CLIENTE*/
INSERT INTO CLIENTE
(CODCLI,NOMCLI,APECLI,EMACLI,CELCLI,DIRCLI,ESTCLI)
VALUES
("CL01","Juana","Campos Ortíz","juana.campos@gmail.com","987485152","Av. Miraflores","A"),
("CL02","Sofia","Barrios Salcedo","Sofia.Barrios@outlook.com","","jr. Huallaga","A"),
("CL03","Claudio","Perez Luna","claudio.perez@outlook.com","","Av. Libertadores","A"),
("CL04","Marcos","Avila Manco","marcos.Avila@yahoo.com","","Calle Huallaga","A"),
("CL05","Anastasio","Salomon Inti","anastasio.salomon@gmail.com","","Jr. San Martin","A");

SELECT * FROM CLIENTE;

/*Insertar registros en la tabla CLIENTE*/
INSERT INTO VENDEDOR
(CODVEND,NOMVEND,APEVEND,EMAVEND,CELVEND,DIRVEND,ESTVEND)
VALUES
("VEN1","Gloria","Carrizales Paredes","gloria.carrizales@gmail.com","984574123","Calle las Begonias","A"),
("VEN2","Gabriel","Lozada Lombardi","gabriel.lozada@gmail.com","974512368","Av. los Girasoles","A"),
("VEN3","Gilberto","Martinez Guerra","gilberto.martinez@gmail.com","","Jr. Palomares","A");

SELECT * FROM VENDEDOR;

/*Insertar registros en la tabla PROVEEDOR*/
INSERT INTO PROVEEDOR
(CODPROV,RAZSOCPROV,RUCPROV,EMAPROV,ESTPROV)
VALUES
("PRV01","LG Corporation","87542136951","informes@lg.com.pe","A"),
("PRV02","SONY","45213698741","informes@sony.com.pe","A"),
("PRV03","SAMSUNG","85321697661","informes@samsung.com.pe","A"),
("PRV04","OSTER SRL","55663214478","informes@oster.com.pe","A"),
("PRV05","ASUS","99663325478","informes@asus.com.pe","A");

SELECT * FROM PROVEEDOR;

/*Insertar registros en la tabla PRODUCTO*/
INSERT INTO PRODUCTO
(CODPRO,DESCPRO,CATPRO,PREPRO,STOCKPRO,ESTPRO)
VALUES
("PRO01","Refrigeradora LG Side By Side","1","4149","15","A"),
("PRO02","Refrigeradora SBS 602L","1","3599","10","A"),
("PRO03","Refrigeradora Top Mount 500 L","1","2799","8","A"),
("PRO04","TV samsung UHD 55'","2","1799","25","A"),
("PRO05","Televisor 65' LG UHD 4K","2","2999","20","A"),
("PRO06","TV CRYSTAL UHD 55","2","2299","7","A"),
("PRO07","ASUS X415JA Core i3 10a Gen 14","3","1099","17","A"),
("PRO08","Lenovo IdeaPad 5i Intel Core i7 14","3","3099","10","A"),
("PRO09","Laptop HP 15-dw1085la Intel Core i3","3","1600","15","A"),
("PRO10","Galaxy A52 128GB","4","1200","25","A"),
("PRO11","iPhone 11 64GB Morado","4","2600","30","A"),
("PRO12","Poco X3 GT 5G 256GB 8GB","4","1450","20","A");

SELECT * FROM PRODUCTO;

/*15*/
select
CODCLI, 
NOMCLI,
APECLI
CODPRO,
DESCPRO,
PREPRO
from CLIENTE 
INNER JOIN PRODUCTO;

/*16*/
select 
CODPROV,
RAZSOCPROV,
DESCPRO,
PREPRO,
STOCKPRO
from
PROVEEDOR 
inner join PRODUCTO;

/*17*/
select 
NOMVEND,
APEVEND,
EMAVEND,
CODVEN
from
VENDEDOR 
inner join VENTA;