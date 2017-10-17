IF OBJECT_ID('Readers_Books', 'U') IS NOT NULL DROP TABLE Readers_Books;
IF OBJECT_ID('Publishers_Books', 'U') IS NOT NULL DROP TABLE Publishers_Books;
IF OBJECT_ID('Themes_Books', 'U') IS NOT NULL DROP TABLE Themes_Books; 
IF OBJECT_ID('Authors_Books', 'U') IS NOT NULL DROP TABLE Authors_Books; 
IF OBJECT_ID('Themes', 'U') IS NOT NULL DROP TABLE Themes; 
IF OBJECT_ID('Readers', 'U') IS NOT NULL DROP TABLE Readers; 
IF OBJECT_ID('Publishers', 'U') IS NOT NULL DROP TABLE Publishers; 
IF OBJECT_ID('Authors', 'U') IS NOT NULL DROP TABLE Authors; 
IF OBJECT_ID('Books', 'U') IS NOT NULL DROP TABLE Books; 

CREATE TABLE Books (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Code			VARCHAR(20) NOT NULL UNIQUE,
	Name			VARCHAR(100) NOT NULL,
	ProductionYear	INT NOT NULL,
	Cost			MONEY NOT NULL,
	Amount			INT NOT NULL,
	Condition		VARCHAR(50)	DEFAULT('Хорошее') NOT NULL
)

CREATE TABLE Authors (
	Id			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FIO			VARCHAR(200) NOT NULL,
	Phone		VARCHAR(15) NULL
)

CREATE TABLE Publishers (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name			VARCHAR(50) NOT NULL,
	PAddress		VARCHAR(200) NOT NULL,
	Phone			VARCHAR(30) NULL
)

CREATE TABLE Readers (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FIO				VARCHAR(200) NOT NULL,
	RGroup			VARCHAR(20) NOT NULL
)

CREATE TABLE Themes (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name			VARCHAR(100) NOT NULL,
	TDescription	TEXT NULL	
)

CREATE TABLE Authors_Books (
	AuthorId		INT NOT NULL FOREIGN KEY REFERENCES Authors(Id),
	BookId			INT NOT NULL FOREIGN KEY REFERENCES Books(Id),
	PRIMARY KEY(AuthorId, BookId)
)

CREATE TABLE Themes_Books (
	ThemeId			INT NOT NULL FOREIGN KEY REFERENCES Themes(Id),
	BookId			INT NOT NULL FOREIGN KEY REFERENCES Books(Id),
	PRIMARY KEY(ThemeId, BookId)
)

CREATE TABLE Publishers_Books (
	PublisherId		INT NOT NULL FOREIGN KEY REFERENCES Publishers(Id),
	BookId			INT NOT NULL FOREIGN KEY REFERENCES Books(Id),
	PRIMARY KEY(PublisherId, BookId)
)

CREATE TABLE Readers_Books (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ReaderId		INT NOT NULL FOREIGN KEY REFERENCES Readers(Id),
	BookId			INT NOT NULL FOREIGN KEY REFERENCES Books(Id),
	DateOfIssue		DATE NOT NULL,
	TimeConstraint	INT NOT NULL,
	ReturnDate		DATE NULL
)

INSERT INTO Authors VALUES 
	('Пушкин А.С', NULL),
	('Лермонтов М.Ю', NULL),
	('Толстой Л.Н', NULL),
	('Гоголь Н.В', NULL),
	('Достоевский Ф.М', NULL),
	('Ахматова А.А', NULL),
	('Бродский И.А', '+79998883343'),
	('Демидович Б.П', NULL),
	('Тер-Крикоров А.М', '+79998887766'),
	('Пелевин В.О', NULL)

INSERT INTO Publishers VALUES 
	('Питер', 'Санкт-Петербург, Б.Сампсониевский пр., 29а', '(800) 500 42 17'),
	('Аверс Плюс', 'город Ярославль, улица Победы, дом 34', '25-54-85'),
	('Издательский дом Н. П. Пастухова', 'город Ярославль, улица Республиканская, дом 42/24', '(4852) 30-35-83'),
	('Индиго', 'город Ярославль, улица Свободы, дом 97', '93-06-10'),
	('Медиарост', 'город Рыбинск, улица Глеба Успенского, дом 2, офис 10', '(4855) 25-48-01'),
	('МИФ', 'г. Москва, Б. Козихинский пер., д.7, стр.2, оф. 24', '8 800 775-67-41'),
	('АГРАФ', 'г. Москва, проезд Серебрякова, д.4', '(495) 926-25-46'),
	('Пресс-бук', 'Москва, ул. Большая Ордынка, д.17', ' (+7 499) 501-47-09'),
	('АСТ', 'Москва, Звездный бульвар, д. 21', '(495) 215–01–01'),
	('София', 'г. Москва, ул. Одесская, дом 14, корп. 1', '8 (499) 317-72-01')

INSERT INTO Readers VALUES 
	('Иванов А.Н', 'КБ-3'),
	('Петров Н.Ш', 'ПМИ-7'),
	('Иванов А.Н', 'ПИЭ-1'),
	('Смирнов О.Д', 'НЭ-0'),
	('Васильева З.Р', 'ТИ-4'),
	('Пушкин П.Р', 'КБ--3'),
	('Козлов Е.К', 'МКН-15'),
	('Григорьев А.К', 'ПБ-123'),
	('Звезный А.Л', 'КЕ-2'),
	('Демидова П.Г', 'ИП-1')

INSERT INTO Themes VALUES 
	('Стихи', 'Стихи различных авторов'),
	('Научная', NULL),
	('Фантастика', 'Разные чудеса'),
	('Экономика', NULL),
	('Психология', 'Книги о психологии'),
	('Иностранные языки', NULL),
	('Фэнтези', NULL),
	('Информатика', NULL),
	('Учебники', NULL),
	('Художественная', NULL)
	
INSERT INTO Books VALUES
	('ADEGFE', 'Сказка о рыбаке и рыбке', 1991, 100, 12, 'Хорошее'),
	('ADQMDE', 'Спящая красавица', 1992, 150, 11, 'Плохое'),
	('ADSDEE', 'Красавица и чудовище', 1999, 1230, 10, 'Отличное'),
	('ARRRRE', 'Гарри Поттер', 2003, 1430, 13, 'Ужасное'),
	('ATTTTE', 'Математика', 2017, 130, 15, 'Хорошее'),
	('ADEFFE', 'Энциклопедия', 2005, 1400, 16, 'Плохое'),
	('ADRRFE', 'Сказка о золотой рыбке', 1991, 1600, 14, 'Нормально'),
	('AMMMME', 'Золушка', 1999, 1700, 17, 'Плохое'),
	('APOIFE', 'CLR via C#', 2016, 1800, 82, 'Ужасное'),
	('ACSDFE', '500 по Фаренгейту', 1990, 90, 92, 'Отличное'),
	('ADTYFE', 'Сказка о рыбаке и рыбке', 1995, 100, 12, 'Хорошее')	
	
INSERT INTO Authors_Books VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 4),
	(5, 5),
	(6, 6),
	(4, 7),
	(1, 8),
	(6, 9),
	(8, 10)
	
INSERT INTO Themes_Books VALUES
	(1, 10),
	(2, 9),
	(3, 8),
	(4, 7),
	(5, 6),
	(6, 5),
	(7, 4),
	(8, 3),
	(9, 2),
	(10, 1)
	
INSERT INTO Publishers_Books VALUES
	(1, 10),
	(2, 10),
	(3, 8),
	(4, 7),
	(5, 10),
	(6, 9),
	(7, 8),
	(8, 2),
	(9, 3),
	(10, 4)
	
INSERT INTO Readers_Books VALUES
	(1, 1, '2017-08-01', 12, NULL),
	(2, 3, '2017-08-05', 13, '2017-09-01'),
	(3, 4, '2017-09-01', 10, NULL),
	(7, 9, '2017-05-01', 9, '2017-06-01'),
	(1, 1, '2017-06-01', 8, NULL),
	(5, 6, '2017-07-01', 7, NULL),
	(8, 3, '2017-08-01', 10, '2017-10-10'),
	(8, 5, '2017-09-03', 12, NULL),
	(2, 9, '2017-08-04', 14, NULL),
	(1, 3, '2017-08-10', 4, NULL)
