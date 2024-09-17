INSERT INTO Ciudad (cod_postal, nombre) VALUES
(1001, 'Buenos Aires'),
(2000, 'Rosario'),
(5000, 'Córdoba'),
(7600, 'Mar del Plata'),
(8300, 'Neuquén');

INSERT INTO Sucursal (nro_suc, nombre, direccion, telefono, horario, cod_postal) VALUES
(001,'Sucursal Central', 'Av. 9 de Julio 100', '011-5555-1234', '9:00-17:00', 1001),
(002,'Sucursal Norte', 'Calle Córdoba 200', '011-5555-5678', '9:00-17:00', 8300),
(003,'Sucursal Rosario', 'Av. Belgrano 300', '0341-4444-4321', '9:00-17:00', 2000),
(004,'Sucursal Córdoba', 'Calle Olmos 400', '0351-5555-6543', '9:00-17:00', 5000),
(005,'Sucursal Mar del Plata', 'Av. Colón 500', '0223-4444-3210', '9:00-17:00', 7600);

INSERT INTO Empleado (legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) VALUES
(0001,'González', 'María', 'DNI', 30555333, 'Calle Falsa 123', '011-4444-1234', 'Gerente', MD5('password1'), 001),
(0002,'Fernández', 'Juan', 'DNI', 27888999, 'Av. Siempreviva 742', '011-3333-5678', 'Cajero', MD5('password2'), 002),
(0003,'Rodríguez', 'Ana', 'DNI', 32222333, 'Calle Primera 12', '0341-5555-4321', 'Asistente', MD5('password3'), 003),
(0004,'López', 'Carlos', 'DNI', 30111333, 'Calle Segunda 45', '0351-4444-6543', 'Cajero', MD5('password4'), 004),
(0005,'Martínez', 'Laura', 'DNI', 29000222, 'Calle Tercera 67', '0223-5555-3210', 'Gerente', MD5('password5'), 002);

INSERT INTO Cliente (nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES
(00001, 'Pérez', 'Jorge', 'DNI', 30888777, 'Av. Mitre 123', '011-2222-8765', '1980-05-23'),
(00002, 'Ramírez', 'Lucía', 'DNI', 32999666, 'Calle Francia 234', '0341-3333-1234', '1992-09-12'),
(00003, 'Alvarez', 'Pedro', 'DNI', 31888555, 'Calle San Martín 456', '011-5555-4321', '1975-12-30'),
(00004, 'García', 'Clara', 'DNI', 27777666, 'Calle Pueyrredón 678', '0351-4444-9876', '1990-07-15'),
(00005, 'Sosa', 'Esteban', 'DNI', 30333444, 'Calle Buenos Aires 890', '0223-6666-5432', '1985-02-10');

INSERT INTO Plazo_Fijo (nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) VALUES
(00000001, 50000.00, '2024-01-01', '2024-05-02', 6.75, 1250.00, 001),
(00000002, 70000.00, '2024-03-31', '2024-07-31', 6.80, 675.00, 002),
(00000003, 10000.00, '2024-04-25', '2024-05-25', 5.50, 3000.00, 003),
(00000004, 80000.00, '2024-05-15', '2024-11-15', 7.05, 425.00, 004),
(00000005, 175000.00, '2024-08-17', '2025-08-17', 7.64, 2156.25, 005);

INSERT INTO Tasa_Plazo_Fijo (periodo, monto_inf, monto_sup, tasa) VALUES
(30, 0.00, 50000.00, 4.50),
(120, 55000.01, 100000.00, 5.00),
(360, 1.00, 60000.00, 5.25),
(90, 50000.01, 100000.00, 6.00);

INSERT INTO Plazo_Cliente(nro_plazo, nro_cliente) VALUES
(00000001, 00001),
(00000002, 00002),
(00000003, 00003),
(00000004, 00004),
(00000005, 00005);

INSERT INTO Prestamo (nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) VALUES
(00000001,'2024-01-01', 24, 100000.00, 3.50, 3500.00, 4520.83, 0001, 00001), /*arreglar tasa interes y valor cuota*/
(00000002,'2024-02-01', 12, 50000.00, 4.00, 2000.00, 4333.33, 0002, 00002),
(00000003,'2024-03-01', 36, 75000.00, 5.00, 3750.00, 2638.89, 0003, 00003),
(00000004,'2024-04-01', 48, 200000.00, 4.50, 9000.00, 4770.83, 0004, 00004),
(00000005,'2024-05-01', 18, 30000.00, 4.75, 1425.00, 2570.83, 0005, 00005);

INSERT INTO Pago (nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES
(00000001, 01, '2024-02-01', '2024-02-01'),
(00000002, 01, '2024-03-01', '2024-03-01'),
(00000003, 01, '2024-04-01', '2024-04-02'),
(00000004, 01, '2024-05-01', '2024-05-01'),
(00000005, 01, '2024-06-01', '2024-06-05');

INSERT INTO Tasa_Prestamo (periodo, monto_inf, monto_sup, tasa) VALUES
(12, 0.00, 50000.00, 3.50),
(24, 50000.01, 100000.00, 4.00),
(36, 0.00, 50000.00, 4.50),
(48, 50000.01, 200000.00, 5.00);

INSERT INTO Caja_Ahorro (nro_ca, CBU, saldo) VALUES
(00000010, 1234567890123456, 5000.00),
(00000011, 2345678901234567, 15000.00),
(00000012, 3456789012345678, 10000.00),
(00000013, 4567890123456789, 2000.00),
(00000014, 5678901234567890, 7500.00);

INSERT INTO Cliente_CA (nro_cliente, nro_ca) VALUES
(00001, 00000010),
(00002, 00000011),
(00003, 00000012),
(00004, 00000013),
(00005, 00000014);

INSERT INTO Tarjeta (nro_tarjeta, pin, cvt, fecha_venc, nro_cliente, nro_ca) VALUES
(4066451232147895, MD5('1234'), MD5('567'), '2025-12-31', 00001, 00000010), 
(2315456987425632, MD5('4321'), MD5('765'), '2024-11-30', 00002, 00000011),
(4562324895612345, MD5('9876'), MD5('543'), '2026-10-31', 00003, 00000012),
(9874563298745610, MD5('1111'), MD5('222'), '2024-09-30', 00004, 00000013),
(1203456978547895, MD5('9999'), MD5('333'), '2025-08-31', 00005, 00000014);

INSERT INTO Caja (cod_caja) VALUES
(00001),
(00002),
(00003),
(00004),
(00005);

INSERT INTO Ventanilla (cod_caja, nro_suc) VALUES 
(00001, 001),
(00002, 002),
(00003, 003),
(00004, 004),
(00005, 005);

INSERT INTO ATM (cod_caja, cod_postal, direccion) VALUES
(00001, 1001, 'Av. 9 de Julio 100'),
(00002, 2000, 'Calle Córdoba 200'),
(00003, 5000, 'Av. Belgrano 300'),
(00004, 7600, 'Calle Olmos 400'),
(00005, 8300, 'Av. Colón 500');

INSERT INTO Transaccion (nro_trans, fecha, hora, monto) VALUES
(0000000001, '2024-09-17', '14:02:54' , 55000),
(0000000002, '2024-06-23', '09:09:15' , 64000),
(0000000003, '2023-12-01', '17:22:18' , 8000),
(0000000004, '2023-11-01', '08:05:10' , 44560),
(0000000005, '2024-05-29', '10:33:25' , 789500);

INSERT INTO Debito (nro_trans, descripcion, nro_cliente, nro_ca) VALUES 
(0000000001, 'Pago luz', 00001, 00000010),
(0000000002, 'Regalo', 00002, 00000011),
(0000000003, 'Compra Supermercado', 00003, 00000012),
(0000000004, 'Pago Gas', 00004, 00000013),
(0000000005, 'Cuota Club', 00005, 00000014);

INSERT INTO Transaccion_por_caja (nro_trans, cod_caja) VALUES
(0000000001, 00001),
(0000000002, 00002),
(0000000003, 00003),
(0000000004, 00004),
(0000000005, 00005);

INSERT INTO Deposito (nro_trans, nro_ca) VALUES
(0000000001, 00000010),
(0000000002, 00000011),
(0000000003, 00000012),
(0000000004, 00000013),
(0000000005, 00000014);

INSERT INTO Extraccion (nro_trans, nro_cliente, nro_ca) VALUES
(0000000001, 00001, 00000010),
(0000000002, 00002, 00000011),
(0000000003, 00003, 00000012),
(0000000004, 00004, 00000013),
(0000000005, 00005, 00000014);

INSERT INTO Transferencia (nro_trans, nro_cliente, origen, destino) VALUES
(0000000001, 00001, 00000010, 00000012),
(0000000002, 00002, 00000011, 00000010),
(0000000003, 00003, 00000012, 00000013),
(0000000004, 00004, 00000013, 00000010),
(0000000005, 00005, 00000014, 00000011);







