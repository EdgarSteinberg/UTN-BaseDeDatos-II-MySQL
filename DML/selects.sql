-- Consulta básica 

SELECT * FROM contents;
SELECT * FROM clients;
SELECT * FROM views;
SELECT * FROM contents_types;
SELECT * FROM categories;

-- Consulta columnas específicas

SELECT Title, Release_Year FROM contents;
SELECT Email FROM clients;


-- Filtrado avanzado

SELECT Title, Release_Year FROM contents
WHERE Release_Year
BETWEEN 2018 AND 2023 AND idContents_Types IN(1,2);