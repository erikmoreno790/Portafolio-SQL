-- Difference in days between the enrollment date and the student registration date
SELECT DISTINCT CONCAT(e.nombre,' ',e.apellido), m.fecha_matricula, e.fecha_registro, (m.fecha_matricula - e.fecha_registro) AS dias_diferencia
FROM matriculaciones m 
JOIN estudiantes e ON m.estudiante_id = e.estudiante_id
ORDER BY dias_diferencia DESC;

-- Average grade point average per semester
SELECT
	semestre,
	ROUND(AVG(calificacion),2) AS promedio
FROM matriculaciones
WHERE calificacion IS NOT NULL
GROUP BY semestre
