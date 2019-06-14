--3. Garajes (codigo, nombre) de los que nunca se ha alquilado ningún coche.

SELECT codigo, nombre
FROM GARAJE
WHERE codigo NOT IN ( SELECT garaje FROM COCHE);