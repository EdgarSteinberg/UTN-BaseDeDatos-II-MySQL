
SHOW TABLES;

CREATE TABLE categories (
    idCategories INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50)
);

CREATE TABLE contents_types (
    idContents_Types INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50)
);

CREATE TABLE countries (
    idCountries INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(20),
    Code CHAR(4) NOT NULL
);

CREATE TABLE languages (
    idLanguages INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Active BOOL NOT NULL DEFAULT TRUE
);

CREATE TABLE contents (
    idContents INT PRIMARY KEY AUTO_INCREMENT,

    idContents_Types INT,
    idCategories INT,
    idLanguages INT,

    Title VARCHAR(100),
    Release_Year INT,

    FOREIGN KEY (idCategories)
        REFERENCES categories(idCategories),

    FOREIGN KEY (idContents_Types)
        REFERENCES contents_types(idContents_Types),

    FOREIGN KEY (idLanguages)
        REFERENCES languages(idLanguages)
);

CREATE TABLE clients (
    idClients INT PRIMARY KEY AUTO_INCREMENT,

    idCountries INT,

    Name VARCHAR(100),
    Email VARCHAR(100),

    FOREIGN KEY (idCountries)
        REFERENCES countries(idCountries)
);

CREATE TABLE views (
    idViews INT PRIMARY KEY AUTO_INCREMENT,

    idClients INT,
    idContents INT,

    View_Date DATETIME,
    Rating INT,

    FOREIGN KEY (idClients)
        REFERENCES clients(idClients),

    FOREIGN KEY (idContents)
        REFERENCES contents(idContents)
);

CREATE TABLE memberships (
    idMemberships INT PRIMARY KEY AUTO_INCREMENT,

    idClients INT,

    Description VARCHAR(100) NOT NULL,
    Date_From DATETIME NOT NULL,
    Date_To DATETIME NOT NULL,
    Date_Cancel DATETIME,
    Value DECIMAL(8,2) NOT NULL,

    FOREIGN KEY (idClients)
        REFERENCES clients(idClients)
);

