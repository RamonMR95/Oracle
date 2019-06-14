--5. Coche que más veces ha sido alquilado por el mismo cliente, indicando cuántas veces
--ha sido alquilado (coche, cliente, cuantos_alquileres).

SELECT coche, cliente, COUNT(*) cuantos_alquileres
FROM (DETALLE_ALQUILER  JOIN ALQUILER  ON alquiler = id)
GROUP BY  coche, cliente
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                  FROM DETALLE_ALQUILER, ALQUILER
                  WHERE id = alquiler
                  GROUP BY coche,cliente);


                    
                    



     