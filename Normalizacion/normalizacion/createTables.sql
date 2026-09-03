-- Anomalia de Normalizacion

/*
| Concepto               | Pertenece principalmente a                  |
| ------------------------- | ------------------------------------------- |
| Valores atómicos          | **1FN**                                     |
| Grupos repetitivos        | **1FN**                                     |
| Dependencia funcional     | **Normalización / 2FN / 3FN**               |
| Dependencia parcial       | **2FN**                                     |
| Dependencia transitiva    | **3FN**                                     |
| Anomalía de inserción     | Problemas que busca evitar la normalización |
| Anomalía de actualización | Problemas que busca evitar la normalización |
| Anomalía de eliminación   | Problemas que busca evitar la normalización |
| ACID                      | **Transacciones**                           |
 */


-- Anomalia principal : si queremos actualizar el email de la persona
-- Tendriamos que buscar el Nombre del cliente para actualizar el email dentro de esta tabla

CREATE TABLE registro_visualizaciones_desnormalizado(
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_Nombre VARCHAR(100),
    Cliente_Email VARCHAR(100),
    Cliente_Pais VARCHAR(100),
    Cliente_CodigoPais VARCHAR(5),
    Contenido_Titulo VARCHAR(150),
    Contenido_Anio INT,
    Contenido_Categorias VARCHAR(200), -- ej: 'Documental, Naturaleza'
    Fecha_Vista DATETIME,
    Rating INT
)

-- Priemera Forma Normal(1FN)

--invisible quiere decir q solo muestra el id ? en una tabla padre ? por eso es atomico ?



-- Segunda Forma Normal(2FN)
CREATE TABLE contenido_categoria_mal(
    idContenido INT,
    idCategoria INT,
    Contenido_Titulo VARCHAR(150), -- dependencia parcial: no depende de idCategoria
    PRIMARY KEY (idContenido , idCategoria)
)

-- Se resuelve agregando el id de esa tabla 
-- Tabla puente 
-- No respeta la 2FN porque el titulo esta dentro de la misma tabla
CREATE TABLE contenido_categoria_mal(
    idContenidoCategoria INT AUTO_INCREMENT
    idContenido INT,
    idCategoria INT,
    Contenido_Titulo VARCHAR(150), -- dependencia parcial: no depende de idCategoria
    PRIMARY KEY (idContenidoCategoria)
)

-- Tercera Forma Normal (3FN)


CREATE TABLE clients_mal(
    idClients INT PRIMARY KEY,
    Name VARCHAR(100),
    Cliente_Pais VARCHAR(100),
    CountryCode VARCHAR(5) -- depende de CountryCode, no de idClients Dependencia transitivas
)

-- Tabla nueva , Tabla puente para asignar varias categorias a un contenido
-- Quitar de la tabla contents el idCategoria

CREATE TABLE categories_contents (
    idCategories_Contents INT NOT NULL AUTO_INCREMENT,
    idContents INT NOT NULL,
    idCategories INT NOT NULL,

    PRIMARY KEY (idCategories_Contents),

    FOREIGN KEY (idContents)
        REFERENCES contents(idContents),

    FOREIGN KEY (idCategories)
        REFERENCES categories(idCategories)
);


INSERT INTO categories_contents (idContents, idCategories)
VALUES
(1, 1),
(1, 2),
(1, 3);


-- join
SELECT 
	c.Title as titulo,
    ca.Name as categoria
FROM 
	categories_contents ct
INNER JOIN
	categories ca
ON
	ct.idCategories = ca.idCategories
INNER JOIN
 contents c
ON
	ct.idContents = c.idContents;
	