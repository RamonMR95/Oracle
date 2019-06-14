--1. Solicitudes de alquiler (id, fecha_inicio, fecha_fin, coche, marca, modelo) de coches
--del garaje con código 'G1' realizadas a través de la agencia con código 'A4', ordenado
--por identificador de alquiler.

--Mediante JOIN de tres tablas
SELECT id, fecha_inicio, fecha_fin, coche, marca, modelo
FROM ALQUILER, DETALLE_ALQUILER, COCHE 
WHERE id = alquiler AND coche = matricula AND garaje = 'G1' AND agencia = 'A4';

--Mediante tablas reunidas
 SELECT id, fecha_inicio, fecha_fin, coche, marca, modelo
 FROM (ALQUILER
              JOIN (DETALLE_ALQUILER 
                    JOIN COCHE 
                    ON coche = matricula)
              ON alquiler = id)
WHERE  garaje = 'G1' AND agencia = 'A4';


