# Laboratorio. Diseño de una base de datos relacional

## 🎯 Objetivo principal

Diseñar e implementar una base de datos relacional que almacene la información sobre **precios de carburantes en España**, publicada por el Ministerio para la Transición Ecológica y el Reto Demográfico.

La actividad busca que los alumnos refuercen los fundamentos de diseño de bases de datos y adquieran autonomía en el modelado de bases de datos relacionales a partir de datos reales.

## 🧰 Herramientas necesarias

* **Base de datos:** MySQL, PostgreSQL u Oracle SQL (se pueden ejecutar en local o con Docker).
* **Editor SQL:** DataGrip, MySQL Workbench, PgAdmin o DBeaver.

Los alumnos que decidan realizar la carga de datos, deberán considerar las siguientes herramientas:

* **IDE o editor de texto:** VS Code, IntelliJ IDEA, Notepad++, SublimeText, o cualquier otro.
* **Lenguaje de programación:** Cualquier lenguaje de su preferencia, debiéndose indicar en la memora.

## 🧠 **Tareas que deben realizar los alumnos**

> 📣 **Importante:** Todos los alumnos deberá realizar y entregar las fases 1 y 2 descritas a continuación. Las fases 3 y 4, son opcionales.

### 🪜 **Fase 1 — Análisis y diseño**

1. **Explorar los [datos fuente sobre estaciones de servicio](https://geoportalgasolineras.es/geoportal-instalaciones/DescargarFicheros)** del Ministerio para la Transición Ecológica y el Reto Demográfico.

2. **Identificar la información clave** que debe almacenar la base de datos, por ejemplo:

   * Provincia, municipio, localidad, código postal y dirección.
   * Margen, latitud, longitud.
   * Fecha de última actualización y precios de carburantes.
   * Horario e información de la empresa operadora.
   * Tipo de carburante
   * Tipo de estación de servicio

3. **Diseñar un modelo entidad–relación (E/R)** que permita almacenar todos esos datos para poder realizar consultas.

4. **Justificar las relaciones y atributos** elegidos en el diseño y explicarlos en la videomemoria.

### 🪜 **Fase 2 — Creación del esquema relacional**

1. **Escribir el script DDL (SQL)** que construya el esquema diseñado.

   * Crear tablas, claves primarias, foráneas y tipos adecuados.
   * Verificar que el modelo físico corresponde al diagrama E/R.

### 🪜 **Fase 3 — Ingesta de datos (_opcional_)**

1. **Desarrollar un programa en el lenguaje de programación elegido** que realice lo siguiente:

   * Lea los datos en texto plano descargados de la web del Ministerio.
   * Transforme y cargue la información en las tablas de la base de datos.
   * Muestre evidencias del proceso (por ejemplo, consola o logs).

2. **Comprobar la carga completa:**

   * Mostrar la base de datos vacía.
   * Ejecutar la carga.
   * Mostrar los datos insertados correctamente.

### 🪜 **Fase 4 — Consultas SQL (_opcional)**

1. Implementar y probar las siguientes consultas:

   * Empresa con **más estaciones terrestres**.
   * Empresa con **más estaciones marítimas**.
   * **Estación más barata** para _Gasolina 95 E5_ en la Comunidad de Madrid.
   * Estación más barata para _Gasóleo A_ **a menos de 10 km** del centro de Albacete.
   * Provincia con la **estación marítima más cara** de _Gasolina 95 E5_.

2. Guardar las consultas como ficheros '.sql` para la entrega.

## 📦 Entrega y vídeomemoria

Preparar un archivo **ZIP** con lo siguiente:

* 📄 Diagrama E/R.
* 🧱 Archivo DDL con el esquema.
* ☕ Código de ingesta de datos (opcional).
* 🔍 Consultas SQL y resultados (opcional).
* 🎥 **Vídeomemoria (máx. 10 min)** explicando:

  * El diagrama E/R y el DDL.
  * En caso de haber realizado las fases opcionales, explicar como se cargan los datos (mostrar BD vacía y luego llena) y la ejecución de las consultas pedidas.

## 👩🏻‍🏫 Rúbrica de evaluación

| Criterio  | Descripción                                       | Puntos     | Peso     |
| --------- | ------------------------------------------------- | ---------- | -------- |
| 1         | Diseño correcto y justificado del esquema E/R     | 4          | 40%      |
| 2         | DDL coherente con el modelo E/R                   | 3          | 30%      |
| 3         | Vídeomemoria completa, clara y ajustada en tiempo | 3          | 30%      |
| **Total** |                                                   | **10 pts** | **100%** |
