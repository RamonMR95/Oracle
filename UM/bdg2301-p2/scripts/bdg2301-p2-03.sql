--3. Garajes (codigo, nombre) de los que nunca se ha alquilado ning�n coche.

SELECT codigo, nombre
FROM GARAJE
WHERE codigo NOT IN ( SELECT garaje FROM COCHE);