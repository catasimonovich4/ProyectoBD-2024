INSERT INTO Ciudad (codigo_postal, nombre) VALUES
(1001, 'Buenos Aires'),
(2000, 'Rosario'),
(5000, 'Córdoba'),
(7600, 'Mar del Plata'),
(8300, 'Neuquén');

INSERT INTO Sucursal (nombre, direccion, telefono, horario, codigo_postal) VALUES
('Sucursal Central', 'Av. 9 de Julio 100', '011-5555-1234', '9:00-17:00', 1001),
('Sucursal Norte', 'Calle Córdoba 200', '011-5555-5678', '9:00-17:00', 1001),
('Sucursal Rosario', 'Av. Belgrano 300', '0341-4444-4321', '9:00-17:00', 2000),
('Sucursal Córdoba', 'Calle Olmos 400', '0351-5555-6543', '9:00-17:00', 5000),
('Sucursal Mar del Plata', 'Av. Colón 500', '0223-4444-3210', '9:00-17:00', 7600);

INSERT INTO Empleado (apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) VALUES
('González', 'María', 'DNI', 30555333, 'Calle Falsa 123', '011-4444-1234', 'Gerente', MD5('password1'), 1),
('Fernández', 'Juan', 'DNI', 27888999, 'Av. Siempreviva 742', '011-3333-5678', 'Cajero', MD5('password2'), 2),
('Rodríguez', 'Ana', 'DNI', 32222333, 'Calle Primera 12', '0341-5555-4321', 'Asistente', MD5('password3'), 3),
('López', 'Carlos', 'DNI', 30111333, 'Calle Segunda 45', '0351-4444-6543', 'Cajero', MD5('password4'), 4),
('Martínez', 'Laura', 'DNI', 29000222, 'Calle Tercera 67', '0223-5555-3210', 'Gerente', MD5('password5'), 2);

INSERT INTO Cliente (nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES
(14598, 'Pérez', 'Jorge', 'DNI', 30888777, 'Av. Mitre 123', '011-2222-8765', '1980-05-23'),
(25896, 'Ramírez', 'Lucía', 'DNI', 32999666, 'Calle Francia 234', '0341-3333-1234', '1992-09-12'),
(31458, 'Alvarez', 'Pedro', 'DNI', 31888555, 'Calle San Martín 456', '011-5555-4321', '1975-12-30'),
(47852, 'García', 'Clara', 'DNI', 27777666, 'Calle Pueyrredón 678', '0351-4444-9876', '1990-07-15'),
(51523, 'Sosa', 'Esteban', 'DNI', 30333444, 'Calle Buenos Aires 890', '0223-6666-5432', '1985-02-10');

INSERT INTO Plazo_Fijo (capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) VALUES
(50000.00, '2024-01-01', '2024-05-02', 6.75, 1250.00, 1),
(70000.00, '2024-03-31', '2024-07-31', 6.80, 675.00, 2),
(10000.00, '2024-04-25', '2024-05-25', 5.50, 3000.00, 3),
(80000.00, '2024-05-15', '2024-11-15', 7.05, 425.00, 4),
(175000.00, '2024-08-17', '2025-08-17', 7.64, 2156.25, 5);

INSERT INTO Tasa_Plazo_Fijo (periodo, monto_inf, monto_sup, tasa) VALUES
(30, 0.00, 50000.00, 4.50),
(120, 50000.01, 100000.00, 5.00),
(360, 0.00, 50000.00, 5.25),
(90, 50000.01, 100000.00, 6.00);

INSERT INTO Prestamo (fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) VALUES
('2024-01-01', 24, 100000.00, 3.50, 3500.00, 4520.83, 1, 1),
('2024-02-01', 12, 50000.00, 4.00, 2000.00, 4333.33, 2, 2),
('2024-03-01', 36, 75000.00, 5.00, 3750.00, 2638.89, 3, 3),
('2024-04-01', 48, 200000.00, 4.50, 9000.00, 4770.83, 4, 4),
('2024-05-01', 18, 30000.00, 4.75, 1425.00, 2570.83, 5, 5);


