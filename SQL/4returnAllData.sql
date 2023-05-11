SELECT aluno.Nome AS ALUNO, 
       CONCAT(parentesco.Parentesco, ' de ', aluno.Nome, ' é ', responsavel.Nome) AS PARENTESCO
FROM Aluno aluno
INNER JOIN Parentesco parentesco ON parentesco.IdAluno = aluno.Id
INNER JOIN Responsavel responsavel ON parentesco.IdResponsavel = responsavel.Id;