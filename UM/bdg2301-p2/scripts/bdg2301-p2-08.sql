--8. Clientes que s�lo han solicitado alquileres [una o muchas veces] a trav�s de una �nica
--agencia (cliente, agencia), por orden de c�digo de cliente.
SELECT DISTINCT cliente, agencia
FROM ALQUILER 
WHERE cliente IN (SELECT cliente 
                  FROM ALQUILER
                  GROUP BY cliente 
                  HAVING COUNT(*) = 1)
ORDER BY cliente;


