-- Day of the week on which the students were born
SELECT TO_CHAR(fecha_nacimiento, 'Day') AS Dia_nacimiento 
FROM estudiantes;

-- List of students under 23 years old
SELECT * FROM estudiantes 
WHERE EXTRACT(YEAR FROM AGE(fecha_nacimiento)) < 23;

-- Courses that have exactly 6 credits
SELECT * FROM cursos 
WHERE creditos = 6;

-- Professors who earn more than $40,000 and are not department heads
SELECT * FROM profesores 
WHERE salario > 40000 and jefe_departamento = False;

-- Names of students with the courses they are enrolled in (including those who are not enrolled)
SELECT * FROM estudiantes e 
LEFT JOIN matriculaciones m ON e.estudiante_id = m.matricula_id;

-- Departments that do not have assigned courses
SELECT * FROM departamentos d 
LEFT JOIN cursos c ON d.departamento_id = c.curso_id;

-- Advanced Programming Course Schedule
SELECT * FROM cursos c 
JOIN horarios h ON c.curso_id = h.horario_id WHERE titulo = 'Programación Avanzada';

-- Total number of credits enrolled by each student
SELECT e.nombre, e.apellido, SUM(c.creditos) AS total_Creditos 
FROM estudiantes e 
JOIN cursos c ON e.estudiante_id = c.curso_id 
GROUP BY e.estudiante_id;

-- Average salary of teachers by specialty
SELECT *, AVG(p.salario) AS salario_promedio  
FROM profesores p  
GROUP BY p.especialidad, p.profesor_id;
