

ALTER TABLE clients
add idCountries INT not null
after idClients;


ALTER TABLE clients 
add CONSTRAINT clients_fk1
FOREIGN KEY (idCountries)
REFERENCES countries (idCountries);


ALTER TABLE memberships
ADD CONSTRAINT memberships_fk
FOREIGN KEY (idClients)
REFERENCES clients(idClients);