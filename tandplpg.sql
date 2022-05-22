
---1)
---funcion que devuelve un trigger
CREATE OR REPLACE FUNCTION mensajeError()RETURNS TRIGGER 
AS $uno$
BEGIN
  RAISE EXCEPTION 'El valor a guardar en grade es incorrecto o invalido';
END;
$uno$
LANGUAGE plpgsql;

---trigger que llama a la funcion

CREATE OR REPLACE TRIGGER antes_insertar
BEFORE INSERT ON enrolls
FOR EACH ROW
  WHEN(NEW.grade<1 OR NEW.grade>5)
  EXECUTE FUNCTION mensajeError();

---2)

-- Creación de la función devuelve trigger --

CREATE OR REPLACE FUNCTION notificacion() RETURNS trigger 
AS $dos$
BEGIN    	
	RAISE NOTICE 'La modificación se realizo exitosamente';      
  RETURN new;
END;
$dos$
LANGUAGE 'plpgsql';

-- trigger que llama la funcion--
CREATE OR REPLACE TRIGGER modifica BEFORE UPDATE ON enrolls
    FOR EACH ROW
	WHEn (new.grade <> old.grade)
    EXECUTE PROCEDURE notificacion();

---3)
-- Creación de la función devuelve void --
CREATE OR REPLACE FUNCTION create_teaches(INTEGER,INTEGER) RETURNS void
AS $tres$
declare 
course ALIAS for $1;
instructor alias for $2;
year_y INTEGER;
semester_s INTEGER;
BEGIN    	
	year_y=(SELECT year from course_offering where course=course_offering.course_id);
    semester_s=(SELECT semester from course_offering where course=course_offering.course_id);
    
    INSERT into teaches(course_id,semester,year,instructor_id)
    values (course,semester_s,year_y,instructor);
END;
$tres$
LANGUAGE 'plpgsql';
