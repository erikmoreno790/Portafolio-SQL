-- 🔸Courses with fewer than 3 students enrolled🔸
SELECT 
    c.curso_id,
    c.titulo,
    COUNT(m.estudiante_id) AS num_estudiantes
FROM cursos c
JOIN matriculaciones m ON c.curso_id = m.curso_id
GROUP BY c.curso_id
HAVING COUNT(m.estudiante_id) < 3; 

-- 🔸Courses that do not have any students enrolled🔸
SELECT c.curso_id, c.titulo
FROM cursos c 
WHERE curso_id NOT IN (SELECT curso_id FROM matriculaciones WHERE curso_id IS NOT NULL)

-- 🔸List of courses with their duration in hours (difference between end_time and start_time)🔸
SELECT DISTINCT c.titulo, h.hora_inicio, h.hora_fin, (h.hora_fin - h.hora_inicio) AS duracion_horas
FROM cursos c
JOIN horarios h ON h.curso_id = c.curso_id
ORDER BY duracion_horas;

-- 🔸Courses with the highest number of failures (grade < 5)🔸
SELECT 
	c.curso_id,
	c.titulo, 
	COUNT(*) AS numero_suspensos 
FROM cursos c
JOIN matriculaciones m ON c.curso_id = m.curso_id
WHERE m.calificacion < 5 AND m.calificacion IS NOT NULL
GROUP BY c.curso_id, c.titulo
ORDER BY numero_suspensos DESC;
