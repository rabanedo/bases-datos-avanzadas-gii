# Solución Ejercicio 1: Sistema de Gestión de Comercio Electrónico Multivendedor

## Parte 1: Diagrama E-R

```mermaid
erDiagram
    PACIENTES ||--o{ CONSULTAS : solicita
    MEDICOS ||--o{ CONSULTAS : atiende
    CONSULTAS ||--o{ TRATAMIENTOS : prescribe
    CONSULTAS ||--o| FACTURAS : emite
    FACTURAS ||--o{ PAGOS : ocasiona

    PACIENTES {
        int paciente_id PK
        varchar nombre
        varchar apellidos
        varchar nif
        varchar email
        varchar telefono
        date fecha_nacimiento
        date fecha_alta
        varchar direccion
        varchar codigo_postal
        varchar ciudad
        varchar provincia
        varchar pais
    }

    MEDICOS {
        int medico_id PK
        varchar nombre
        varchar apellidos
        varchar numero_colegiado
        varchar colegio_medicos
        varchar especialidad
        varchar email
        varchar telefono
        varchar numero_consulta
        date fecha_alta
    }

    CONSULTAS {
        int consulta_id PK
        int paciente_id FK
        int medico_id FK
        timestamptz fecha_consulta
        varchar motivo
    }

    TRATAMIENTOS {
        int tratamiento_id PK
        int consulta_id FK
        date fecha_inicio
        date fecha_finalizacion
        varchar pauta
        text descripcion
    }

    FACTURAS {
        int factura_id PK
        int consulta_id FK
        date fecha_factura
        numeric importe
    }

    PAGOS {
        int pago_id PK
        int factura_id FK
        varchar metodo
        varchar estado
        timestamptz fecha_pago
        varchar referencia_transaccion
    }
```

## Código SQL

* [Parte 2: Script para creación de la base de datos](esquema.sql)

* [Parte 3: Script para inserción de datos](datos.sql)
