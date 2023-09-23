-- Indicando o banco de dados
USE Filmes;

-- 1. Buscar o nome e o ano dos filmes
SELECT Nome, Ano FROM Filmes;

-- 2. Buscar o nome e o ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano FROM Filmes ORDER BY Ano;

-- 3. Buscar pelo filme de volta para o futuro, trazendo nome, ano e a duracao
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'de volta para o futuro';

-- 4. Buscar os filmes lancados em 1997
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano = 1997;

-- 5. Buscar os filmes lancados após o ano 2000
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano > 2000;

-- 6. Buscar os filmes por duracao maior que 100 e menor que 150 ordenado pela
-- duracao em ordem crescente
SELECT Nome, Ano, Duracao FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao;

-- 7. Buscar a quantidade de filmes lancados no ano, agrupados por ano, ordenando pela duracao
-- em ordem decrescente
SELECT Ano, COUNT(*) AS Quantidade FROM Filmes GROUP BY Ano ORDER BY Quantidade DESC;

-- 8. Buscar os atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'M';

-- 9. Buscar os atores do genero feminino, retornando o PrimeiroNome, UltimoNome e ordenando
-- pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome;

-- 10. Buscar o nome do filme e o gênero
SELECT a.Nome, c.Genero FROM Filmes a
	INNER JOIN FilmesGenero b ON a.Id = b.IdFilme
	INNER JOIN Generos c ON b.IdGenero = c.Id;

-- 11. Buscar o nome do filme e o genero do tipo "Mistério"
SELECT a.Nome, c.Genero FROM Filmes a
	INNER JOIN FilmesGenero b ON a.Id = b.IdFilme
	INNER JOIN Generos c ON b.IdGenero = c.Id
	WHERE c.Genero = 'Mistério';

-- 12. Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT c.Nome, a.PrimeiroNome, a.UltimoNome, b.Papel FROM Atores a
	INNER JOIN ElencoFilme b ON a.Id = b.IdAtor
	INNER JOIN Filmes c ON b.IdFilme = c.Id;