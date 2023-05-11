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