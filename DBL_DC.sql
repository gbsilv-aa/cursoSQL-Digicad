CREATE DATABASE DC; -- criando o banco

USE DC;

CREATE TABLE PersonagensDC(
Id int(15) AUTO_INCREMENT,
Nome_Heroi VARCHAR (30) NOT NULL,
Poderes VARCHAR(100),
Terra_Natal VARCHAR(40),
Arqui_Inimigo VARCHAR(30),
PRIMARY KEY (ID)

);

SELECT* 
FROM PersonagensDC;

INSERT INTO PersonagensDC (Id, Nome_Heroi, Poderes, Terra_Natal, Arqui_Inimigo)
VALUES 
(NULL, "Batman", "Forca, agilidade,Poder Financeiro, resistencia, inteligencia, reflexos", 
"gotham city", "Coringa"),
 (NULL, "Coringa", "Forca, vigor, inteligencia, abilidade quimica",
"gotham city", "Batman"),
(NULL, "Flash", "Forca, agilidade, super velocidade,resistencia, reflexos", 
"Central City", "Magenta"),
(NULL, "Mulher MAravilha", "Forca sobre-humana, agilidade,voo, cura", 
"Themyscira", "Ares"),
(NULL, "Super Homem", "Invunerabilidade, agilidade,voo, cura", 
"Metrópolis,EUA", "Ares");

Drop table Filmes;
CREATE TABLE Filmes (
IdFilme int(15) AUTO_INCREMENT,
Nome_Filme VARCHAR (30) NOT NULL,
Atores VARCHAR(100),
Data_Lancamento DATE,
PRIMARY KEY (IdFilme)

);

SELECT* 
FROM Filmes;

INSERT INTO Filmes (IdFilme, Nome_Filme, Atores, Data_Lancamento)
VALUES 
(NULL, "Batman Cavaleiro das Trevas", "Christian Bale, Heath Ledger, Aaron Eckhart", 
'2022-03-03'),
 (NULL, "Joker", "Joaquin Phoenix, Robert De Niro, Zazie Beetz",'2019-10-03'),
(NULL, "The Flash", "Ezra Miller, Michael Keaton, Sasha Call", '2023-06-15'),
(NULL, "Wonder Woman", "Gal Gadot, Chris Pine, Robin Wright", '2017-06-01'),
(NULL, "Superman - O Retorno", "Brandon Routh, Kevin Spacey, Kate Bosworth", '2006-11-28');

