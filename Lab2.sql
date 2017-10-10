CREATE TABLE Books (
	Id				INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Code			VARCHAR(20) NOT NULL UNIQUE,
	Name			VARCHAR(100) NOT NULL,
	ProductionYear	INT NOT NULL,
	Cost			MONEY NOT NULL,
	Amount			INT NOT NULL,
	Condition		VARCHAR(50)	DEFAULT('�������') NOT NULL
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
	('������ �.�', NULL),
	('��������� �.�', NULL),
	('������� �.�', NULL),
	('������ �.�', NULL),
	('����������� �.�', NULL),
	('�������� �.�', NULL),
	('�������� �.�', NULL),
	('��������� �.�', NULL),
	('���-�������� �.�', '+79998887766'),
	('������� �.�', NULL)

INSERT INTO Publishers VALUES 
	('�����', '�����-���������, �.�������������� ��., 29�', '(800) 500 42 17'),
	('����� ����', '����� ���������, ����� ������, ��� 34', '25-54-85'),
	('������������ ��� �. �. ���������', '����� ���������, ����� ���������������, ��� 42/24', '(4852) 30-35-83'),
	('������', '����� ���������, ����� �������, ��� 97', '93-06-10'),
	('���������', '����� �������, ����� ����� ����������, ��� 2, ���� 10', '(4855) 25-48-01'),
	('���', '�. ������, �. ����������� ���., �.7, ���.2, ��. 24', '8 800 775-67-41'),
	('�����', '�. ������, ������ �����������, �.4', '(495) 926-25-46'),
	('�����-���', '������, ��. ������� �������, �.17', ' (+7 499) 501-47-09'),
	('���', '������, �������� �������, �. 21', '(495) 215�01�01'),
	('�����', '�. ������, ��. ��������, ��� 14, ����. 1', '8 (499) 317-72-01')

INSERT INTO Readers VALUES 
	('������ �.�', '��-3'),
	('������ �.�', '���-7'),
	('������ �.�', '���-1'),
	('������� �.�', '��-0'),
	('��������� �.�', '��-4'),
	('������ �.�', '��--3'),
	('������ �.�', '���-15'),
	('��������� �.�', '��-123'),
	('������� �.�', '��-2'),
	('�������� �.�', '��-1')

INSERT INTO Themes VALUES 
	('�����', '����� ��������� �������'),
	('�������', NULL),
	('����������', '������ ������'),
	('���������', NULL),
	('����������', '����� � ����������'),
	('����������� �����', NULL),
	('�������', NULL),
	('�����������', NULL),
	('��������', NULL),
	('��������������', NULL)
	
INSERT INTO Books VALUES
	('', '', 1991, 100, 12, '�������')
	
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