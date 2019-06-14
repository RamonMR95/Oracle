--7. Alquileres (id) que incluyen dos coches (coche), es decir, con sólo dos coches en el
--detalle de los alquileres individuales (por coche) en que consiste, y mediante qué
--agencia se ha contratado (agencia), ordenadas por identificador de alquiler
SELECT id, coche, agencia
FROM (DETALLE_ALQUILER JOIN ALQUILER ON alquiler = id) 

WHERE id IN  (SELECT alquiler
              FROM DETALLE_ALQUILER
              GROUP BY alquiler
              HAVING COUNT(*) = 2)
ORDER BY id;

