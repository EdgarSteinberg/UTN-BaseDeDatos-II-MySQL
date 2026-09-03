# Normalización de bases de datos

La **normalización** es un proceso para organizar los datos en tablas de forma que se reduzcan la redundancia y se eviten anomalías de inserción, actualización y eliminación.

> **Importante:** tener una clave primaria no significa que una tabla esté automáticamente normalizada.

---

## 1FN — Primera Forma Normal

Una tabla está en **1FN** cuando:

- Todos sus valores son **atómicos**.
- No existen **grupos repetidos**.
- No existen columnas que almacenen **listas de valores**.

### ¿Qué significa "atómico"?

Un valor es atómico cuando una celda contiene **un único valor** para ese atributo.

Por ejemplo, esto rompe 1FN:

```text
Contenido_Categorias
--------------------
Documental, Drama
```

La columna está almacenando una lista de categorías dentro de una misma celda.

En cambio:

```text
Categoria
---------
Documental
```

contiene un único valor.

**Idea clave:**

> **1FN → valores atómicos, sin listas ni grupos repetidos.**

### Ejemplo del profesor

Una tabla desnormalizada puede tener:

```sql
Contenido_Categorias VARCHAR(200)
```

con valores como:

```text
'Documental, Naturaleza'
```

El problema es que una misma celda contiene más de una categoría. Por eso no cumple con el principio de valores atómicos de 1FN.

---

## Anomalías

Una mala organización de los datos puede producir **anomalías**. Las tres principales son:

### 1. Anomalía de inserción

Ocurre cuando no podemos insertar un dato sin tener que agregar datos que no corresponden o sin inventar información.

**Ejemplo:**

Si una tabla mezcla clientes con visualizaciones, puede resultar imposible registrar un cliente nuevo hasta que tenga una visualización.

### 2. Anomalía de actualización

Ocurre cuando un mismo dato está repetido en varios registros y debemos modificarlo en todos.

**Ejemplo:**

Si el email de un cliente aparece en 20 registros, al cambiarlo debemos actualizar los 20. Si olvidamos uno, quedan datos inconsistentes.

### 3. Anomalía de eliminación

Ocurre cuando al eliminar un registro también perdemos información que queríamos conservar.

**Ejemplo:**

Si un cliente aparece solamente en una visualización y eliminamos esa visualización, podríamos perder también la información del cliente si ambos datos están almacenados en la misma tabla.

### Relación entre redundancia y anomalías

La redundancia de datos puede generar problemas de mantenimiento y favorecer estas anomalías.

> **Normalización → busca organizar los datos para reducir redundancia y evitar anomalías.**

---

# Dependencia funcional

Una **dependencia funcional** significa que un atributo está determinado por otro.

Se representa con una flecha:

```text
idCliente → Cliente_Email
```

Esto significa:

> Conociendo `idCliente`, podemos determinar cuál es el `Cliente_Email` correspondiente.

Otro ejemplo:

```text
idContenido → Contenido_Titulo
```

El `idContenido` determina el título del contenido.

Las dependencias funcionales son fundamentales para comprender **2FN y 3FN**.

---

# 2FN — Segunda Forma Normal

Una tabla debe:

1. Cumplir **1FN**.
2. No tener **dependencias parciales** de atributos no clave respecto de una clave primaria compuesta.

La 2FN es especialmente relevante cuando la tabla tiene una **clave primaria compuesta**, es decir, una clave formada por más de una columna.

### Dependencia parcial

Existe una **dependencia parcial** cuando una columna no clave depende solamente de una parte de una clave primaria compuesta, en lugar de depender de la clave completa.

Ejemplo conceptual:

```text
PK = (idCliente, idContenido)

idCliente, idContenido → Fecha_Vista
idCliente → Cliente_Email
```

`Cliente_Email` depende solamente de `idCliente`, no de toda la clave `(idCliente, idContenido)`.

Por lo tanto, existe una **dependencia parcial**.

### Idea clave

> **2FN → todo atributo no clave debe depender de la clave primaria completa.**

Esto suele llevar a separar los datos que pertenecen a otras entidades y relacionarlas mediante claves foráneas.

Por ejemplo, en lugar de repetir:

```text
Cliente_Email
Cliente_Nombre
Cliente_Pais
```

en una tabla de visualizaciones, podemos tener una tabla `clients` y utilizar:

```text
idCliente
```

como **clave foránea (FK)** en la tabla que registra la visualización.

---

# 3FN — Tercera Forma Normal

Una tabla debe:

1. Cumplir **2FN**.
2. No tener **dependencias transitivas** entre atributos no clave.

### Dependencia transitiva

Existe una dependencia transitiva cuando una columna no clave depende de otra columna no clave, en lugar de depender directamente de la clave primaria.

Ejemplo:

```text
idCliente → idPais
idPais → NombrePais
```

Entonces:

```text
idCliente → NombrePais
```

pero `NombrePais` depende de `idPais`, que no es la clave primaria.

Esto constituye una **dependencia transitiva**.

### Idea clave

> **3FN → ninguna columna no clave debe depender de otra columna no clave.**

Una forma sencilla de recordarlo:

```text
Clave primaria → atributo no clave
```

✅ Dependencia directa.

Pero:

```text
Clave primaria → atributo no clave → otro atributo no clave
```

❌ Dependencia transitiva.

Por eso, en un diseño normalizado, puede ser conveniente separar:

```text
Clients
--------
idCliente
nombre
email
idPais
```

y:

```text
Countries
---------
idPais
nombrePais
codigoPais
```

---

# 2FN vs 3FN

| Forma normal | Problema que busca evitar |
|---|---|
| **1FN** | Valores no atómicos, listas y grupos repetidos |
| **2FN** | Dependencias parciales |
| **3FN** | Dependencias transitivas |

Una forma sencilla de recordarlo:

```text
1FN → ¿Los valores son atómicos?
2FN → ¿Dependen de TODA la clave?
3FN → ¿Dependen de la clave y no de otro atributo no clave?
```

---

# FNBC — Forma Normal de Boyce-Codd

La **FNBC** es un refinamiento de la 3FN y establece una condición más estricta.

La regla fundamental es:

> **Todo determinante debe ser una clave candidata.**

### ¿Qué es un determinante?

Un **determinante** es un atributo o conjunto de atributos que determina funcionalmente a otro atributo.

Por ejemplo:

```text
A → B
```

`A` es el **determinante** porque determina a `B`.

### ¿Qué es una clave candidata?

Una **clave candidata** es un conjunto mínimo de atributos que puede identificar de manera única cada fila de una tabla.

Una tabla puede tener varias claves candidatas.

Una de ellas es elegida como **clave primaria (PK)**.

Por lo tanto:

```text
Clave candidata
      │
      ├── puede ser elegida como PK
      │
      └── las demás pueden quedar como claves candidatas alternativas
```

### ⚠️ Clave candidata NO es lo mismo que FK

Esto es importante:

- **PK (Primary Key):** identifica de forma única cada fila.
- **FK (Foreign Key):** referencia una clave de otra tabla para establecer una relación.
- **Clave candidata:** clave mínima que podría identificar de forma única una fila.

Una **FK no se convierte automáticamente en clave candidata**.

### Regla de FNBC

```text
Todo determinante debe ser una clave candidata.
```

La FNBC es más estricta que la 3FN y resulta especialmente útil en determinadas tablas que poseen **más de una clave candidata** y cuyas dependencias funcionales generan problemas que 3FN puede permitir.

---

# ACID ≠ Atomicidad de 1FN

La palabra **atómico/atomicidad** aparece en dos contextos diferentes.

## Atomicidad en 1FN

Se refiere a que cada atributo almacena un **único valor**.

```text
❌ Documental, Drama
```

```text
✅ Documental
```

## Atomicidad en ACID

Es una propiedad de las **transacciones**.

Significa:

> Una transacción se realiza completamente o no se realiza.

ACID:

- **A — Atomicidad**
- **C — Consistencia**
- **I — Aislamiento**
- **D — Durabilidad**

Por ejemplo, en una transferencia bancaria, no queremos que se descuente dinero de una cuenta sin que se acredite en la otra.

> **Atomicidad de 1FN y Atomicidad de ACID son conceptos diferentes.**

---

# Resumen general

```text
NORMALIZACIÓN
│
├── 1FN
│   ├── Valores atómicos
│   ├── Sin listas en una celda
│   └── Sin grupos repetidos
│
├── 2FN
│   ├── Cumple 1FN
│   └── Sin dependencias parciales
│
├── 3FN
│   ├── Cumple 2FN
│   └── Sin dependencias transitivas
│
└── FNBC
    └── Todo determinante debe ser una clave candidata
```

## Regla mental para el examen

```text
1FN → ATÓMICO
2FN → CLAVE COMPLETA
3FN → SIN DEPENDENCIA ENTRE NO CLAVES
FNBC → DETERMINANTE = CLAVE CANDIDATA
```
