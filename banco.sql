CREATE DATABASE banco;
USE banco;
CREATE TABLE ciudad(
    codigo_postal BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL,

    CONSTRAINT pk_ciudad
    PRIMARY KEY (codigo_postal)
) ENGINE=InnoDB;

CREATE TABLE sucursal(
    nro_suc SMALLINT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    horario VARCHAR(45) NOT NULL,
    codigo_postal BIGINT UNSIGNED NOT NULL,

    CONSTRAINT pk_sucursal
    PRIMARY KEY (nro_suc)  

    CONSTRAINT fk_suc_ciudad
    FOREIGN KEY (codigo_postal) REFERENCES ciudad (codigo_postal)
        ON DELETE RESTRICT ON UPDATE CASCADE, 
) ENGINE=InnoDB;

CREATE TABLE empleado(
    legajo BIGINT UNSIGNED NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tipo_doc VARCHAR(45) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    password CHAR(32),

    CONSTRAINT pk_empleado
    PRIMARY KEY (legajo)
)ENGINE=InnoDB;

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
) ENGINE = InnoDB;

CREATE TABLE plazo_fijo(
    nro_plazo INT UNSIGNED NOT NULL,
    capital DECIMAL(16,2) UNSIGNED NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tasa_interes DECIMAL(16,2) UNSIGNED NOT NULL,
    interes DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_plazo_fijo
    PRIMARY KEY (nro_plazo)
) ENGINE = InnoDB;

CREATE TABLE taza_plazo_fijo (
    periodo SMALLINT UNSIGNED NOT NULL,
    monto_inf DECIMAL(16,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(16,2) UNSIGNED NOT NULL,
    tasa DECIMAL(16,2) UNSIGNED NOT NULL, 

    CONSTRAINT pk_taza_plazo_fijo
    PRIMARY KEY (periodo, monto_inf, monto_sup) 
) ENGINE = InnoDB;

CREATE TABLE prestamo (
    nro_prestamo INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    cant_meses INT UNSIGNED NOT NULL,
    monto DECIMAL(16,2) UNSIGNED NOT NULL,
    tasa_interes DECIMAL(16,2) UNSIGNED NOT NULL,
    interes DECIMAL(16,2) UNSIGNED NOT NULL,
    valor_cuota DECIMAL(16,2) UNSIGNED NOT NULL,
    
    CONSTRAINT pk_prestamo
    PRIMARY KEY (nro_prestamo)
) ENGINE = InnoDB;

CREATE TABLE pago(
    nro_pago SMALLINT UNSIGNED NOT NULL,
    fecha_venc DATE NOT NULL,
    fecha_pago DATE NOT NULL,
    
    CONSTRAINT pk_pago
    PRIMARY KEY (nro_pago)
) ENGINE = InnoDB;

CREATE TABLE tasa_prestamo (
    periodo INT UNSIGNED NOT NULL,
    monto_inf DECIMAL(16,2) UNSIGNED NOT NULL,
    monto_sup DECIMAL(16,2) UNSIGNED NOT NULL,
    tasa DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_tasa_prestamo
    PRIMARY KEY (periodo, monto_inf, monto_sup)
) ENGINE = InnoDB;

CREATE TABLE caja_ahorro(
    nro_ca INT UNSIGNED NOT NULL,
    CBU INT UNSIGNED NOT NULL,
    saldo DECIMAL(16,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_caja_ahorro
    PRIMARY KEY (nro_ca)
)ENGINE = InnoDB;

CREATE TABLE tarjeta (
    nro_tarjeta BIGINT UNSIGNED NOT NULL,
    pin VARCHAR(32) NOT NULL, --hash MD5
    cvt VARCHAR(32) NOT NULL, --hash MD5
    fecha_venc DATE NOT NULL,
    nro_cliente BIGINT NOT NUll,

    FOREIGN KEY (nro_cliente) REFERENCES cliente (nro_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE, --ok?
)

CREATE TABLE caja(
    cod_caja INT UNSIGNED NOT NULL,

    CONSTRAINT pk_caja
    PRIMARY KEY (cod_caja)
)ENGINE = InnoDB;

CREATE TABLE ventanilla(
    cod_caja INT UNSIGNED NOT NULL,
    nro_suc SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY (cod_caja),
    FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
         ON DELETE RESTRICT ON UPDATE CASCADE, 
)ENGINE = InnoDB;

CREATE TABLE atm(
    cod_caja INT UNSIGNED NOT NULL,
    codigo_postal BIGINT UNSIGNED NOT NULL,
    direccion 
)