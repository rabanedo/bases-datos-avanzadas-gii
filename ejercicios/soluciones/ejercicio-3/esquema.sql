-- =========================================================
-- Sistema de Gestión de un Centro Médico Privado
-- =========================================================

-- -------------------------
-- PACIENTES
-- -------------------------
CREATE TABLE pacientes (
  paciente_id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre               VARCHAR(40) NOT NULL,
  apellidos            VARCHAR(80) NOT NULL,
  nif                  VARCHAR(10) NOT NULL,
  email                VARCHAR(120) NOT NULL UNIQUE,
  telefono             VARCHAR(20),
  fecha_nacimiento     DATE NOT NULL,
  direccion            VARCHAR(100) NOT NULL,
  codigo_postal        VARCHAR(10) NOT NULL,
  ciudad               VARCHAR(40) NOT NULL,
  provincia            VARCHAR(40),
  pais                 VARCHAR(40) NOT NULL
);

-- -------------------------
-- MÉDICOS
-- -------------------------
CREATE TABLE medicos (
  medico_id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre            VARCHAR(40) NOT NULL,
  apellidos         VARCHAR(80) NOT NULL,
  numero_colegiado  VARCHAR(20) NOT NULL UNIQUE,
  colegio_medicos   VARCHAR(40) NOT NULL,
  especialidad      VARCHAR(80) NOT NULL,
  email             VARCHAR(120) NOT NULL UNIQUE,
  telefono          VARCHAR(20),
  numero_consulta   VARCHAR(10),
  fecha_alta        DATE,
  CONSTRAINT chk_medicos_especialidad CHECK (especialidad IN ('cardiología', 'fisioterapia', 'ginecología', 'urología', 'traumatología'))
);

-- -------------------------
-- CONSULTAS
-- -------------------------
CREATE TABLE consultas (
  consulta_id       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  paciente_id       INT NOT NULL REFERENCES pacientes(paciente_id) ON DELETE RESTRICT,
  medico_id         INT NOT NULL REFERENCES medicos(medico_id) ON DELETE RESTRICT,
  fecha_consulta    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  motivo            VARCHAR(20),
  CONSTRAINT        chk_consultas_motivo CHECK (motivo IN ('Consulta', 'Revisión', 'Análisis clínicos', 'Rehabilitación'))
);

CREATE INDEX idx_consultas_paciente ON consultas(paciente_id);
CREATE INDEX idx_consultas_medico ON consultas(medico_id);

-- -------------------------
-- TRATAMIENTOS
-- -------------------------
CREATE TABLE tratamientos (
  tratamiento_id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  consulta_id           INT NOT NULL REFERENCES consultas(consulta_id) ON DELETE CASCADE,
  fecha_inicio          DATE NOT NULL,
  fecha_finalizacion    DATE,
  pauta                 VARCHAR(60) NOT NULL,
  descripcion           TEXT
);

CREATE INDEX idx_tratamientos_consulta ON tratamientos(consulta_id);

-- -------------------------
-- FACTURAS
-- -------------------------
CREATE TABLE facturas (
  factura_id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  consulta_id       INT NOT NULL REFERENCES consultas(consulta_id) ON DELETE RESTRICT,
  fecha_factura     DATE NOT NULL,
  importe           NUMERIC(12,2) NOT NULL,
  CONSTRAINT chk_facturas_importe CHECK (importe >= 0)
);

CREATE INDEX idx_facturas_consulta ON facturas(consulta_id);

-- -------------------------
-- PAGOS
-- -------------------------
CREATE TABLE pagos (
  pago_id                   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  factura_id                INT NOT NULL REFERENCES facturas(factura_id) ON DELETE CASCADE,
  metodo                    VARCHAR(20) NOT NULL,
  estado                    VARCHAR(20) NOT NULL,
  fecha_pago                TIMESTAMPTZ DEFAULT NOW(),
  referencia_transaccion VARCHAR(80) UNIQUE,
  CONSTRAINT chk_pagos_metodo CHECK (metodo IN ('tarjeta', 'paypal', 'transferencia', 'bizum')),
  CONSTRAINT chk_pagos_estado CHECK (estado IN ('pendiente', 'pagado', 'fallido', 'reembolsado'))
);

CREATE INDEX idx_pagos_factura ON pagos(factura_id);