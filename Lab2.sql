﻿CREATE TABLE Books (
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
	Phone		VARCHAR(10) NULL
)

CREATE TABLE Publishers (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name			VARCHAR(50) NOT NULL,
	PAddress		VARCHAR(200) NOT NULL,
	Phone			VARCHAR(10) NULL
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
	('Бродский И.А', NULL),
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
	('', '', 1991, 100, 12, 'Хорошее')
	
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