update EMPRESTIMOS
set DATA_DEVOLUCAO = now()
WHERE ID_EMPRESTIMO = 


DECLARE @ID AS INT;
@ID = (
SELECT MIN(ID_EMPRESTIMO)
FROM EMPRESTIMOS
inner JOIN LIVROS ON ID_LIVRO = COD_LIVRO AND DATA_DEVOLUCAO IS NULL
INNER JOIN OBRAS ON ID_OBRA = COD_OBRA
INNER join PESSOAS ON ID_PESSOA = COD_PESSOA
WHERE COD_PESSOA_TELEGRAM = 109595409
AND ID_OBRA = @ID_OBRA
);

SELECT @ID 