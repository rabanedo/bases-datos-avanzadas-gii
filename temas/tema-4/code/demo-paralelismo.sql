-- Recolectar estadísticas de la tabla ventas
ANALYZE ventas;

-- Ver configuración de paralelismo
SHOW max_parallel_workers_per_gather;

-- Forzar sin paralelismo
SET max_parallel_workers_per_gather = 0;

EXPLAIN ANALYZE
SELECT date_trunc('month', fecha) AS mes, sum(importe)
FROM ventas
GROUP BY 1
ORDER BY 1;

-- Activar paralelismo
SET max_parallel_workers_per_gather = 4;

EXPLAIN ANALYZE
SELECT date_trunc('month', fecha) AS mes, sum(importe)
FROM ventas
GROUP BY 1
ORDER BY 1;
