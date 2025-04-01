-- Disenroll inactive students who do not have recent enrollments (before 2023)
DELETE FROM estudiantes 
WHERE estudiante_id IN (
	SELECT e.estudiante_id
	FROM estudiantes e
	JOIN matriculaciones m ON e.estudiante_id = m.estudiante_id
	WHERE e.activo = FALSE AND (m.fecha_matricula < '2023-01-01' OR m.estudiante_id IS NULL)
)
