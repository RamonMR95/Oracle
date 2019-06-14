-- Ejercicio 6

SELECT *
FROM ARTICULO
ORDER BY identificador;

DELETE FROM ARTICULO
WHERE (numero,revista) IN (SELECT numero,revista
                            FROM NUMERO_REVISTA
                            WHERE fecha_publicacion > TO_DATE('01-05-2016', 'DD-MM-YYYY')) AND periodista_plantilla NOT IN ( SELECT coordinador 
                                                                                                                              FROM REVISTA);

SELECT *
FROM ARTICULO
ORDER BY identificador;