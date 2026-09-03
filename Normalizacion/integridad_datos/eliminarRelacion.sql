SHOW CREATE TABLE contents;
--En tu SHOW CREATE TABLE aparece:

CONSTRAINT `contents_ibfk_1`
FOREIGN KEY (`idCategories`)
REFERENCES `categories` (`idCategories`)

Así que esa es la relación que querés sacar.

Primero eliminás la FK:

ALTER TABLE contents
DROP FOREIGN KEY contents_ibfk_1;

Y si además querés sacar completamente idCategories de contents, después:

ALTER TABLE contents
DROP COLUMN idCategories;

tabla puente

CREATE TABLE contents_categories (
    idContents INT,
    idCategories INT,

    PRIMARY KEY (idContents, idCategories),

    FOREIGN KEY (idContents)
        REFERENCES contents(idContents),

    FOREIGN KEY (idCategories)
        REFERENCES categories(idCategories)
);