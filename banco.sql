CREATE DATABASE banco;
USE banco;

CREATE TABLE ciudad(
    codigo_postal BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR (45) NOT NULL,

    CONSTRAINT pk_ciudad
    PRIMARY KEY (codigo_postal)
) ENGINE=InnoDB;

CREATE TABLE sucursal(
    nro_suc SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    telefono VARCHAR (15) NOT NULL,
    horario VARCHAR (45) NOT NULL,
    codigo_postal BIGINT UNSIGNED NOT NULL,

    CONSTRAINT pk_sucursal
    PRIMARY KEY (nro_suc)  

    CONSTRAINT fk_suc_ciudad
    FOREIGN KEY (codigo_postal) REFERENCES ciudad (codigo_postal)
        
) ENGINE=InnoDB;

CREATE TABLE empleado(
    legajo BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    apellido VARCHAR (45) NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    tipo_doc VARCHAR (20) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR (45) NOT NULL,
    telefono VARCHAR (45) NOT NULL,
    cargo VARCHAR (45) NOT NULL,
    password VARCHAR (32) NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_empleado
    PRIMARY KEY (legajo)

    CONSTRAINT fk_empleado_suc 
    FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)    
) ENGINE=InnoDB;

CREATE TABLE cliente (
    nro_cliente BIGINT UNSIGNED NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tipo_doc VARCHAR(45) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    fecha_nac DATE NOT NULL,

    CONSTRAINT pk_cliente
    PRIMARY KEY (nro_cliente)

    KEY(nro_doc)
) ENGINE = InnoDB;

CREATE TABLE plazo_fijo(
    nro_plazo SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    capital DECIMAL(16,2) UNSIGNED NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tasa_interes DECIMAL(4,2) UNSIGNED NOT NULL,
    interes DECIMAL(16,2) UNSIGNED NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_plazo_fijo
    PRIMARY KEY (nro_plazo),

    CONSTRAINT fk_plazof_suc
    FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc),

    CHECK (tasa_interes > 0),
    CHECK (capital > 0),
    CHECK (interes >= 0)
) ENGINE = InnoDB;

CREATE TABLE tasa_plazo_fijo (
    periodo INT UNSIGNED NOT NULL,
    monto_inf DECIMAL(16,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(16,2) UNSIGNED NOT NULL,
    tasa DECIMAL(4,2) UNSIGNED NOT NULL, 

    CONSTRAINT pk_tasa_plazo_fijo
    PRIMARY KEY (periodo, monto_inf, monto_sup) 
) ENGINE = InnoDB;

CREATE TABLE plazo_cliente {
    nro_plazo SMALLINT UNSIGNED NOT NULL,
    nro_cliente SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_plazo_cliente
    PRIMARY KEY (nro_plazo, nro_cliente),

    CONSTRAINT fk_plazo_cliente_plazo_fijo
    FOREIGN KEY (nro_plazo) REFERENCES plazo_fijo(nro_plazo),
    
    CONSTRAINT fk_plazo_cliente_cliente
    FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
} ENGINE = InnoDB;

CREATE TABLE prestamo (
    nro_prestamo INT UNSIGNED AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    cant_meses SMALLINT UNSIGNED NOT NULL,
    monto DECIMAL(10,2) UNSIGNED NOT NULL,
    tasa_interes DECIMAL(4,2) UNSIGNED NOT NULL,
    interes DECIMAL(9,2) UNSIGNED NOT NULL,
    valor_cuota DECIMAL(9,2) UNSIGNED NOT NULL,
    legajo SMALLINT UNSIGNED NOT NULL,
    nro_cliente SMALLINT UNSIGNED NOT NULL,
    
    CONSTRAINT pk_prestamo
    PRIMARY KEY (nro_prestamo),

    CONSTRAINT fk_prestamo_empleado
    FOREIGN KEY (legajo) REFERENCES empleado(legajo),

    CONSTRAINT fk_prestamo_cliente
    FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente)
    
) ENGINE = InnoDB;

CREATE TABLE pago (
    nro_prestamo INT UNSIGNED AUTO_INCREMENT NOT NULL,
    nro_pago SMALLINT UNSIGNED NOT NULL,
    fecha_venc DATE NOT NULL,
    fecha_pago DATE,
    
    CONSTRAINT pk_pago
    PRIMARY KEY (nro_prestamo, nro_pago)

    CONSTRAINT fk_pago_prestamo
    FOREIGN KEY (nro_prestamo) REFERENCES prestamo(nro_prestamo)
) ENGINE = InnoDB;

CREATE TABLE tasa_prestamo (
    periodo SMALLINT UNSIGNED,
    monto_inf DECIMAL(10,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(10,2) UNSIGNED NOT NULL,
    tasa DECIMAL(4,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_tasa_prestamo
    PRIMARY KEY (periodo, monto_inf, monto_sup)
) ENGINE = InnoDB;

CREATE TABLE caja_ahorro(
    nro_ca INT UNSIGNED AUTO_INCREMENT NOT NULL,
    CBU BIGINT UNSIGNED NOT NULL,
    saldo DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_caja_ahorro
    PRIMARY KEY (nro_ca)
) ENGINE = InnoDB;

CREATE TABLE cliente_ca (
    nro_cliente SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_cliente_ca
    PRIMARY KEY (nro_cliente, nro_ca),

    CONSTRAINT fk_clienteca_cliente
    FOREIGN KEY (nro_cliente) REFERENCES cliente(nro_cliente),
    FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca)
) ENGINE = InnoDB;

CREATE TABLE tarjeta (
    nro_tarjeta BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    pin VARCHAR(32) NOT NULL, --hash MD5
    cvt VARCHAR(32) NOT NULL, --hash MD5
    fecha_venc DATE NOT NULL,
    nro_cliente SMALLINT UNSIGNED NOT NUll,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_tarjeta
    PRIMARY KEY (nro_tarjeta),

    CONSTRAINT fk_tarjeta_cliente
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES cliente_ca(nro_cliente, nro_ca)
) ENGINE = InnoDB;

CREATE TABLE caja(
    cod_caja INT UNSIGNED NOT NULL,

    CONSTRAINT pk_caja
    PRIMARY KEY (cod_caja)
)ENGINE = InnoDB;

CREATE TABLE ventanilla(
    cod_caja SMALLINT UNSIGNED  AUTO_INCREMENT NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_ventanilla
    PRIMARY KEY (cod_caja),

    CONSTRAINT fk_ventanilla_caja
    FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)

    CONSTRAINT fk_ventanilla_suc
    FOREIGN KEY (nro_suc) REFERENCES sucursal(nro_suc)
) ENGINE = InnoDB;

CREATE TABLE atm(
    cod_caja SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    codigo_postal BIGINT UNSIGNED NOT NULL,
    direccion VARCHAR(150) NOT NULL,

    CONSTRAINT pk_atm
    PRIMARY KEY (cod_caja),

    CONSTRAINT fk_atm_caja
    FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)

    CONSTRAINT fk_atm_ciudad
    FOREIGN KEY (codigo_postal) REFERENCES ciudad(codigo_postal)
) ENGINE = InnoDB;

CREATE TABLE transaccion (
    nro_trans INT UNSIGNED AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL, 
    monto DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_transaccion
    PRIMARY KEY (nro_trans)
) ENGINE = InnoDB;

CREATE TABLE debito (
    nro_trans INT UNSIGNED NOT NULL,
    descripcion TINYTEXT,
    nro_cliente SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL, 
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_debito
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_debito_clienteca
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES cliente_ca(nro_cliente, nro_ca),

    CONSTRAINT fk_debito_transaccion
    FOREIGN KEY (nro_trans) REFERENCES transaccion(nro_trans)
) ENGINE = InnoDB;

CREATE TABLE transaccion_por_caja (
    nro_trans INT UNSIGNED NOT NULL,
    cod_caja SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,

    CONSTRAINT pk_transaccion_por_caja
    PRIMARY KEY (nro_trans), 

    CONSTRAINT fk_transpcaja_transaccion
    FOREIGN KEY (nro_tras) REFERENCES transaccion(nro_trans),

    CONSTRAINT fk_transpcaja_caja
    FOREIGN KEY (cod_caja) REFERENCES caja(cod_caja)
) ENGINE = InnoDB;

CREATE TABLE deposito (
    nro_trans INT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_deposito
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_deposito_caja_ahorro
    FOREIGN KEY (nro_ca) REFERENCES caja_ahorro(nro_ca),

    CONSTRAINT fk_deposito_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans)
) ENGINE = InnoDB;

CREATE TABLE extraccion (
    nro_trans INT UNSIGNED NOT NULL,
    nro_cliente SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,

    CONSTRAINT pk_extraccion
    PRIMARY KEY (nro_trans)

    CONSTRAINT fk_extraccion_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans),

    CONSTRAINT fk_extraccion_clienteca
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES cliente_ca(nro_cliente, nro_ca)
) ENGINE = InnoDB;

CREATE TABLE transferencia (
    nro_trans INT UNSIGNED NOT NULL,
    nro_cliente SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    origen INT UNSIGNED NOT NULL,
    destino INT UNSIGNED NOT NULL,

    CONSTRAINT pk_transferencia
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_transf_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES transaccion_por_caja(nro_trans),

    CONSTRAINT fk_transf_clienteca
    FOREIGN KEY (nro_cliente, origen) REFERENCES cliente_ca(nro_cliente, nro_ca),

    CONSTRAINT fk_transf_caja_ahorro
    FOREIGN KEY (destino) REFERENCES caja_ahorro(nro_ca)
) ENGINE = InnoDB;

--USUARIO ADMIN 
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
--Acceso total sobre todas las tablas
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

DROP USER ' '@'localhost';--???

--USUARIO EMPLEADO
CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado'; --Se conecta desde cualquier direccion IP 
--Solo realizar consultas/lectura (SELECT) sobre:
GRANT SELECT ON banco.empleado TO 'empleado'@'%';
GRANT SELECT ON banco.sucursal TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_plazo_fijo TO 'empleado'@'%';
GRANT SELECT ON banco.tasa_prestamo TO 'empleado'@'%';
--Solo realizar consultas/lectura (SELECT) e ingresar datos (INSERT) sobre:
GRANT SELECT, INSERT ON banco.prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_fijo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.plazo_cliente TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.caja_ahorro TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.tarjeta TO 'empleado'@'%';
--Solo realizar consultas/lectura (SELECT), ingresar datos (INSERT) y modificar (UPDATE) sobre:
GRANT SELECT, INSERT, UPDATE ON banco.cliente_ca TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.cliente TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.pago TO 'empleado'@'%';

--USUARIO ATM
/* "Con el objetivo de ocultar la estructura de la base de datos, 
el usuario ATM tendra una vision restringida de la misma que solamente le 
permita ver informacion relacionada a las transacciones realizadas
sobre las cajas de ahorro. A tal efecto, se debera crear una vista con el
nombre trans_cajas_ahorro" */
-- Creamos la vista trans_caja_ahorro
CREATE VIEW trans_cajas_ahorro AS
SELECT 
    ca.nro_ca,
    ca.saldo,
    t.nro_trans,
    t.fecha,
    t.hora,
    t.tipo,
    t.monto,
    CASE
        WHEN t.tipo != 'debito' THEN t.cod_caja
        ELSE NULL
    END AS cod_caja,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.nro_cliente
        ELSE NULL
    END AS nro_cliente,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.tipo_doc
        ELSE NULL
    END AS tipo_doc,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.nro_doc
        ELSE NULL
    END AS nro_doc,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.nombre
        ELSE NULL
    END AS nombre,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.apellido
        ELSE NULL
    END AS apellido,
    CASE 
        WHEN t.tipo IN ('debito', 'extraccion', 'transferencia') THEN c.destino
        ELSE NULL
    END AS destino
FROM 
    cajas_ahorro ca 
    JOIN transacciones t ON ca.nro_ca = t.nro_ca
    LEFT JOIN clientes c ON t.nro_cliente = c.nro_cliente;

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';
--Solo realizar consulta/lectura (SELECT) sobre:
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
--Solo realizar consulta/lectura (SELECT) y modificar (UPDATE) sobre:
GRANT SELECT, UPDATE ON tarjeta TO 'atm'@'%';

