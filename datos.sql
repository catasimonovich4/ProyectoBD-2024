INSERT INTO Ciudad (cod_postal, nombre) VALUES
(1001, 'Buenos Aires'),
(2000, 'Rosario'),
(5000, 'Cordoba'),
(7600, 'Mar del Plata'),
(8300, 'Neuquen');

INSERT INTO Sucursal (nro_suc, nombre, direccion, telefono, horario, cod_postal) VALUES
(1,'Sucursal Central', 'Av. 9 de Julio 100', '011-5555-1234', '9:00-17:00', 1001),
(2,'Sucursal Norte', 'Calle Cordoba 200', '011-5555-5678', '9:00-17:00', 8300),
(3,'Sucursal Rosario', 'Av. Belgrano 300', '0341-4444-4321', '9:00-17:00', 2000),
(4,'Sucursal Cordoba', 'Calle Olmos 400', '0351-5555-6543', '9:00-17:00', 5000),
(5,'Sucursal Mar del Plata', 'Av. Colon 500', '0223-4444-3210', '9:00-17:00', 7600);

INSERT INTO Empleado (legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) VALUES
(1,'Gonzalez', 'Maria', 'DNI', 30555333, 'Calle Falsa 123', '011-4444-1234', 'Gerente', MD5('password1'), 1),
(2,'Fernandez', 'Juan', 'DNI', 27888999, 'Av. Siempreviva 742', '011-3333-5678', 'Cajero', MD5('password2'), 2),
(3,'Rodriguez', 'Ana', 'DNI', 32222333, 'Calle Primera 12', '0341-5555-4321', 'Asistente', MD5('password3'), 3),
(4,'Lopez', 'Carlos', 'DNI', 30111333, 'Calle Segunda 45', '0351-4444-6543', 'Cajero', MD5('password4'), 4),
(5,'Martinez', 'Laura', 'DNI', 29000222, 'Calle Tercera 67', '0223-5555-3210', 'Gerente', MD5('password5'), 5);

INSERT INTO Cliente (nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac) VALUES
(1, 'Perez', 'Jorge', 'DNI', 30888777, 'Av. Mitre 123', '011-2222-8765', '1980-05-23'),
(2, 'Ramirez', 'Lucia', 'DNI', 32999666, 'Calle Francia 234', '0341-3333-1234', '1992-09-12'),
(3, 'Alvarez', 'Pedro', 'DNI', 31888555, 'Calle San Martín 456', '011-5555-4321', '1975-12-30'),
(4, 'Garcia', 'Clara', 'DNI', 27777666, 'Calle Pueyrredon 678', '0351-4444-9876', '1990-07-15'),
(5, 'Sosa', 'Esteban', 'DNI', 30333444, 'Calle Buenos Aires 890', '0223-6666-5432', '1985-02-10');

INSERT INTO Plazo_Fijo (nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc) VALUES
(1, 50000.00, '2024-01-01', '2024-05-02', 6.75, 1128.08, 1), /*122 dias*/
(2, 70000.00, '2024-03-31', '2024-07-31', 6.80, 1591.01, 2), /*122*/
(3, 10000.00, '2024-04-25', '2024-05-25', 5.50, 45.20, 3), /*30*/
(4, 80000.00, '2024-05-15', '2024-11-15', 7.05, 2843.18, 4), /*184*/
(5, 175000.00, '2024-08-17', '2025-08-17', 7.64, 13406.63, 5); /*366*/

INSERT INTO Tasa_Plazo_Fijo (periodo, monto_inf, monto_sup, tasa) VALUES
(30, 0.00, 60000.00, 5.5),
(60 , 60000.00, 150000.00, 6.30),
(90, 60000.00, 150000.00, 6.55),
(120, 0.00, 60000, 6.75);

INSERT INTO Plazo_Cliente(nro_plazo, nro_cliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Prestamo (nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) VALUES
(1,'2024-01-01', 24, 27000.00, 27.00, 14580.00, 1222.94, 1, 1), 
(2,'2024-02-01', 12, 8600.00, 21.50, 1849.00, 870.75, 2, 2),
(3,'2024-03-01', 60, 7500.00, 20.00, 7500.00, 250.00, 3, 3),
(4,'2024-04-01', 120, 30000.00, 37.00, 111000.00, 1175.00, 4, 4),
(5,'2024-05-01', 6, 2500.00, 17.00, 2012.50, 452.08, 5, 5);

INSERT INTO Pago (nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES
(1, 1, '2024-02-01', '2024-02-01'),
(2, 1, '2024-03-01', '2024-03-01'),
(3, 1, '2024-04-01', '2024-04-02'),
(4, 1, '2024-05-01', '2024-05-01'),
(5, 1, '2024-06-01', '2024-06-05');

INSERT INTO Tasa_Prestamo (periodo, monto_inf, monto_sup, tasa) VALUES
(12, 0.00, 50000.00, 3.50),
(24, 50000.01, 100000.00, 4.00),
(36, 0.00, 50000.00, 4.50),
(48, 50000.01, 200000.00, 5.00);

INSERT INTO Caja_Ahorro (nro_ca, CBU, saldo) VALUES
(10, 1234567890123456, 5000.00),
(11, 2345678901234567, 15000.00),
(12, 3456789012345678, 10000.00),
(13, 4567890123456789, 2000.00),
(14, 5678901234567890, 7500.00);

INSERT INTO Cliente_CA (nro_cliente, nro_ca) VALUES
(1, 10),
(2, 11),
(3, 12),
(4, 13),
(5, 14);

INSERT INTO Tarjeta (nro_tarjeta, pin, cvt, fecha_venc, nro_cliente, nro_ca) VALUES
(4066451232147895, MD5('1234'), MD5('567'), '2035-12-31', 1, 10), 
(2315456987425632, MD5('4321'), MD5('765'), '2034-11-30', 2, 11),
(4562324895612345, MD5('9876'), MD5('543'), '2036-10-31', 3, 12),
(9874563298745610, MD5('1111'), MD5('222'), '2034-09-30', 4, 13),
(1203456978547895, MD5('9999'), MD5('333'), '2035-08-31', 5, 14);

INSERT INTO Caja (cod_caja) VALUES
(1),
(2),
(3),
(4),
(5);

INSERT INTO Ventanilla (cod_caja, nro_suc) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO ATM (cod_caja, cod_postal, direccion) VALUES
(1, 1001, 'Av. 9 de Julio 100'),
(2, 2000, 'Calle Córdoba 200'),
(3, 5000, 'Av. Belgrano 300'),
(4, 7600, 'Calle Olmos 400'),
(5, 8300, 'Av. Colón 500');

INSERT INTO Transaccion (nro_trans, fecha, hora, monto) VALUES
(1, '2024-09-17', '14:02:54' , 55000.00),
(2, '2024-06-23', '09:09:15' , 64000.50),
(3, '2023-12-01', '17:22:18' , 8000.20),
(4, '2023-11-01', '08:05:10' , 44560.00),
(5, '2024-05-29', '10:33:25' , 789500.00),
(6, '2023-07-25', '12:03:15' , 159500.00),
(7, '2024-10-29', '06:00:25' , 8900.00),
(8, '2025-12-13', '15:33:18' , 55600.00),    
(9, '2024-02-08', '09:33:25' , 7500.00),
(10, '2023-04-24', '04:15:25' , 789500),
(11, '2024-07-19', '19:10:08' , 500.00),
(12, '2024-02-13', '10:43:25' , 2500.00),
(13, '2024-10-22', '11:55:14' , 9540.00),
(14, '2024-01-24', '08:47:45' , 2500.00),
(15, '2024-06-10', '04:36:57' , 78000.00),
(16, '2024-08-09', '03:25:12' , 9630.00),
(17, '2024-09-03', '17:12:25' , 12500.00),
(18, '2024-10-02', '18:05:32' , 5600.00),
(19, '2024-11-07', '19:18:54' , 87500.00),
(20, '2024-04-13', '10:49:48' , 1230.00);


INSERT INTO Debito (nro_trans, descripcion, nro_cliente, nro_ca) VALUES 
(1, 'Pago luz', 1, 10),
(2, 'Regalo', 2, 11),
(3, 'Compra Supermercado', 3, 12),
(4, 'Pago Gas', 4, 13),
(5, 'Cuota Club', 5, 14);

INSERT INTO Transaccion_por_caja (nro_trans, cod_caja) VALUES
(6,  1),
(7,  2),
(8,  3),
(9,  4),
(10, 05),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);

INSERT INTO Deposito (nro_trans, nro_ca) VALUES
(6, 10),
(7, 11),
(8, 12),
(9, 13),
(10, 14);

INSERT INTO Extraccion (nro_trans, nro_cliente, nro_ca) VALUES
(11, 1, 10),
(12, 2, 11),
(13, 3, 12),
(14, 4, 13),
(15, 5, 14);

INSERT INTO Transferencia (nro_trans, nro_cliente, origen, destino) VALUES
(16, 1, 10, 11),
(17, 2, 11, 12),
(18, 3, 12, 13),
(19, 4, 13, 14),
(20, 5, 14, 10);







