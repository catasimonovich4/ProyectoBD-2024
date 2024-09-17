CREATE DATABASE banco;
USE banco;

CREATE TABLE Ciudad(
    cod_postal BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR (45) NOT NULL,

    CONSTRAINT pk_ciudad
    PRIMARY KEY (cod_postal)
) ENGINE=InnoDB;

CREATE TABLE Sucursal(
    nro_suc SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    telefono VARCHAR (15) NOT NULL,
    horario VARCHAR (45) NOT NULL,
    cod_postal BIGINT UNSIGNED NOT NULL,

    CONSTRAINT pk_sucursal
    PRIMARY KEY (nro_suc), 

    CONSTRAINT fk_suc_ciudad
    FOREIGN KEY (cod_postal) REFERENCES Ciudad (cod_postal)
        
) ENGINE=InnoDB;

CREATE TABLE Empleado(
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
    PRIMARY KEY (legajo),

    CONSTRAINT fk_empleado_suc 
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)    
) ENGINE=InnoDB;

CREATE TABLE Cliente (
    nro_cliente BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tipo_doc VARCHAR(20) NOT NULL,
    nro_doc BIGINT UNSIGNED NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    fecha_nac DATE NOT NULL,

    CONSTRAINT pk_cliente
    PRIMARY KEY (nro_cliente),

    KEY(nro_doc)
) ENGINE = InnoDB;

CREATE TABLE Plazo_Fijo(
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
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc),

    CHECK (tasa_interes > 0),
    CHECK (capital > 0),
    CHECK (interes >= 0)
) ENGINE = InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo INT UNSIGNED NOT NULL,
    monto_inf DECIMAL(16,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(16,2) UNSIGNED NOT NULL,
    tasa DECIMAL(4,2) UNSIGNED NOT NULL, 

    CONSTRAINT pk_tasa_plazo_fijo
    PRIMARY KEY (periodo, monto_inf, monto_sup) 
) ENGINE = InnoDB;

/*relacion*/
CREATE TABLE Plazo_Cliente (
    nro_plazo SMALLINT UNSIGNED NOT NULL,
    nro_cliente BIGINT UNSIGNED NOT NULL,

    CONSTRAINT pk_plazo_cliente
    PRIMARY KEY (nro_plazo, nro_cliente),

    CONSTRAINT fk_plazo_cliente_plazo_fijo
    FOREIGN KEY (nro_plazo) REFERENCES Plazo_Fijo(nro_plazo),
    
    CONSTRAINT fk_plazo_cliente_cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
 ) ENGINE = InnoDB;

CREATE TABLE Prestamo (
    nro_prestamo INT UNSIGNED AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    cant_meses SMALLINT UNSIGNED NOT NULL,
    monto DECIMAL(10,2) UNSIGNED NOT NULL,
    tasa_interes DECIMAL(4,2) UNSIGNED NOT NULL,
    interes DECIMAL(9,2) UNSIGNED NOT NULL,
    valor_cuota DECIMAL(9,2) UNSIGNED NOT NULL,
    legajo BIGINT UNSIGNED NOT NULL,
    nro_cliente BIGINT UNSIGNED NOT NULL,
    
    CONSTRAINT pk_prestamo
    PRIMARY KEY (nro_prestamo),

    CONSTRAINT fk_prestamo_empleado
    FOREIGN KEY (legajo) REFERENCES Empleado(legajo),

    CONSTRAINT fk_prestamo_cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
    
) ENGINE = InnoDB;

CREATE TABLE Pago (
    nro_prestamo INT UNSIGNED NOT NULL,
    nro_pago SMALLINT UNSIGNED NOT NULL,
    fecha_venc DATE NOT NULL,
    fecha_pago DATE,
    
    CONSTRAINT pk_pago
    PRIMARY KEY (nro_prestamo, nro_pago),

    CONSTRAINT fk_pago_prestamo
    FOREIGN KEY (nro_prestamo) REFERENCES Prestamo(nro_prestamo)
) ENGINE = InnoDB;

CREATE TABLE Tasa_Prestamo (
    periodo SMALLINT UNSIGNED,
    monto_inf DECIMAL(10,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(10,2) UNSIGNED NOT NULL,
    tasa DECIMAL(4,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_tasa_prestamo
    PRIMARY KEY (periodo, monto_inf, monto_sup)
) ENGINE = InnoDB;

CREATE TABLE Caja_Ahorro(
    nro_ca SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    CBU BIGINT UNSIGNED NOT NULL,
    saldo DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_caja_ahorro
    PRIMARY KEY (nro_ca)
) ENGINE = InnoDB;

/*relacion*/
CREATE TABLE Cliente_CA (
    nro_cliente BIGINT UNSIGNED NOT NULL,
    nro_ca SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_cliente_ca
    PRIMARY KEY (nro_cliente, nro_ca),

    CONSTRAINT fk_clienteca_cliente
    FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente),
    FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
) ENGINE = InnoDB;

CREATE TABLE Tarjeta (
    nro_tarjeta BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    pin VARCHAR(32) NOT NULL, /*hash MD5*/
    cvt VARCHAR(32) NOT NULL, /*hash MD5*/
    fecha_venc DATE NOT NULL,
    nro_cliente BIGINT UNSIGNED NOT NUll,
    nro_ca SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_tarjeta
    PRIMARY KEY (nro_tarjeta),

    CONSTRAINT fk_tarjeta_cliente
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES Cliente_CA(nro_cliente, nro_ca)
) ENGINE = InnoDB;

CREATE TABLE Caja(
    cod_caja SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,

    CONSTRAINT pk_caja
    PRIMARY KEY (cod_caja)
)ENGINE = InnoDB;

CREATE TABLE Ventanilla(
    cod_caja SMALLINT UNSIGNED NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_ventanilla
    PRIMARY KEY (cod_caja),

    CONSTRAINT fk_ventanilla_caja
    FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja),

    CONSTRAINT fk_ventanilla_suc
    FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
) ENGINE = InnoDB;

CREATE TABLE ATM(
    cod_caja SMALLINT UNSIGNED NOT NULL,
    cod_postal BIGINT UNSIGNED NOT NULL,
    direccion VARCHAR(150) NOT NULL,

    CONSTRAINT pk_atm
    PRIMARY KEY (cod_caja),

    CONSTRAINT fk_atm_caja
    FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja),

    CONSTRAINT fk_atm_ciudad
    FOREIGN KEY (cod_postal) REFERENCES Ciudad(cod_postal)
) ENGINE = InnoDB;

CREATE TABLE Transaccion (
    nro_trans INT UNSIGNED AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL, 
    monto DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_transaccion
    PRIMARY KEY (nro_trans)
) ENGINE = InnoDB;

CREATE TABLE Debito (
    nro_trans INT UNSIGNED NOT NULL,
    descripcion TINYTEXT,
    nro_cliente BIGINT UNSIGNED NOT NULL, 
    nro_ca SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_debito
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_debito_clienteca
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES Cliente_CA(nro_cliente, nro_ca),

    CONSTRAINT fk_debito_transaccion
    FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
) ENGINE = InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans INT UNSIGNED NOT NULL,
    cod_caja SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_transaccion_por_caja
    PRIMARY KEY (nro_trans), 

    CONSTRAINT fk_transpcaja_transaccion
    FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans),

    CONSTRAINT fk_transpcaja_caja
    FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
) ENGINE = InnoDB;

CREATE TABLE Deposito (
    nro_trans INT UNSIGNED NOT NULL,
    nro_ca SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_deposito
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_deposito_caja_ahorro
    FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca),

    CONSTRAINT fk_deposito_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
) ENGINE = InnoDB;

CREATE TABLE Extraccion (
    nro_trans INT UNSIGNED NOT NULL,
    nro_cliente BIGINT UNSIGNED NOT NULL,
    nro_ca SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_extraccion
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_extraccion_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans),

    CONSTRAINT fk_extraccion_clienteca
    FOREIGN KEY (nro_cliente, nro_ca) REFERENCES Cliente_CA(nro_cliente, nro_ca)
) ENGINE = InnoDB;

CREATE TABLE Transferencia (
    nro_trans INT UNSIGNED NOT NULL,
    nro_cliente BIGINT UNSIGNED NOT NULL,
    origen SMALLINT UNSIGNED NOT NULL,
    destino SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT pk_transferencia
    PRIMARY KEY (nro_trans),

    CONSTRAINT fk_transf_transpcaja
    FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans),

    CONSTRAINT fk_transf_clienteca
    FOREIGN KEY (nro_cliente, origen) REFERENCES Cliente_CA(nro_cliente, nro_ca),

    CONSTRAINT fk_transf_caja_ahorro
    FOREIGN KEY (destino) REFERENCES Caja_Ahorro(nro_ca)
) ENGINE = InnoDB;

#USUARIO ADMIN
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';
#Acceso total sobre todas las tablas
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;


#USUARIO EMPLEADO
CREATE USER IF NOT EXISTS 'empleado'@'%' IDENTIFIED BY 'empleado'; 
#Solo realizar consultas/lectura (SELECT) sobre:
GRANT SELECT ON banco.Empleado TO 'empleado'@'%';
GRANT SELECT ON banco.Sucursal TO 'empleado'@'%';
GRANT SELECT ON banco.Tasa_Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT ON banco.Tasa_Prestamo TO 'empleado'@'%';
#Solo realizar consultas/lectura (SELECT) e ingresar datos (INSERT) sobre:
GRANT SELECT, INSERT ON banco.Prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Plazo_Cliente TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Caja_Ahorro TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Tarjeta TO 'empleado'@'%';
#Solo realizar consultas/lectura (SELECT), ingresar datos (INSERT) y modificar (UPDATE) sobre:
GRANT SELECT, INSERT, UPDATE ON banco.Cliente_CA TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Cliente TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Pago TO 'empleado'@'%';

#USUARIO ATM
/* "Con el objetivo de ocultar la estructura de la base de datos, 
el usuario ATM tendra una vision restringida de la misma que solamente le 
permita ver informacion relacionada a las transacciones realizadas
sobre las cajas de ahorro. A tal efecto, se debera crear una vista con el
nombre trans_cajas_ahorro" */
# Creamos la vista trans_caja_ahorro
CREATE VIEW trans_cajas_ahorro AS
SELECT 
    ca.nro_ca,
    ca.saldo,
    t.nro_trans,
    t.fecha,
    t.hora,
    CASE
        WHEN d.nro_trans IS NOT NULL THEN 'debito'
        WHEN e.nro_trans IS NOT NULL THEN 'extraccion'
        WHEN tr.nro_trans IS NOT NULL THEN 'transferencia'
        WHEN dep.nro_trans IS NOT NULL THEN 'deposito'
    END AS tipo,
    t.monto,
    CASE
        WHEN d.nro_trans IS NULL THEN tpc.cod_caja
        ELSE NULL
    END AS cod_caja,
    COALESCE(d.nro_cliente, e.nro_cliente, tr.nro_cliente) AS nro_cliente,
    c.tipo_doc,
    c.nro_doc,
    c.nombre,
    c.apellido,
    CASE
        WHEN tr.nro_trans IS NOT NULL THEN tr.destino
        ELSE NULL
    END AS destino
FROM 
    Transaccion t
    LEFT JOIN Debito d ON t.nro_trans = d.nro_trans
    LEFT JOIN Extraccion e ON t.nro_trans = e.nro_trans
    LEFT JOIN Transferencia tr ON t.nro_trans = tr.nro_trans
    LEFT JOIN Deposito dep ON t.nro_trans = dep.nro_trans
    LEFT JOIN Transaccion_por_caja tpc ON t.nro_trans = tpc.nro_trans
    LEFT JOIN Cliente c ON COALESCE(d.nro_cliente, e.nro_cliente, tr.nro_cliente) = c.nro_cliente
    LEFT JOIN Caja_Ahorro ca ON 
        CASE
            WHEN d.nro_trans IS NOT NULL THEN d.nro_ca
            WHEN e.nro_trans IS NOT NULL THEN e.nro_ca
            WHEN tr.nro_trans IS NOT NULL THEN tr.origen
            WHEN dep.nro_trans IS NOT NULL THEN dep.nro_ca
        END = ca.nro_ca
WHERE 
    d.nro_trans IS NOT NULL OR 
    e.nro_trans IS NOT NULL OR 
    tr.nro_trans IS NOT NULL OR 
    dep.nro_trans IS NOT NULL;

CREATE USER IF NOT EXISTS 'atm'@'%' IDENTIFIED BY 'atm';
#Solo realizar consulta/lectura (SELECT) sobre:
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
#Solo realizar consulta/lectura (SELECT) y modificar (UPDATE) sobre:
GRANT SELECT, UPDATE ON Tarjeta TO 'atm'@'%';

