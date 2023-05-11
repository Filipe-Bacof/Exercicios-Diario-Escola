CREATE DATABASE MeuBancoDeDados;

USE MeuBancoDeDados;

CREATE TABLE Aluno (
    Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Responsavel (
    Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Parentesco (
    IdResponsavel INT NOT NULL,
    IdAluno INT NOT NULL,
    Parentesco VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdResponsavel) REFERENCES Responsavel(Id),
    FOREIGN KEY (IdAluno) REFERENCES Aluno(Id),
    PRIMARY KEY (IdResponsavel, IdAluno)
);