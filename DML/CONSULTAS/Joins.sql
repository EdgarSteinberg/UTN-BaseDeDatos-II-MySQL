/* Con INNER JOIN:

La tabla del FROM generalmente no cambia el resultado si mantenés las mismas relaciones y condiciones.

Con LEFT JOIN:

La tabla que está a la izquierda importa muchísimo, porque esa es la que querés conservar completa. */

# Práctica de JOINs en SQL

## Contexto

Práctica realizada para comprender cómo funcionan las relaciones entre tablas mediante `JOIN`.

El objetivo inicial fue aprender a identificar las claves foráneas (`FK`) y utilizarlas para recorrer las relaciones entre las tablas, comenzando con consultas simples de dos tablas y aumentando progresivamente la cantidad de tablas involucradas.

En esta práctica se trabajó principalmente con `INNER JOIN`.

### Relaciones utilizadas

```text
categories
     ↑
     │ idCategories
     │
 contents ─────────→ contents_types
     │
     ├──────────────→ languages
     │
     └──────────────→ views
                           │
                           └────────→ clients
                                         │
                                         └────────→ countries
```

La idea principal aprendida fue que, cuando el dato que necesitamos se encuentra en otra tabla, debemos identificar **qué FK permite llegar hasta ella**.

---

## 1. Contenidos y categorías

Mostrar todos los contenidos junto con el nombre de su categoría.

sql
SELECT
    c.Title AS Titulo_Pelicula,
    ca.Name AS Categoria_Pelicula
FROM
    contents c
INNER JOIN
    categories ca
ON
    c.idCategories = ca.idCategories;
```

---

## 2. Contenidos y tipos

Mostrar todos los contenidos junto con el tipo de contenido al que pertenecen.

```sql
SELECT
    c.Title AS Titulo_Pelicula,
    ct.Name AS Tipo_Pelicula
FROM
    contents c
INNER JOIN
    contents_types ct
ON
    c.idContents_Types = ct.idContents_Types;
```

---

## 3. Contenidos, idiomas y categorías

Mostrar el título del contenido, su idioma y su categoría.

```sql
SELECT
    c.Title AS Titulo_Pelicula,
    l.Name AS Idioma_Pelicula,
    ca.Name AS Categoria_Pelicula
FROM
    contents c
INNER JOIN
    languages l
ON
    c.idLanguages = l.idLanguages
INNER JOIN
    categories ca
ON
    c.idCategories = ca.idCategories;
```

---

## 4. Clientes y países

Mostrar todos los clientes junto con el país al que pertenecen.

```sql
SELECT
    cl.Name AS Nombre_Cliente,
    co.Name AS Pais
FROM
    clients cl
INNER JOIN
    countries co
ON
    cl.idCountries = co.idCountries;
```

---

## 5. Membresías y clientes

Mostrar las membresías junto con el cliente que las posee y su valor.

```sql
SELECT
    m.Description AS Descripcion_Membresia,
    c.Name AS Nombre_Cliente,
    m.Value AS Valor_Membresia
FROM
    memberships m
INNER JOIN
    clients c
ON
    m.idClients = c.idClients;
```

---

## 6. Clientes, visualizaciones y contenidos

Obtener qué cliente vio qué contenido y en qué fecha.

Para llegar desde `clients` hasta `contents` es necesario pasar por `views`.

```text
clients
   ↓
views
   ↓
contents
```

```sql
SELECT
    c.Name AS Nombre_Cliente,
    ct.Title AS Nombre_Pelicula,
    v.View_Date AS Fecha
FROM
    clients c
INNER JOIN
    views v
ON
    c.idClients = v.idClients
INNER JOIN
    contents ct
ON
    v.idContents = ct.idContents;
```

---

## 7. Clientes, contenidos y categorías

Obtener qué cliente vio qué película y a qué categoría pertenece.

El recorrido utilizado fue:

```text
clients
   ↓
views
   ↓
contents
   ↓
categories
```

```sql
SELECT
    cl.Name AS Cliente,
    c.Title AS Titulo,
    ca.Name AS Categoria
FROM
    views v
INNER JOIN
    clients cl
ON
    v.idClients = cl.idClients
INNER JOIN
    contents c
ON
    v.idContents = c.idContents
INNER JOIN
    categories ca
ON
    c.idCategories = ca.idCategories;
```

---

## 8. Clientes, contenidos, categorías e idiomas

Obtener el cliente, el contenido que vio, su categoría y su idioma.

Recorrido de las relaciones:

```text
contents
   ├──→ categories
   ├──→ languages
   │
   └──→ views
            │
            └──→ clients
```

```sql
SELECT
    cl.Name AS Nombre_Cliente,
    c.Title AS Titulo,
    ca.Name AS Categoria,
    l.Name AS Idioma
FROM
    contents c
INNER JOIN
    categories ca
ON
    c.idCategories = ca.idCategories
INNER JOIN
    languages l
ON
    c.idLanguages = l.idLanguages
INNER JOIN
    views v
ON
    v.idContents = c.idContents
INNER JOIN
    clients cl
ON
    v.idClients = cl.idClients;
```

---

## Consultas auxiliares

Utilizadas para inspeccionar los datos de las tablas durante la práctica.

```sql
SELECT * FROM clients;

SELECT * FROM languages;

SELECT * FROM contents;

SELECT * FROM views;
```

---

## Conceptos aprendidos

* Uso de `INNER JOIN`.
* Relación entre tablas mediante claves foráneas.
* Uso de alias para facilitar la lectura de las consultas.
* Encadenamiento de múltiples `JOIN`.
* Identificación del camino necesario para llegar desde una tabla hasta otra.
* Comprensión de relaciones indirectas a través de una tabla intermedia.
* Diferencia entre la tabla desde la que parte la consulta y las tablas relacionadas mediante `JOIN`.

### Idea principal

> Antes de escribir un `JOIN`, identificar qué dato necesito, en qué tabla se encuentra y qué clave foránea me permite llegar hasta esa tabla.
