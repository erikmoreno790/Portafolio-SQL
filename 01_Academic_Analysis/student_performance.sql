-- 🔸 Students who passed more than 1 course🔸
SELECT e.estudiante_id, CONCAT(e.nombre, ' ', e.apellido) AS estudiante, COUNT(*) AS cantidad_aprobado 
FROM estudiantes e 
JOIN matriculaciones m ON e.estudiante_id = m.estudiante_id
WHERE m.aprobado = True
GROUP BY e.estudiante_id, e.nombre, e.apellido
HAVING COUNT(*) > 1;

-- 🔸 Students with an average grade above the general average🔸
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

-- 🔸 Students whose last name ends in "ez" and their average grade🔸
SELECT e.estudiante_id, e.nombre, e.apellido, AVG(m.calificacion) AS calificacion_promedio
FROM estudiantes e JOIN matriculaciones m ON e.estudiante_id = m.estudiante_id
WHERE e.apellido LIKE '%ez'
GROUP BY e.estudiante_id; 

-- 🔸 Students who have taken courses from at least 2 different departments🔸
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
