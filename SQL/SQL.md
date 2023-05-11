# Exercícios de SQL

- Conjunto de comandos para criar o banco de dados com as 3 tabelas:
```
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
```

### Questão 1
- Conjunto de comandos para popular o banco:
```
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
```

### Questão 2
- Comandos para retornar os dados o banco:
```
SELECT 
  aluno.Nome AS ALUNO, 
  responsavel1.Nome AS RESPONSAVEL1, 
  parentesco1.Parentesco AS PARENTESCO1, 
  responsavel2.Nome AS RESPONSAVEL2, 
  parentesco2.Parentesco AS PARENTESCO2
FROM 
  Aluno aluno
  LEFT JOIN (
    SELECT 
      IdAluno, 
      IdResponsavel, 
      Parentesco, 
      ROW_NUMBER() OVER(PARTITION BY IdAluno ORDER BY IdResponsavel) AS rownumber
    FROM 
      Parentesco
  ) parentesco1 ON aluno.Id = parentesco1.IdAluno AND parentesco1.rownumber = 1
  LEFT JOIN Responsavel responsavel1 ON parentesco1.IdResponsavel = responsavel1.Id
  LEFT JOIN (
    SELECT 
      IdAluno, 
      IdResponsavel, 
      Parentesco, 
      ROW_NUMBER() OVER(PARTITION BY IdAluno ORDER BY IdResponsavel) AS rownumber
    FROM 
      Parentesco
  ) parentesco2 ON aluno.Id = parentesco2.IdAluno AND parentesco2.rownumber = 2
  LEFT JOIN Responsavel responsavel2 ON parentesco2.IdResponsavel = responsavel2.Id
```

- Caso tenha apenas 1 responsável cadastrado irá retornar o restante dos valores nulos, se tiver mais do que 2 responsáveis, a consulta acima irá retornar apenas os 2 primeiros encontrados

### Questão BONUS
- Tive duas idéias de como exibir todos os dados, o primeiro é o seguinte:
```
SELECT aluno.Nome AS ALUNO, 
       CONCAT(parentesco.Parentesco, ' de ', aluno.Nome, ' é ', responsavel.Nome) AS PARENTESCO
FROM Aluno aluno
INNER JOIN Parentesco parentesco ON parentesco.IdAluno = aluno.Id
INNER JOIN Responsavel responsavel ON parentesco.IdResponsavel = responsavel.Id;
```
- O retorno ficará desta forma de acordo com o que foi populado anteriormente:
```
ALUNO               PARENTESCO
Lucas          Pai de Lucas é Pablo
Lucas          Mãe de Lucas é Brenda
Filipe         Pai de Filipe é João
Filipe         Mãe de Filipe é Maria
Filipe         Tio de Filipe é José
```
- A outra forma exibe todos os parentescos na mesma linha:
```
SELECT 
  aluno.Nome AS ALUNO, 
  CONCAT(
    GROUP_CONCAT(
      CONCAT(parentesco.Parentesco, responsavel.Nome) SEPARATOR '; '
    ),
    '; são os responsáveis'
  ) AS PARENTESCOS
FROM 
  Aluno aluno
  INNER JOIN Parentesco parentesco ON parentesco.IdAluno = aluno.Id
  INNER JOIN Responsavel responsavel ON responsavel.Id = parentesco.IdResponsavel
GROUP BY aluno.Id;
```
- O retorno ficará desta forma de acordo com o que foi populado anteriormente:
```
ALUNO               RESPONSAVEIS
Lucas     Pai Pablo; Mãe Brenda; são os responsáveis
Filipe    Pai João; Mãe Maria; Tio José; são os responsáveis
```
