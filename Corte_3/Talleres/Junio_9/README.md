# Operadores Lógicos y Relacionales en MongoDB

## Descripción

Este taller se desarrolló con el objetivo de comprender y aplicar de manera práctica los **operadores lógicos y relacionales de MongoDB**, que forman parte fundamental del lenguaje de consultas del motor NoSQL más utilizado en el mundo.

Estos operadores permiten construir filtros precisos, ejecutar búsquedas complejas, y manejar condiciones múltiples en documentos JSON. La finalidad es dotar al estudiante o desarrollador de herramientas sólidas para estructurar consultas eficientes, expresivas y reutilizables dentro de sus aplicaciones basadas en MongoDB.

## Función de los Operadores 

### Operadores Lógicos

Los operadores lógicos permiten combinar múltiples condiciones dentro de una consulta. Son clave para estructurar filtros avanzados y controlar la lógica de decisión que define qué documentos se deben recuperar.


| Operador |                         Función                        |                      Ejemplo de uso                        |
|----------|--------------------------------------------------------|------------------------------------------------------------|
|  `$and`  |    Requiere que **todas las condiciones** se cumplan.  |          Buscar usuarios activos con edad ≥ 25.            |
|  `$or`   |    Permite que **al menos una condición** se cumpla.   |  Buscar empleados del área de ventas o con salario > 4000. |
|  `$not`  |       **Invierte** el resultado de una expresión.      |      Excluir documentos donde la puntuación sea ≤ 3.       |
|  `$nor`  | Requiere que **ninguna** de las condiciones se cumpla. |    Buscar usuarios que no sean admin ni tengan acceso.     |


- **Importancia práctica:** Estos operadores permiten adaptar las consultas a escenarios reales como filtros múltiples en paneles de administración, condiciones excluyentes, validaciones de negocio complejas, etc.

### Operadores Relacionales

Los operadores relacionales permiten **comparar valores** entre campos y criterios específicos. Son esenciales para evaluar igualdad, diferencias y rangos numéricos o textuales.


| Operador |                                Función                               |                  Caso de uso típico                   |
|----------|----------------------------------------------------------------------|-------------------------------------------------------|
|   `$eq`  |     Verifica si un campo es **exactamente igual** al valor dado.     |         Buscar productos con nivel `"avanzado"`.      |
|   `$ne`  |         Verifica si un campo es **distinto** al valor dado.          |            Excluir estados `"inactivo"`.              |
|   `$gt`  |              Evalúa si un valor es **mayor que** otro.               |             Filtrar stock mayor a 100.                |
|  `$gte`  |              Evalúa si un valor es **mayor o igual**.                |            Empleados con experiencia ≥ 5 años.        |
|   `$lt`  |              Evalúa si un valor es **menor que** otro.               |             Turnos con menos de 40 horas.             |
|  `$lte`  |              Evalúa si un valor es **menor o igual**.                |               Estudiantes con edad ≤ 21.              |
|   `$in`  |         Verifica si el valor está dentro de un conjunto.             |    Categorías permitidas: `"tecnología"`, `"hogar"`.  |
|  `$nin`  |         Verifica que el valor **no** esté en una lista.              |  Usuarios que no sean `"visitante"` ni `"bloqueado"`. |
| `$exists`|         Verifica si un campo **existe** en el documento.             |    Asegurar que el campo `email` esté presente.       |
|  `$type` | Evalúa si el tipo de un campo corresponde a un tipo BSON específico. |         Validar que `fecha` sea tipo `"date"`.        |


- **Importancia práctica:** Los operadores relacionales permiten modelar condiciones numéricas, filtros por presencia de campos, validaciones de tipos de datos y más, cruciales en dashboards, reportes y validaciones del backend.

## Actividades Realizadas

### 1. Modelado de la base de datos

Se creó una base de datos llamada `operadores`, con las siguientes colecciones:

- `logicos`: Contiene documentos que describen operadores lógicos.
- `relacionales`: Contiene documentos que explican operadores de comparación y validación.

Cada documento en estas colecciones contiene:
- `titulo`
- `tipo`
- `descripcion`
- `sintaxis`
- `ejemplo`

### 2. Inserción de operadores

El archivo insert_operadores.json contiene scripts para insertar los operadores con su información semántica y estructurada. Esto permite utilizar la base como recurso de consulta o entrenamiento.

### 3. Consultas prácticas

El archivo consultas_operadores.json permite poner en práctica el uso de MongoDB mediante consultas como:

- Búsquedas por nombre exacto (`titulo`).
- Filtros por contenido textual (uso de expresiones regulares en `descripcion`).
- Proyecciones de campos (`titulo`, `tipo`).
- Conteo de documentos existentes en cada colección.
- Evaluación por condiciones como letras contenidas o terminaciones en el título.

## Objetivos del Taller

- Comprender la diferencia entre operadores lógicos y relacionales.
- Practicar inserciones organizadas y semánticas de documentos en MongoDB.
- Ejecutar consultas útiles para el análisis, validación y filtrado de datos reales.
- Reforzar el uso de expresiones regulares, proyecciones, y condicionales múltiples.

## Archivos del Taller


|           Archivo         |                                                           Descripción                                                              |
|---------------------------|------------------------------------------------------------------------------------------------------------------------------------|
|   `insert_operadores.json`  |     Script para insertar documentos en las colecciones `logicos` y `relacionales`. Contiene ejemplos, sintaxis y descripciones.    |
| `consultas_operadores.json` | Contiene ejemplos prácticos de consultas para explorar la base de datos creada. Ideal para practicar filtros, búsquedas y conteos. |


## Requisitos

- MongoDB instalado (local o en servidor).
- Mongo Shell (`mongo`) o MongoDB Compass.

## Referencias
Team, M. D. (s. f.). Operators. Database Manual - MongoDB Docs. https://www.mongodb.com/docs/manual/reference/operator/


