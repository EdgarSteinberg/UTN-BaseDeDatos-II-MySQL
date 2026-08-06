-- Insert individual

INSERT INTO categories (Name) VALUES ('Sci-Fi');

-- Insert Masivo

INSERT INTO categories (Name) VALUES
    ('Drama'),
    ('Comedy'),
    ('Action'),
    ('Documentary'),
    ('Anime')
;

INSERT INTO contents_types (Name) VALUES 
    ('Movie'),
    ('Series'),
    ('Short'),
    ('Video')
;

INSERT INTO contents (Title, Release_Year, idCategories, idContents_Types) VALUES
    ('Interstellar', 2014, 1, 1),
    ('The Matrix', 1999, 1, 1),
    ('Breaking Bad', 2008, 2, 2),
    ('The Office', 2005, 3, 2),
    ('Mad Max Fury Road', 2015, 4, 1),
    ('Your Name', 2016, 6, 1)
;

INSERT INTO clients (Name, Email) VALUES
    ('Juan Perez', 'juan@email.com'),
    ('Maria Lopez', 'maria@email.com'),
    ('Carlos Diaz', 'carlos@email.com')
;

INSERT INTO views (idClients, idContents, View_Date, Rating) VALUES
    (1,2,'2025-01-10 21:09:00',5),
    (1,3,'2025-02-02 19:50:00',5),
    (2,2,'2025-02-10 16:00:00',4),
    (3,4,'2025-03-01 13:01:00',3),
    (2,5,'2025-03-10 23:02:00',4)
;

