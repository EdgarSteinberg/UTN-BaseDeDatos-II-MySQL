-- =====================================================
-- UPDATE
-- Modifica datos que ya existen en una tabla.
-- =====================================================

-- Modifica el nombre del tipo de contenido con ID 3.
-- De "Short" a "Short Film".
UPDATE contents_types
SET Name = 'Short Film'
WHERE idContents_Types = 3;


-- Modifica el nombre de la categoría con ID 6.
-- De su nombre anterior a "Romance".
UPDATE categories
SET Name = 'Romance'
WHERE idCategories = 6;


-- Modifica el título del contenido con ID 7.
UPDATE contents
SET Title = 'Galaxy 0'
WHERE idContents = 7;


-- Asigna Argentina (idCountries = 1) al cliente con ID 1.
UPDATE clients
SET idCountries = 1
WHERE idClients = 1;

-- Asigna Brasil (idCountries = 2) al cliente con ID 2.
UPDATE clients
SET idCountries = 2
WHERE idClients = 2;

-- Asigna Chile (idCountries = 3) al cliente con ID 3.
UPDATE clients
SET idCountries = 3
WHERE idClients = 3;