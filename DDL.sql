DROP DATABASE IF EXISTS Pretifly;

CREATE DATABASE Pretifly;

USE Pretifly;

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
	
	release_Year INT,
	
	foreign key (idCategories) references categories(idCategories),
	
	foreign key (idContents_Types) references contents_types(idContents_Types)

);


CREATE TABLE clients(
	idClients INT primary key auto_increment,
	
	Name VARCHAR(100),
	
	Email VARCHAR(100),
	
	Country VARCHAR(50)
);


CREATE TABLE views (
    idViews INT PRIMARY KEY AUTO_INCREMENT,
    idClients INT,
    idContents INT,
    View_Date DATETIME,

    FOREIGN KEY (idClients) REFERENCES clients(idClients),
    FOREIGN KEY (idContents) REFERENCES contents(idContents)
);