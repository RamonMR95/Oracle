--6. Para cada cliente (codigo), mostrar su última solicitud de alquiler realizada (id,
--fecha_inicio). También deben aparecer los clientes que no han solicitado ningún
--alquiler, mostrando en la columna id la cadena de caracteres ‘---’ y un NULL (o vacío)
--en fecha_inicio. El listado ha de estar ordenado por código de cliente.

SELECT codigo, NVL(id,'---') AS id, fecha_inicio
FROM (CLIENTE LEFT OUTER JOIN ALQUILER ON cliente = codigo)
WHERE  fecha_inicio >= ALL (SELECT fecha_inicio
                            FROM ALQUILER
                            WHERE cliente = codigo)

ORDER BY codigo;