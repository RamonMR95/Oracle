--8. Clientes que sólo han solicitado alquileres [una o muchas veces] a través de una única
--agencia (cliente, agencia), por orden de código de cliente.
SELECT DISTINCT cliente, agencia
FROM ALQUILER 
WHERE cliente IN (SELECT cliente 
                  FROM ALQUILER
                  GROUP BY cliente 
                  HAVING COUNT(*) = 1)
ORDER BY cliente;


