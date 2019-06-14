--9. Clientes (dni, nombre) que han solicitado alquileres por medio de todas las agencias.
--Clientes tales que no existe agencia por la que haya solicitado un alquiler

SELECT dni, nombre
FROM CLIENTE C
WHERE NOT EXISTS
    ((SELECT codigo
        FROM AGENCIA)
        
        MINUS
        
      (SELECT agencia
       FROM ALQUILER Q
       WHERE C.codigo = Q.cliente));
              
                  

