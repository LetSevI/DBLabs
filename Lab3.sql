/* a) ����� ����� ���������� �������
SELECT RANK() OVER (ORDER BY SUM(bc.Count) DESC) AS Rank, Publishers.Name, SUM(bc.Count) as Rating
FROM Books b
JOIN (
	SELECT c.BookId, COUNT(*) as Count
	FROM Copies c
	JOIN Readers_Books rb ON (c.Id = rb.CopiesId) GROUP BY c.BookId
) bc ON (b.Id = bc.BookId)
JOIN Publishers ON (Publishers.Id = b.Publisher)
GROUP BY Publishers.Id, Publishers.Name
 */
/* �) ����� ����, �� ������� ��� ���������� ���� ��������� �� ����� */

/* �) ��������� ������ ���� �� ��������� ���� 
SELECT book.Name
FROM Themes_Books theme 
JOIN Books book ON theme.BookId = book.Id 
WHERE theme.ThemeId = 1
*/
/* �) ��������� ������ ���������, � ������� ���� ����� > 1 ������ (���, ����, �����, ��������, ���� �����)
, ������������� �� �������� ����� ����� (�.�, � ������ - ����� �������� ��������) 
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
*/
/* �) ��� ������ ������� ������ �������� ���������� ����, ������ � ������ �������� ����, ���������� ��������� */
