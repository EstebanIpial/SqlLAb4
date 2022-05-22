--- elimina view
drop view better_students;
--- elimina tablas
drop table 
 requires,
 teaches,
 enrolls,
 course_offering,
 course,
 instructor,
 student;
--- elimina secuencia
drop SEQUENCE 
 seqStudent,
 seqCourse;
--- elimina triggers
drop TRIGGER 
 modifica on enrolls;
drop TRIGGER 
 antes_insertar on enrolls;
--- elimina funciones
drop FUNCTION 
 create_teaches,
 notificacion,
 mensajeError;