/* 3. Modificar valores de una columna.
a- Subir un 3% el precio por art�culo pagado a los periodistas freelance que colaboran con m�s de 2
revistas.
Si no tiene datos que se ajusten a este enunciado, introd�zcalos antes de realizar el ejercicio. */

SELECT *
FROM COLABORACION;

UPDATE COLABORACION
  SET pago = pago*1.03
  WHERE periodista_freelance IN ( SELECT periodista_freelance
                                  FROM COLABORACION
                                  GROUP BY periodista_freelance
                                  HAVING COUNT(*) > 2);

SELECT *
FROM COLABORACION;


COMMIT;
