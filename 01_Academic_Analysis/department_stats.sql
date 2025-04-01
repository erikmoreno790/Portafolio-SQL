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

-- Departments whose average budget per course is greater than $30,000
SELECT d.departamento_id, d.nombre, COUNT(c.curso_id) AS cantidad_cursos, d.presupuesto AS Presupuesto_total, d.presupuesto / COUNT(c.curso_id) AS Presupuesto_promedio
FROM departamentos d 
JOIN cursos c ON d.departamento_id = c.departamento_id
GROUP BY d.departamento_id, d.nombre
HAVING d.presupuesto / COUNT(c.curso_id) > 30000
ORDER BY d.departamento_id;
