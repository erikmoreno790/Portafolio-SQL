-- Students with an average grade above the general average
SELECT 	e.estudiante_id, 
		CONCAT(e.nombre,' ', e.apellido), 
		AVG(m.calificacion) AS promedio_estudiante, 
		(SELECT AVG(calificacion) FROM matriculaciones WHERE calificacion IS NOT NULL) AS promedio_general
FROM estudiantes e
JOIN matriculaciones m ON e.estudiante_id = m.estudiante_id
WHERE m.calificacion IS NOT NULL
GROUP BY e.estudiante_id, e.nombre, e.apellido
HAVING AVG(m.calificacion) > (SELECT AVG(calificacion) FROM matriculaciones WHERE calificacion IS NOT NULL)
ORDER BY promedio_estudiante DESC;

-- Courses that do not have any students enrolled
SELECT c.curso_id, c.titulo
FROM cursos c 
WHERE curso_id NOT IN (SELECT curso_id FROM matriculaciones WHERE curso_id IS NOT NULL)

-- Students who have taken courses from at least 2 different departments
SELECT 
	e.estudiante_id,
	CONCAT(e.nombre, ' ',e.apellido)  AS estudiante,
	COUNT(DISTINCT c.departamento_id) AS departamentos_distintos
FROM estudiantes e
JOIN matriculaciones m ON e.estudiante_id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.curso_id
GROUP BY e.estudiante_id, e.nombre, e.apellido
HAVING COUNT(DISTINCT c.departamento_id) >=2
ORDER BY departamentos_distintos DESC;

-- Departments sorted by average course grade
SELECT
	d.departamento_id,
	d.nombre,
	ROUND(AVG(m.calificacion),2) AS calificacion_promedio_curso
FROM departamentos d
JOIN cursos c ON d.departamento_id = c.departamento_id
JOIN matriculaciones m ON m.curso_id = c.curso_id
WHERE m.calificacion IS NOT NULL
GROUP BY d.departamento_id, d.nombre
ORDER BY calificacion_promedio_curso DESC;

-- Professors who are department heads and also teach courses
SELECT DISTINCT CONCAT(p.nombre,' ',p.apellido) AS profesor
FROM profesores p
JOIN cursos c ON p.profesor_id = c.profesor_id
WHERE jefe_departamento = TRUE;
