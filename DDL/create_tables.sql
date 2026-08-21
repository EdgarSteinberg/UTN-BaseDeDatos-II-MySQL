

SHOW TABLES;

CREATE TABLE categories (

    idCategories INT PRIMARY KEY AUTO_INCREMENT,

    Name VARCHAR(50)
);

CREATE TABLE contents_types (

    idContents_Types INT PRIMARY KEY AUTO_INCREMENT,

    Name VARCHAR(50)
);

CREATE TABLE contents (

	idContents INT primary key auto_increment,
	
	idContents_Types INT,
	
	idCategories INT,
	
	Title VARCHAR(100),
	
	Release_Year INT,
	
	foreign key (idCategories) references categories(idCategories),
	
	foreign key (idContents_Types) references contents_types(idContents_Types)

);


CREATE TABLE clients(

	idClients INT primary key auto_increment,
	
	Name VARCHAR(100),
	
	Email VARCHAR(100)
	
);


CREATE TABLE views (

    idViews INT PRIMARY KEY AUTO_INCREMENT,
    
    idClients INT,
    
    idContents INT,
    
    View_Date DATETIME,
    
	Rating INT,

    FOREIGN KEY (idClients) REFERENCES clients(idClients),
    
    FOREIGN KEY (idContents) REFERENCES contents(idContents)
);


CREATE TABLE countries (

    idCountries INT PRIMARY KEY AUTO_INCREMENT ,

    Name VARCHAR(20),

    Code CHAR(4) NOT NULL
);

-- Todavia no lo anadi a la BD
CREATE TABLE languages (

    idLanguages INT PRIMARY KEY AUTO_INCREMENT,
	
    Name VARCHAR(50) NOT NULL,

    Active BOOL NOT NULL DEFAULT TRUE
);

CREATE TABLE memberships (

    idMemberships INT AUTO_INCREMENT,

    idClients INT,

    Description VARCHAR(100) NOT NULL,
	
    Date_From DATETIME NOT NULL,

    Date_To DATETIME NOT NULL,

    Date_Cancel DATETIME,

    Value DECIMAL(8,2) NOT NULL,

    CONSTRAINT memberships_pk
        PRIMARY KEY (idMemberships, idClients),

    CONSTRAINT memberships_fk
        FOREIGN KEY (idClients)
        REFERENCES clients(idClients) 
);