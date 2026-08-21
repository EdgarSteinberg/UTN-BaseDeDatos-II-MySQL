-- =====================================================
-- ALTER TABLE
-- Permite modificar la estructura de una tabla existente.
-- =====================================================

-- Agrega la columna idCountries a la tabla clients.
-- NOT NULL indica que todo cliente debe tener un país.
-- AFTER idClients coloca la nueva columna después de idClients.
ALTER TABLE clients
ADD idCountries INT NOT NULL
AFTER idClients;


-- Crea una clave foránea entre clients y countries.
-- clients.idCountries debe corresponder a un
-- countries.idCountries existente.
ALTER TABLE clients
ADD CONSTRAINT clients_fk1
FOREIGN KEY (idCountries)
REFERENCES countries(idCountries);


-- Crea una clave foránea entre memberships y clients.
-- memberships.idClients debe corresponder a un
-- clients.idClients existente.
ALTER TABLE memberships
ADD CONSTRAINT memberships_fk
FOREIGN KEY (idClients)
REFERENCES clients(idClients);


-- Agrega la columna idLanguages a la tabla contents.
-- NOT NULL indica que todo contenido debe tener un idioma.
-- AFTER idCategories coloca la columna después de idCategories.
ALTER TABLE contents
ADD idLanguages INT NOT NULL
AFTER idCategories;


-- Crea una clave foránea entre contents y languages.
-- contents.idLanguages debe corresponder a un
-- languages.idLanguages existente.
ALTER TABLE contents
ADD CONSTRAINT contents_fk_languages
FOREIGN KEY (idLanguages)
REFERENCES languages(idLanguages);