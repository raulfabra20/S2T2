-- BASE DE DATOS TIENDA:

-- 1. SELECT nombre FROM producto;

-- 2. SELECT nombre, precio FROM producto;

-- 3. SELECT * FROM producto;

-- 4. SELECT nombre, precio, ROUND(precio*1.09, 2) FROM producto;

-- 5. SELECT (nombre) AS nombre_del_producto , (precio) AS precio_en_euros , ROUND(precio*1.09, 2) AS precio_en_dolares FROM producto;

-- 6. SELECT UPPER(nombre) , precio FROM producto;

-- 7. SELECT LOWER(nombre) , precio FROM producto;

-- 8. SELECT nombre , UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;

-- 9. SELECT nombre, ROUND(precio) FROM producto;

-- 10. SELECT nombre, FLOOR(precio) FROM producto;

-- 11. SELECT codigo_fabricante FROM producto;

-- 12. SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. SELECT (nombre) AS nombres_ascendente , (precio) AS precio_descendente FROM producto ORDER BY nombres_ascendente ASC, precio_descendente DESC;

-- 16. SELECT * FROM fabricante LIMIT 5;

-- 17. SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. SELECT nombre FROM fabricante WHERE codigo_fabricante = 2;

-- 21. SELECT p.nombre, p.precio, (f.nombre) AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22. SELECT p.nombre, p.precio, (f.nombre) AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

-- 23. SELECT p.codigo_fabricante, p.nombre, f.codigo, (f.nombre) AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24. SELECT p.nombre, MIN(p.precio), (f.nombre) AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 25. SELECT p.nombre, MAX(p.precio), (f.nombre) AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 26. SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";

-- 27. SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial" && p.precio > 200;

-- 28. SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" || f.nombre = "Hewlett-Packard" || f.nombre = "Seagate";

-- 29. SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");

-- 30. SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%e";

-- 31. SELECT f.nombre, p.precio FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE "%w%";

-- 32. SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33. SELECT f.codigo, f.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo , f.nombre;

-- 34. SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35. SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36. SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";

-- 38. SELECT MAX(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";

-- 39. SELECT MIN(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard";











-- BASE DE DATOS UNIVERSIDAD

-- 1. SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "alumno" ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "alumno" && p.telefono IS NULL;

-- 3. SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "alumno" && YEAR(p.fecha_nacimiento) = 1999;

-- 4. SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = "profesor" && p.nif LIKE "%K" && p.telefono IS NULL;

-- 5. SELECT a.nombre FROM asignatura a WHERE a.cuatrimestre = 1 && a.curso = 3 && a.id_grado = 7;

-- 6. SELECT  p.nombre, p.apellido1, p.apellido2, d.nombre AS 'departamento' FROM persona p JOIN profesor pr ON p.id=pr.id_profesor JOIN departamento d ON pr.id_departamento=d.id ORDER BY apellido1 ASC, apellido2 ASC;

-- 7. SELECT a.nombre, c.anyo_inicio AS año_inicio, c.anyo_fin AS año_final FROM asignatura a JOIN curso_escolar ce ON a.curso = ce.id JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar AND a.id = asma.id_asignatura JOIN persona p ON asma.id_alumno = p.id WHERE p.nif = '26902806M';

-- 8. SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)";

-- 9. SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 && ce.anyo_fin = 2019;




-- CONSULTAS LEFT JOIN Y RIGHT JOIN:

-- 1. SELECT d.nombre, p.apellido1, p.apellido2, p.nombre AS nombre_departamento FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY d.nombre, p.apellido1, p.nombre ASC;

-- 2. SELECT p.apellido1, p.apellido2, p.nombre FROM profesor pr  LEFT JOIN departamento d ON d.id = pr.id_departamento LEFT JOIN persona p ON pr.id_profesor = p.id WHERE pr.id_departamento IS NULL;

-- 3. SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor LEFT JOIN persona per ON p.id_profesor=per.id WHERE p.id_profesor IS NULL;

-- 4. SELECT p.apellido1, p.apellido2, p.nombre FROM profesor pr RIGHT JOIN persona p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- 5. SELECT a.nombre AS nombre_asignatura FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE pr.id_profesor IS NULL;

-- 6. SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;




-- CONSULTAS RESUMEN

-- 1. SELECT COUNT(*) AS total_alumnos FROM persona p WHERE p.tipo = "alumno";

-- 2. SELECT COUNT(*) AS total_alumnos_nacidos_1999 FROM persona p WHERE p.tipo = "alumno" && YEAR(p.fecha_nacimiento) = 1999;

-- 3. SELECT (d.nombre) AS nombre_departamento, COUNT(pr.id_profesor) AS numero_profesores_por_departamento FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY numero_profesores_por_departamento DESC;

-- 4. SELECT d.nombre, COUNT(pr.id_profesor) AS numero_profesores FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.nombre;

-- 5. SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;

-- 6. SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING numero_asignaturas > 40;

-- 7. SELECT g.nombre, a.tipo, SUM(a.creditos) AS numero_creditos FROM grado g  JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;

-- 8. SELECT ce.anyo_inicio, COUNT(asma.id_alumno) AS numero_alumnos_matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_alumno GROUP BY ce.anyo_inicio;

-- 9. SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS 'asignaturas' FROM profesor pr LEFT JOIN persona p ON pr.id_profesor=p.id LEFT JOIN asignatura a ON pr.id_profesor=a.id_profesor GROUP BY pr.id_profesor, p.nombre, p.apellido1, p.apellido2 ORDER BY asignaturas DESC;

-- 10. SELECT * FROM persona p WHERE p.tipo = "alumno" ORDER BY p.fecha_nacimiento DESC LIMIT 1;

-- 11. SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;










