CREATE DATABASE marvel; -- criando o banco

USE marvel;

CREATE TABLE Personagens (
Id int(15) AUTO_INCREMENT,
Nome_Heroi VARCHAR (30) NOT NULL,
Poderes VARCHAR(100),
Terra_Natal VARCHAR(40),
Arqui_Inimigo VARCHAR(30),
PRIMARY KEY (ID)

);

SELECT* 
FROM Personagens;

INSERT INTO Personagens (Id, Nome_Heroi, Poderes, Terra_Natal, Arqui_Inimigo)
VALUES (NULL, "Homem Aranha", "Forca, agilidade, velocidade, resistencia, inteligencia, teias, reflexos", 
"Queens, Nova Iorque", "Duende Verde");

INSERT INTO Personagens (Id, Nome_Heroi, Poderes, Terra_Natal, Arqui_Inimigo)
VALUES (NULL, "THor", "Forca divina, resistencia,velocidade,vigor, fator cura, invunerabilidade",
"Asgard", "Loki");

UPDATE Personagens SET Nome_Heroi = "Miranha"WHERE Id=1;

DELETE FROM Personagens WHERE Id=2;

DROP TABLE Personagens;