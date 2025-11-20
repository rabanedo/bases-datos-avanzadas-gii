# 🧪 Ejemplo de Paralelismo en PostgreSQL

Este ejemplo permite observar cómo un sistema gestor de bases de datos moderno, como PostgreSQL, puede **acelerar la ejecución de una consulta** usando **paralelismo intra-consulta** cuando trabaja con tablas grandes.

El objetivo es comparar dos escenarios:

1. **Ejecución secuencial** (sin paralelismo)
2. **Ejecución paralela** (con varios workers trabajando al mismo tiempo)

Y analizar cómo cambia el plan de ejecución de la consulta.

## 🛠️ Conectar pgAdmin a la base de datos

1. Click en Add New Server.

2. Pestaña General:

   * Name: `demos-db`

3. Pestaña Connection:

   * Host: `demos-db`
   * Port: `5432`
   * Username: `profesor`
   * Password: `postgres`

Activar “Save Password”.

## 1️⃣ ¿Por qué usamos una tabla grande?

La tabla `ventas` contiene **5 millones de registros**.
Esto es intencionado: una consulta pequeña no justifica el uso de paralelismo porque:

* La sobrecarga de coordinar procesos es mayor que el beneficio.
* Los optimizadores de consulta sólo deciden paralelizar cuando hay suficiente trabajo.

➡️ Con tablas grandes, PostgreSQL decide que **la ganancia supera el coste**, y activa el paralelismo.

## 2️⃣ Parámetro clave: `max_parallel_workers_per_gather`

Este parámetro controla cuántos procesos paralelos puede usar PostgreSQL para ejecutar una consulta.

El siguiente comando nos permite ver la configuración de paralelismo actual:

```sql
SHOW max_parallel_workers_per_gather;
```

En cualquier momento, se puede desactivar el paralelismo con el siguiente comando:

```sql
SET max_parallel_workers_per_gather = 0;  -- Paralelismo desactivado
```

El motor ejecuta la consulta **de manera secuencial**.

Con el siguiente comando, PostgreSQL puede dividir el trabajo entre varios procesos y **recolectar** los resultados (operación `Gather`).

```sql
SET max_parallel_workers_per_gather = 4;  -- Hasta 4 workers en paralelo
```

## 3️⃣ Consulta que usaremos para probar el paralelismo

La consulta agrupa millones de registros por mes y calcula la suma de importes:

```sql
SELECT date_trunc('month', fecha) AS mes, sum(importe)
FROM ventas
GROUP BY 1
ORDER BY 1;
```

Esta consulta incluye:

* **Lectura completa** de la tabla (`Seq Scan` o `Parallel Seq Scan`)
* **Agrupación**
* **Ordenación**

Es perfecta para que el planner decida usar paralelismo.

---

## 4️⃣ Interpretación de los planes de ejecución (EXPLAIN ANALYZE)

### 🔵 Sin paralelismo (`max_parallel_workers_per_gather = 0`)

```sql
-- Forzar sin paralelismo
SET max_parallel_workers_per_gather = 0;

EXPLAIN ANALYZE
SELECT date_trunc('month', fecha) AS mes, sum(importe)
FROM ventas
GROUP BY 1
ORDER BY 1;
```

El plan típico mostrará:

* `Seq Scan on ventas`
* Un solo proceso recorre los millones de registros.
* Tiempo total significativamente mayor.

➡️ Relación con el Tema 4: **tiempo de respuesta alto** en ejecución secuencial.

---

### 🔴 Con paralelismo (`max_parallel_workers_per_gather = 4`)

```sql
-- Activar paralelismo
SET max_parallel_workers_per_gather = 4;

EXPLAIN ANALYZE
SELECT date_trunc('month', fecha) AS mes, sum(importe)
FROM ventas
GROUP BY 1
ORDER BY 1;
```

El plan mostrará:

* `Gather` o `Gather Merge`
* `Parallel Seq Scan`
* Varias líneas indicando `Workers Planned` y `Workers Launched`
* Tiempos totales notablemente menores (dependiendo del hardware)

Cada “worker” escanea una parte diferente de la tabla:

* Worker 1: filas 1–1.25 M
* Worker 2: filas 1.25–2.5 M
* Worker 3: filas 2.5–3.75 M
* Worker 4: filas 3.75–5 M

Luego PostgreSQL combina los resultados.

➡️ Relación con el Tema 4:

* **Paralelismo en operaciones** (scans y aggregates paralelos)
* **Mejora del tiempo de respuesta**
* **Ganancia sublineal** (nunca es 4× más rápido, pero sí bastante más rápido)

---

## 5️⃣ Aprendizaje de este ejercicio

1. Significado de paralelizar una consulta y cómo lo hace un SGBD real.
2. Cómo un SGBD decide cuándo **vale la pena usar paralelismo**.
3. Cómo interpretar un **plan de ejecución paralelo**:

   * `Parallel Seq Scan`
   * `Workers Planned`
   * `Workers Launched`
   * `Gather`
4. Por qué los sistemas paralelos tienen:

   * **Ganancias de velocidad**
   * **Interferencia entre procesos**
   * **Escalabilidad limitada**
5. Que el paralelismo es **intra-consulta**.
