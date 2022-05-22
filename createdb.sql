--- crea la secuencia de id de estudiantes donde incrementa de 168 e inicia en 7488
CREATE SEQUENCE IF NOT EXISTS  seqStudent INCREMENT 168 START 7488;

--- Instruccion para crear la tabla Student
Create Table IF NOT EXISTS Student(
  student_Id INTEGER PRIMARY KEY DEFAULT nextval('seqStudent'),
  name VARCHAR(100) not NULL,
  program VARCHAR(100) not NULL
);
--- Instruccion para crear la tabla instructor
Create Table IF NOT EXISTS Instructor(
  instructor_Id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  dept VARCHAR(100) not NULL,
  title VARCHAR(100) not NULL
);
--- --- crea la secuencia de id de estudiantes donde incrementa de 23 e inicia en 837827 
CREATE SEQUENCE IF NOT EXISTS  seqCourse INCREMENT 23 START 837827;
--- Instruccion para crear la tabla curso
Create Table IF NOT EXISTS Course(
  course_Id INTEGER PRIMARY key DEFAULT nextval('seqCourse'),
  title VARCHAR(100)not NULL,
  syllabus VARCHAR(100)not NULL,
  credits INTEGER not NULL
);
--- Instruccion para crear la tabla curso_offering
Create Table IF NOT EXISTS Course_offering(
  course_id INTEGER,
  sec_Id SERIAL,
  year INTEGER,
  semester INTEGER,
  time VARCHAR(50)not NULL,
  classroom VARCHAR(50)not NULL,
  FOREIGN KEY(course_id) REFERENCES Course (course_Id),
  PRIMARY KEY(course_id,sec_Id,year,semester)
);

--- Instruccion para crear la tabla Enrols
Create Table IF NOT EXISTS Enrolls(
  student_id INTEGER,
  course_id INTEGER,
  sec_id SERIAL,
  semester INTEGER,
  year INTEGER,
  grade NUMERIC(3,2) CHECK(grade>=1 and grade<=5),
  FOREIGN KEY(student_id) REFERENCES Student (student_Id),
  FOREIGN KEY(course_id) REFERENCES Course (course_Id),
  PRIMARY KEY(student_id,course_id,sec_Id,semester,year)
);
--- Instruccion para crear la tabla teaches
Create Table IF NOT EXISTS Teaches(
  course_id INTEGER,
  sec_id SERIAL,
  semester INTEGER,
  year INTEGER,
  instructor_id INTEGER,
  FOREIGN KEY(course_id) REFERENCES Course (course_Id),
  FOREIGN KEY(instructor_id) REFERENCES Instructor (instructor_Id),
  PRIMARY KEY(course_id,sec_Id,semester,year,instructor_id)
);
--- Instruccion para crear la tabla Rquires
Create Table IF NOT EXISTS Requires(
  main_Course INTEGER,
  prerequisite INTEGER,
  FOREIGN KEY(main_Course) REFERENCES Course (course_Id),
  FOREIGN KEY(prerequisite) REFERENCES Course (course_Id),
  PRIMARY KEY(main_Course, prerequisite)
);
