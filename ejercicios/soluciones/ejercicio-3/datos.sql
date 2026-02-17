-- -------------------------
-- PACIENTES (10)
-- -------------------------
INSERT INTO pacientes (nombre, apellidos, nif, email, telefono, fecha_nacimiento, direccion, codigo_postal, ciudad, provincia, pais) VALUES
('Pedro', 'Perez Alonso', '71234567V', 'email-1@hotmail.es', '+34 600 111 001', '1980-01-01', 'Calle Maria Moliner 10', '24009', 'León', 'León', 'España'),
('Pablo', 'Torbado Arias', '09876543R', 'email-2@hotmail.es', '+34 600 111 002', '1981-02-02', 'Avenida Los Esparragos 24 2-A', '47012', 'Valladolid', 'Valladolid', 'España'),
('Juan', 'Fernández Canseco', '71432567G', 'email-3@hotmail.es', '+34 600 111 003', '1983-03-03', 'Camino Las Cabra SN', '24760', 'Castrocalbon', 'León', 'España'),
('Ruben', 'Mantecon Gordon', '71431018C', 'email-4@hotmail.es', '+34 600 111 004', '1984-04-04', 'Calle Los Aluches 32', '24239', 'Cimanes de la Vega', 'León', 'España'),
('María', 'Aller Florez', '09123456H', 'email-5@hotmail.es', '+34 600 111 005', '1985-05-05', 'Calle Miguel de Unamuno 21 5-B', '39005', 'Santander', 'Cantabria', 'España'),
('Gloria', 'Turrado Maestre', '09654812B', 'email-6@hotmail.es', '+34 600 111 006', '1986-06-06', 'Camino Fuente Nueva 1', '09005', 'Burgos', 'Burgos', 'España'),
('Lucia', 'Pardo Sanjuan', '09456987G', 'email-7@hotmail.es', '+34 600 111 007', '1987-07-07', 'Ronda Las Americas 33 3-C', '47001', 'Valladolid', 'Valladolid', 'España'),
('Patricia', 'De la Varga Lucas', '71234876B', 'email-8@hotmail.es', '+34 600 111 008', '1988-08-08', 'Paseo El Prado 28', '28006', 'Madrid', 'Madrid', 'España'),
('Francisco', 'Vieitez Gutiérrez', '71435955E', 'email-9@hotmail.es', '+34 600 111 009', '1989-09-09', 'Calle Nueva 2', '24003', 'León', 'León', 'España'),
('Paula', 'Ditado Caravaca', '34651245N', 'email-10@hotmail.es', '+34 600 111 010', '1990-10-10', 'Calle La Vega 11 1-C', '24009', 'León', 'León', 'España');

-- -------------------------
-- MEDICOS (10)
-- -------------------------
INSERT INTO medicos (nombre, apellidos, numero_colegiado, colegio_medicos, especialidad, email, telefono, numero_consulta, fecha_alta) VALUES
('Ana', 'García López', 'A001234', 'León', 'cardiología', 'agl@mail.es', '+34 700 200 001', '22A', '1991-11-11'),
('Pedro', 'Pérez Moron', 'A001235', 'León', 'fisioterapia', 'ppm@mail.es', '+34 700 200 002', '1L', '1992-12-12'),
('Margarita', 'López Ruíz', 'A001236', 'Madrid', 'urología', 'mlr@mail.es', '+34 700 200 003', 'H5', '1993-03-03'),
('Eusebio', 'Ruiz Turrado', 'A001237', 'Salamanca', 'ginecología', 'ert@mail.es', '+34 700 200 004', 'R56', '1994-04-04'),
('Patricia', 'Martín Florez', 'A001238', 'Barcelona', 'cardiología', 'pmf@mail.es', '+34 700 200 005', '76H', '1995-05-05'),
('Carlos', 'Martínez Sánchez', 'A001239', 'Madrid', 'traumatología', 'cms@mail.es', '+34 700 200 006', '23N', '1996-06-06'),
('Marta', 'Navarrete Pol', 'A001230', 'Valladolid', 'traumatología', 'mnp@mail.es', '+34 700 200 007', 'I8', '1997-07-07'),
('Manuel', 'Beltran Romero', 'A001231', 'Santander', 'ginecología', 'mbr@mail.es', '+34 700 200 008', 'B78', '1998-08-08'),
('Paula', 'Magallanes Torres', 'A001232', 'Gijon', 'fisioterapia', 'pmt@mail.es', '+34 700 200 009', 'N12', '1999-09-09'),
('Ander', 'Bailez Díaz', 'A001233', 'León', 'cardiología', 'abd@mail.es', '+34 700 200 010', '24N', '2000-01-01');

-- -------------------------
-- CONSULTAS (10)
-- -------------------------
INSERT INTO consultas
(paciente_id, medico_id, motivo)
VALUES
(1, 1, 'Consulta'),
(2, 2, 'Revisión'),
(3, 3, 'Rehabilitación'),
(4, 4, 'Consulta'),
(5, 5, 'Análisis clínicos'),
(6, 6, 'Análisis clínicos'),
(7, 7, 'Rehabilitación'),
(8, 8, 'Consulta'),
(9, 9, 'Revisión'),
(10, 10, 'Análisis clínicos');

-- -------------------------
-- TRATAMIENTOS (10)
-- -------------------------
INSERT INTO tratamientos (consulta_id, fecha_inicio, fecha_finalizacion, pauta, descripcion) VALUES
(1, '2025-12-12', '2026-01-01', '2 comprimidos cada 8 horas', 'Despues de las comidas'),
(2, '2025-12-13', '2026-01-02', '1 sobre al día', ''),
(3, '2025-12-14', '2026-01-10', '2 comprimidos cada 12 horas', 'Antes del desayuno'),
(4, '2025-12-15', '2025-12-25', '1 comprimidos cada 8 horas', ''),
(5, '2025-12-16', '2026-01-08', '2 sobres al día', ''),
(6, '2025-12-17', '2026-01-07', '6 capsulas al mes', ''),
(7, '2025-12-18', '2025-12-31', '2 comprimidos cada 8 horas', ''),
(8, '2025-12-19', '2026-02-05', '1 aplicación cada 6 horas', ''),
(9, '2025-12-20', '2026-01-04', '1 supositorio al día', ''),
(10, '2025-12-21', '2025-12-24', '1 inyección al día', '');

-- -------------------------
-- FACTURAS (10)
-- -------------------------
INSERT INTO facturas (consulta_id, fecha_factura, importe) VALUES
(1, '2026-01-05', 9.99),
(2, '2026-01-08', 10.00),
(3, '2026-01-10', 5.55),
(4, '2026-01-12', 77.77),
(5, '2026-01-15', 66.60),
(6, '2026-01-18', 14.41),
(7, '2026-01-20', 21.12),
(8, '2026-01-22', 32.23),
(9, '2026-01-24', 8.88),
(10, '2026-01-28', 99.88);

-- -------------------------
-- PAGOS (10)
-- -------------------------
INSERT INTO pagos (factura_id, metodo, estado, fecha_pago, referencia_transaccion) VALUES
(1,  'tarjeta', 'pagado',      '2026-01-05 10:16:00+01', 'TXN-20260105-0001'),
(2,  'paypal', 'pagado',      '2026-01-08 18:41:00+01', 'TXN-20260108-0002'),
(3,  'tarjeta', 'pagado',      '2026-01-10 09:06:00+01', 'TXN-20260110-0003'),
(4,  'transferencia', 'pendiente',   NULL,                    'TXN-20260112-0004'),
(5,  'bizum', 'pagado',      '2026-01-15 20:12:00+01', 'TXN-20260115-0005'),
(6,  'tarjeta', 'pagado',      '2026-01-18 14:56:00+01', 'TXN-20260118-0006'),
(7,  'paypal', 'pendiente',   NULL,                    'TXN-20260120-0007'),
(8,  'tarjeta', 'pagado',      '2026-01-22 16:06:00+01', 'TXN-20260122-0008'),
(9,  'tarjeta', 'reembolsado', '2026-01-24 09:10:00+01', 'TXN-20260124-0009'),
(10, 'bizum', 'pagado',      '2026-01-28 19:26:00+01', 'TXN-20260128-0010');