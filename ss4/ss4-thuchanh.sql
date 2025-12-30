CREATE DATABASE IF NOT EXISTS OnlineLearning;
USE OnlineLearning;

CREATE TABLE Student (
    student_id CHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Instructor (
    instructor_id CHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Course (
    course_id CHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    sessions INT NOT NULL CHECK (sessions > 0),
    instructor_id CHAR(10) NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    student_id CHAR(10) NOT NULL,
    course_id CHAR(10) NOT NULL,
    enroll_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result (
    student_id CHAR(10) NOT NULL,
    course_id CHAR(10) NOT NULL,
    mid_score DECIMAL(4,2),
    final_score DECIMAL(4,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student VALUES
('SV01','Do Ngoc Dan','2003-01-10','dan@gmail.com'),
('SV02','Tran Van Thang','2003-02-15','thang@gmail.com'),
('SV03','Le Van Chien','2003-03-20','chien@gmail.com'),
('SV04','Le Van Anh','2003-04-25','anh@gmail.com'),
('SV05','Nguyen Anh Ngoc','2003-05-30','ngoc@gmail.com');

INSERT INTO Instructor VALUES
('GV01','Nguyen Van An','an@gmail.com'),
('GV02','Tran Thi Mai','mai@gmail.com'),
('GV03','Le Van Hung','hung@gmail.com'),
('GV04','Pham Thi Lan','lan@gmail.com'),
('GV05','Do Ngoc Tuan','tuan@gmail.com');

INSERT INTO Course VALUES
('KH01','Co so du lieu','Nhap mon CSDL',30,'GV01'),
('KH02','Lap trinh Java','Java can ban',45,'GV02'),
('KH03','Mang may tinh','Kien thuc mang',30,'GV03'),
('KH04','He dieu hanh','Nguyen ly HDH',30,'GV04'),
('KH05','Thiet ke Web','HTML CSS JS',40,'GV05');

INSERT INTO Enrollment VALUES
('SV01','KH01','2024-09-01'),
('SV01','KH02','2024-09-01'),
('SV02','KH01','2024-09-02'),
('SV03','KH03','2024-09-03'),
('SV04','KH04','2024-09-04');

INSERT INTO Result VALUES
('SV01','KH01',7.5,8.0),
('SV01','KH02',6.5,7.5),
('SV02','KH01',8.0,8.5),
('SV03','KH03',7.0,9.0),
('SV04','KH04',6.0,7.0);

UPDATE Student
SET email = 'dan_new@gmail.com'
WHERE student_id = 'SV01';

UPDATE Instructor
SET email = 'an_new@gmail.com'
WHERE instructor_id = 'GV01';

UPDATE Course
SET description = 'Java nang cao'
WHERE course_id = 'KH02';

UPDATE Result
SET final_score = 9.0
WHERE student_id = 'SV01' AND course_id = 'KH01';

DELETE FROM Enrollment
WHERE student_id = 'SV04' AND course_id = 'KH04';

DELETE FROM Result
WHERE student_id = 'SV04' AND course_id = 'KH04';

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;
