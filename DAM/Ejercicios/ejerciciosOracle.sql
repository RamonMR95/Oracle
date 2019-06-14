/*
 *  Ejercicios Oracle
 *  @author - Ramón Moñino Rubio
 *  Github - RamonMR95
 */


/* 1.- Obtener el primer registro de la tabla WAREHOUSES. */
SELECT *
FROM OEHR_WAREHOUSES
WHERE ROWNUM = 1;


/* 2.- Mostrar el cliente que ha adquirido un mayor número de productos diferentes.*/
SELECT CUSTOMER_ID
FROM OEHR_ORDERS o
JOIN OEHR_ORDER_ITEMS oi ON o.ORDER_ID = oi.ORDER_ID
GROUP BY CUSTOMER_ID
HAVING SUM(QUANTITY) >= ALL(SELECT SUM(QUANTITY)
                          FROM OEHR_ORDER_ITEMS
                          GROUP BY PRODUCT_ID):



/* 3.- Haciendo uso de Intersect elaborar una vista que muestre los vendedores
que también son clientes. Supondremos que un empleado es también cliente si
tiene el mismo nombre, el mismo apellido y el mismo número de teléfono. */
(SELECT CUST_FIRST_NAME, CUST_LAST_NAME, PHONE_NUMBER
FROM OEHR_CUSTOMERS)
INTERSECT
(SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER
FROM OEHR_EMPLOYEES);


/* 4.- Haciendo uso de MINUS mostrar los países donde hay clientes y no
hay almacén alguno. */
(SELECT COUNTRY_ID
FROM OEHR_CUSTOMERS c)
MINUS
(SELECT COUNTRY_ID
FROM OEHR_WAREHOUSES w
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID);


/* 5.- Haciendo uso de DECODE mostrar los nombres de los almacenes con sus
respectivos países pero mostrando "EEUU" cuando el nombre del país sea "United States
of America" y "Japón" cuando sea "Japan". Para los demás países mostrar "Otros"
en vez del nombre del país. */
SELECT WAREHOUSE_NAME ,DECODE(COUNTRY_NAME, 'United States of America', 'EEUU',
                                            'Japan', 'Japón',
                                            'otro')
FROM OEHR_WAREHOUSES
NATURAL JOIN OEHR_LOCATIONS
NATURAL JOIN OEHR_COUNTRIES;
