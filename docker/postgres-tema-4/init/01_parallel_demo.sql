-- Crear tabla grande para demo de paralelismo (Tema 4)
CREATE TABLE IF NOT EXISTS ventas (
    id       BIGINT PRIMARY KEY,
    importe  INTEGER NOT NULL,
    fecha    TIMESTAMP NOT NULL
);

INSERT INTO ventas (id, importe, fecha)
SELECT
    g AS id,
    (random() * 1000)::int AS importe,
    (now() - (random() * 365 || ' days')::interval) AS fecha
FROM generate_series(1, 5000000) g;