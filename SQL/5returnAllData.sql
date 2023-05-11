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