-- Increase the salaries of teachers hired before 2015 by 5%
UPDATE profesores 
SET salario = salario * 1.05 
WHERE fecha_contratacion < '2015-01-01' 
