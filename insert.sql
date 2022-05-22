--- insertar valores

---inserta valores a estudiantes
INSERT into student (name,program ) 
VALUES
	  ('estudiante1','programa1'),
    ('estudiante2','programa2'),
    ('estudiante3','programa3'),
    ('estudiante4','programa4'),
    ('estudiante5','programa5'),
    ('estudiante6','programa6');

---inserta valores a instructor

insert into instructor(name,dept,title)
VALUES
	  ('profesor1','Ingenieria','IngIndustrial'),
    ('profesor2','Salud','Pisologo'),
    ('profesor3','Diseño','Diseñador'),
	  ('profesor4','Filosofia','Filosofo'),
    ('profesor5','Fisica','Fisico'),
    ('profesor6','Historia','Historiador');



---inserta valores a cursos
---Curso vacio
insert into course
VALUES
	(0,'','',0);
insert into course (title,syllabus,credits)
VALUES
	('calculo1','programa1',4),
        ('calculo2','programa2',3),
        ('Fisica','programa3',5),
        ('Español','programa4',2),
        ('Ingles1','programa5',3),
        ('ingles2','programa6',3);


---inserta valores a cursos ofertados

insert into course_offering(course_id,year,semester,time,classroom)
VALUES
		    (837827,2022 , 1 ,'tiempo1','classroom1'),
        (837850,2021 , 2 ,'tiempo2','classroom2'),
        (837873,2020 , 3 ,'tiempo3','classroom3'),
        (837896,2019 , 4 ,'tiempo4','classroom4'),
        (837919,2018 , 5 ,'tiempo5','classroom5'),
        (837942,2017 , 6 ,'tiempo6','classroom6');


---inserta valores a enrolls

insert into enrolls(student_id,course_id,semester,year,grade)
VALUES
		    (7488,837827,1,2022,3.0),
        (7656,837850,2,2021,3.5),
        (7824,837873,3,2020,4.0),
        (7992,837896,4,2019,4.2),
        (8160,837919,5,2018,4.5),
        (8328,837942,6,2017,5.0);


---inserta valores a teaches

insert into teaches(course_id,semester,year,instructor_id)
VALUES
		    (837827,1,2022 ,1),
        (837850,2,2021 ,2),
        (837873,3,2020 ,3),
        (837896,4,2019 ,4),
        (837919,5,2018 ,5),
        (837942,6,2017 ,6);


---inserta valores a requisitos

insert into requires(main_course,prerequisite)
VALUES
	(837827,0),
        (837850,837827),
        (837873,837850),
        (837896,0),
        (837919,0),
        (837942,837919);
