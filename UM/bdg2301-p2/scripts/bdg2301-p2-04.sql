--4. Clientes (dni, nombre) que hayan alquilado algún coche de la marca ‘Volkswagen’ más
--de 2 veces. Se debe considerar los alquileres individuales de los coches, es decir, si una
--misma solicitud de alquiler consiste en el alquiler de varios coches de esta marca, debe
--contabilizarse cada uno de ellos.   

SELECT dni, nombre
FROM CLIENTE T
WHERE 2 < ( SELECT COUNT(*)
            FROM DETALLE_ALQUILER D, COCHE C, ALQUILER Q
            WHERE T.codigo = Q.cliente AND D.coche = C.matricula AND D.alquiler = Q.id AND C.marca = 'VOLKSWAGEN');
            


                          


