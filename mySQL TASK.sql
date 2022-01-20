

/* COMPLETED ON MICROSOFT SQL SERVER MANAGEMENT STUDIO  */

/* 1. TABLE - CREATION*/

CREATE TABLE demoDB.dbo.users (
  id INTEGER PRIMARY KEY,
  userName varchar(50) NOT NULL,
)
CREATE TABLE demoDB.dbo.codekata (
  id INTEGER PRIMARY KEY,
  userId INTEGER,
  no_of_problems_solved INTEGER,
)
CREATE TABLE demoDB.dbo.attendance (
   id INTEGER PRIMARY KEY,
   attendance INTEGER,
)
CREATE TABLE demoDB.dbo.topics (
   id INTEGER PRIMARY KEY,
   userId INTEGER,
   topics varchar(50) 
)
CREATE TABLE demoDB.dbo.tasks (
   id INTEGER PRIMARY KEY,
   userId INTEGER,
   tasks varchar(50)
)
CREATE TABLE demoDB.dbo.company_drives (
   id INTEGER PRIMARY KEY,
   userId INTEGER,
   company_drives varchar(50),
)
CREATE TABLE demoDB.dbo.mentors (
   id INTEGER PRIMARY KEY,
   userId INTEGER,
   mentors varchar(50)
)
CREATE TABLE demoDB.dbo.students_activated_courses (
   id INTEGER PRIMARY KEY,
   userId INTEGER,
   students_activated_courses varchar(50)
)
CREATE TABLE demoDB.dbo.courses (
   id INTEGER PRIMARY KEY,
   courses varchar(50)
)

/* 2. VALUES INSERTION*/

INSERT INTO  users 
VALUES (1,'Venki'),(2,'Sheela'),(3,'deepan'),(4,'kavin'),(5,'Kiruth');

INSERT INTO codekata 
VALUES (1,5,22),(2,4,22),(3,2,33),(4,1,44),(5,3,55);

INSERT INTO attendance
VALUES (1,20),(2,30),(3,40),(4,45),(5,35);

INSERT INTO topics 
VALUES (1,5,'JAVASCRIPT'),(2,3,'REACT'),(3,4,'SQL'),(4,2,'ES6-Functions'),
(5,1,'Arrays'),(6,3,'Routes');

INSERT INTO tasks
VALUES (1,3,'4-Router'),(2,2,'landing-page'),(3,4,'tic-tac-toe_game'),
(4,1,'context'),(5,5,'redux')

INSERT INTO company_drives
VALUES (1,4,'zoho'),(2,3,'apple'),(3,1,'google'),(4,2,'amazon'),
(5,5,'freshworks'),(6,3,'salesforce'),(7,4,'infosys'),(8,2,'accenture')

INSERT INTO mentors 
VALUES (1,3,'lavish'),(2,4,'mohan'),(3,5,'raghav')
,(4,2,'raghav'),(5,1,'lavish')

INSERT INTO students_activated_courses 
VALUES (1,3,'MERN'),(2,4,'DATA_SCIENCE'),(3,5,'MACHINE-LEARNING'),
(4,2,'MEAN'),(5,1,'PYTHON')

INSERT INTO courses 
VALUES (1,'MERN'),(2,'MEAN'),(3,'PYTHON'),
(4,'DATA_SCIENCE'),(5,'MACHINE-LEARNING'),(6,'CYBER-SECURITY')


/* 3. get number problems solved in codekata by combining the users */

SELECT SUM(no_of_problems_solved) as total_solved FROM demoDB.dbo.users
INNER JOIN demoDB.dbo.codekata
ON users.id = codekata.userId;

/*  4. display the no of company drives attended by a user */

SELECT username,count(company_drives) as no_of_drives FROM demoDB.dbo.users 
INNER JOIN demoDB.dbo.company_drives
ON users.id = company_drives.userId
GROUP BY username;

/*  5. combine and display students_activated_courses and courses for a specific user groping them based on the course */

SELECT * FROM demoDB.dbo.courses
LEFT JOIN (SELECT userName,students_activated_courses FROM demoDB.dbo.users 
INNER JOIN demoDB.dbo.students_activated_courses
ON users.id = 
students_activated_courses.userId) as userCourse
ON courses.courses = userCourse.students_activated_courses

/*  6. list all the mentors */

SELECT DISTINCT mentors FROM demoDB.dbo.mentors;


/*  7. list the number of students that are assigned for a mentor */

SELECT mentors,COUNT(userName) as no_of_students FROM demoDB.dbo.users
INNER JOIN demoDB.dbo.mentors
ON users.id = mentors.userId
GROUP BY mentors