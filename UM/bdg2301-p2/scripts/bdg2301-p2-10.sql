--10. Número y coste del alquiler más caro realizado para cada marca y modelo de coche
--(alquiler, marca, modelo, coste_coche). Obviamente, se debe considerar los alquileres
--individuales de los coches

SELECT alquiler, marca, modelo, coste_coche
FROM (DETALLE_ALQUILER JOIN COCHE ON matricula = coche)
WHERE coste_coche IN ( SELECT MAX( coste_coche)
                       FROM (DETALLE_ALQUILER JOIN COCHE ON coche = matricula)
                       GROUP BY marca, modelo);
                    

