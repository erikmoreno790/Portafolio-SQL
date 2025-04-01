--List of courses with their duration in hours (difference between end_time and start_time)
SELECT DISTINCT c.titulo, h.hora_inicio, h.hora_fin, (h.hora_fin - h.hora_inicio) AS duracion_horas
FROM cursos c
JOIN horarios h ON h.curso_id = c.curso_id
ORDER BY duracion_horas;

-- Students who have classes on Mondays and Wednesdays
SELECT DISTINCT CONCAT(e.nombre,' ',e.apellido) AS estudiante
FROM estudiantes e
WHERE e.estudiante_id IN 
-- Students with classes on Mondays
	(SELECT m.estudiante_id FROM matriculaciones m 
	JOIN horarios h ON m.curso_id = h.curso_id
	WHERE dia_semana = 'Lunes')
-- Students with classes on Wednesdays
AND e.estudiante_id IN 
	(SELECT m.estudiante_id FROM matriculaciones m 
	JOIN horarios h ON m.curso_id = h.curso_id
	WHERE dia_semana = 'Miércoles')
