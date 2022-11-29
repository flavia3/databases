CREATE TABLE Authors(
	author_id bigint PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL,
	author_email  varchar(255) NOT NULL UNIQUE,
	bio varchar(255) NOT NULL,
	contact int UNIQUE,
	company_id bigint NOT NULL,
	FOREIGN KEY (company_id) REFERENCES P_company(company_id)
);

CREATE TABLE Books(
	book_id bigint NOT NULL PRIMARY KEY ,
	title varchar(255) NOT NULL UNIQUE,
	price integer NOT NULL,
	description varchar(255) NOT NULL,
	publish_date date NOT NULL,
	publish_year int NOT NULL,
	isbn_no int NOT NULL,
	image bit NULL,
	student_id bigint NOT NULL,
	author_id bigint NOT NULL,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
	FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Borrowers(
	borrower_id bigint NOT NULL,
	status varchar(255) NOT NULL,
	taken_date date NOT NULL,
	student_id bigint NOT NULL,
	librarian_id bigint NOT NULL,
	shift_id bigint NOT NULL,
	book_id bigint NOT NULL,
	PRIMARY KEY (borrower_id),
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
	FOREIGN KEY (librarian_id) REFERENCES librarian(librarian_id),
	FOREIGN KEY (shift_id ) REFERENCES Shifts(shift_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE  P_company(
	company_id bigint NOT NULL,
	name varchar(255) NOT NULL,
	location varchar(255) NOT NULL,
	plot_no int NOT NULL,
	PRIMARY KEY (company_id)
);

CREATE TABLE Shifts(
	shift_id bigint NOT NULL,
	name varchar(255) NOT NULL,
	start_time time NOT NULL,
	end_time  time NOT NULL,
	 PRIMARY KEY (shift_id)
);

CREATE TABLE Students(
	student_id bigint NOT NULL,
	name varchar(255) NOT NULL,
	student_contact int NOT NULL UNIQUE,
	addresss varchar(255) NOT NULL,
	date_of_borrow date NOT NULL,
	date_of_return date NOT NULL,
	borrower_id bigint NOT NULl,
	shift_id bigint NOT NULL,
	PRIMARY KEY (student_id),
	FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id),
	FOREIGN KEY (shift_id) REFERENCES Shifts(shift_id)
);

CREATE TABLE librarians(
	librarian_id bigint NOT NULL,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL UNIQUE,
	telephone int NOT NULL UNIQUE,
	shift_id bigint NOT NULL ,
	PRIMARY KEY (librarian_id),
	FOREIGN KEY (shift_id) REFERENCES librarians(librarian_id)
);







INSERT INTO Authors(author_id, name, author_email, bio, contact, company_id)
VALUES( '1','Andrea', 'andrea@gmail.com', 'writer', '0765892314', '1'),
('2', 'Mary', 'mary@gmail.com', 'writer','0786945324','2');

INSERT INTO Borrower(borrower_id, status, return_date, taken_date, student_id, librarian_id, shift_id, book_id)
VALUES('1', 'yes', '2022-3-21', '2022-2-13', '1','1','1','1'),
('2', 'no', '2022-7-6', '2022-4-8', '2','2','2','2');

INSERT INTO P_company(company_id, name, location, plot_no)
VALUES('1', 'Penguin Random house', 'California', '12'),
('2', 'Fountain Publishers', 'Kenya', '32');

INSERT INTO Shifts(shift_id, name, start_time, end_time)
VALUES('1', morning, '7:00', '12:00'),
('2', 'evening', '1:00', '5:00');

INSERT INTO students(student_id, name, student_contact,address, date_of_borrow, date_of_return, borrower_id, shift_id)
VALUES ('1', 'Flavia', '0700456234', 'Mulago', '2022-4-2', '2022-6-15', '1', '2'),
('2', ‘Drinah’, '075689574', ‘Gayaza’, '2022-1-2', '2022-3-5','2','1'),
('3', 'Aisha', '0700456718', 'Ntinda', '2022-7-1', '2022-7-6', '2','2');

INSERT INTO librarian(librarian_id, name, email, telephone_no, shift_id)
VALUES ('1','Agray', 'agray@gmail.com', '0751645323', '1'),
('2', 'Amelia', 'amelia@gmail.com', '0756231457', '2');

INSERT INTO Books(book_id, title, price, description, publish_date, publish_year, isbn_no, image, student_id, author_id)
VALUES(1, 'Alien woman', '23', 'novel', '1981-2-3', '1981', '501',null,'1','1'),
(2, 'Betrayal in the city', 'play', '2000-4-5, 2000', '112',null, '2','2');


SELECT * FROM  Authors;
SELECT * FROM librarians WHERE  shift_id = 1;
SELECT * FROM Students WHERE borrower_id = 2;
SELECT name, company_id  FROM Authors;
SELECT COUNT (DISTINCT author_id) FROM Books;
 



