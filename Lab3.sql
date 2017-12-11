/* a) Найти самые популярные издания  */
CREATE VIEW PopularPublishers
AS
SELECT RANK() OVER (ORDER BY SUM(bc.Count) DESC) AS Rank, Publishers.Name, SUM(bc.Count) as Rating
FROM Books b
JOIN (
	SELECT c.BookId, COUNT(*) as Count
	FROM Copies c
	JOIN Readers_Books rb ON (c.Id = rb.CopiesId) GROUP BY c.BookId
) bc ON (b.Id = bc.BookId)
JOIN Publishers ON (Publishers.Id = b.Publisher)
GROUP BY Publishers.Id, Publishers.Name

/* б) Найти темы, по которым все экземпляры книг находятся на руках  */
CREATE VIEW OnHand
AS
SELECT t1.Name
FROM (
	SELECT t.Name, tb.ThemeId, COUNT(*) AS Count
	FROM Themes t
	JOIN Themes_Books tb ON (t.Id = tb.ThemeId)
	GROUP BY tb.ThemeId, t.Name
) t1
JOIN (
	SELECT tbb.ThemeId, COUNT(*) as Count
	FROM Books b
	JOIN (
		SELECT c.BookId, COUNT(*) as Amount
		FROM Readers_Books rb
		JOIN Copies c ON (c.Id = rb.CopiesId)
		WHERE rb.ReturnDate IS NULL
		GROUP BY c.BookId
	) bc ON (b.Id = bc.BookId AND b.Amount = bc.Amount)
	JOIN Themes_Books tbb ON (b.Id = tbb.BookId)
	GROUP BY tbb.ThemeId
) t2 ON (t1.ThemeId = t2.ThemeId AND t1.Count = t2.Count)

/* в) Составить список книг по указанной теме */
CREATE VIEW ThemeBooks
AS
SELECT book.Name
FROM Themes_Books theme 
JOIN Books book ON theme.BookId = book.Id 
WHERE theme.ThemeId = 1

/* г) Составить список должников, у которых срок долга > 1 месяца (ФИО, шифр, автор, название, дата сдачи)
, отсортировать по убыванию срока долга (т.е, в начала - самые злостные должники) */
CREATE VIEW Debtors
AS
SELECT r.FIO, b.Code, a.FIO, b.Name, rb.ReturnDate
FROM Readers_Books rb 
JOIN Readers r ON rb.ReaderId = r.Id
JOIN Copies c ON (rb.CopiesId = c.Id)
JOIN Books b ON (c.BookId = b.Id)
JOIN Authors_Books ab ON (b.Id = ab.BookId)
JOIN Authors a ON (ab.AuthorId = a.Id)
WHERE DATEDIFF(
	MONTH, 
	DATEADD(DAY, rb.TimeConstraint, rb.DateOfIssue), 
	rb.ReturnDate
) > 1

/* д) Для каждой учебной группы выдавать количество книг, взятых с начала текущего года, количество должников */
CREATE VIEW GroupStats
AS
SELECT t1.RGroup, COUNT(*) as Books, SUM(CASE WHEN t1.Debtor = 'TRUE' THEN 1 ELSE 0 END ) as Debtors
FROM (
	SELECT r.Id, r.RGroup,
	CASE
		WHEN (rb.TimeConstraint - (DATEDIFF(DAY, rb.DateOfIssue, GETDATE())) < 0 AND rb.ReturnDate IS NULL) 
		THEN 'TRUE' ELSE 'FALSE' END Debtor
	FROM Readers r 
	RIGHT JOIN Readers_Books rb ON (r.Id = rb.ReaderId)
	WHERE DATEDIFF(YEAR, rb.DateOfIssue, GETDATE()) = 0
) t1
GROUP BY t1.Id, t1.RGroup
