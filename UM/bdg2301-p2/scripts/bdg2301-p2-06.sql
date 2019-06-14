--6. Para cada cliente (codigo), mostrar su �ltima solicitud de alquiler realizada (id,
--fecha_inicio). Tambi�n deben aparecer los clientes que no han solicitado ning�n
--alquiler, mostrando en la columna id la cadena de caracteres �---� y un NULL (o vac�o)
--en fecha_inicio. El listado ha de estar ordenado por c�digo de cliente.

SELECT codigo, NVL(id,'---') AS id, fecha_inicio
FROM (CLIENTE LEFT OUTER JOIN ALQUILER ON cliente = codigo)
WHERE  fecha_inicio >= ALL (SELECT fecha_inicio
                            FROM ALQUILER
                            WHERE cliente = codigo)

ORDER BY codigo;