INSERT INTO Aluno (Nome) VALUES ('Lucas'), ('Filipe');

INSERT INTO Responsavel (Nome) VALUES ('Pablo'), ('Brenda'), ('João'), ('Maria'), ('José');

SELECT Id AS IdLucas FROM Aluno WHERE Nome = 'Lucas';
SELECT Id AS IdFilipe FROM Aluno WHERE Nome = 'Filipe';
SELECT Id AS IdPablo FROM Responsavel WHERE Nome = 'Pablo';
SELECT Id AS IdBrenda FROM Responsavel WHERE Nome = 'Brenda';
SELECT Id AS IdJoao FROM Responsavel WHERE Nome = 'João';
SELECT Id AS IdMaria FROM Responsavel WHERE Nome = 'Maria';
SELECT Id AS IdJose FROM Responsavel WHERE Nome = 'José';

INSERT INTO Parentesco (IdResponsavel, IdAluno, Parentesco) VALUES
    (IdPablo, IdLucas, 'Pai'),
    (IdBrenda, IdLucas, 'Mãe'),
    (IdJoao, IdFilipe, 'Pai'),
    (IdMaria, IdFilipe, 'Mãe'),
    (IdJose, IdFilipe, 'Tio');