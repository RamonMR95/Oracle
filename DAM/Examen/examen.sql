/*
 *  Examen Oracle
 *  @author - Ramón Moñino Rubio
 *  Github - RamonMR95
 */

 /* 1.- Crear una vista utilizando MINUS que muestre los códigos de productos que
 hay en almacenes de EEUU ("United States of America") y no en el resto. */
 CREATE OR REPLACE VIEW ej1 (COD_ART)
 AS SELECT PRODUCT_ID
FROM OEHR_INVENTORIES i
JOIN OEHR_WAREHOUSES w ON i.WAREHOUSE_ID = w.WAREHOUSE_ID
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES co ON l.COUNTRY_ID = co.COUNTRY_ID
WHERE co.COUNTRY_NAME = 'United States of America'
MINUS
SELECT PRODUCT_ID
FROM OEHR_INVENTORIES i
JOIN OEHR_WAREHOUSES w ON i.WAREHOUSE_ID = w.WAREHOUSE_ID
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES co ON l.COUNTRY_ID = co.COUNTRY_ID
WHERE co.COUNTRY_NAME NOT LIKE 'United States of America';




/* 2.- NOTA IMPORTANTE: Leer la pregunta 3 antes de realizar el ejercicio 2 para adecuar el ejercicio 2 a las
necesidades del ejercicio 3. Se desea realizar una oferta que consiste en aplicar un 15% de descuento sobre
el precio (LIST_PRICE) de los productos cuyo stock total supera las 200 unidades (contabilizando todos loa
almacenes). Crear una vista que muestre los precios de venta durante el periodo de oferta. */
CREATE OR REPLACE VIEW ej2 (COD_PROD, LIST_PRICE, DESCUENTO, IVA, STOCK)
AS SELECT p.PRODUCT_ID, p.LIST_PRICE, p.LIST_PRICE - (p.LIST_PRICE * 0.15) AS DESCUENTO, p.LIST_PRICE * 1.21 AS IVA, inv.QUANTITY_ON_HAND
FROM OEHR_PRODUCT_INFORMATION p
JOIN OEHR_INVENTORIES inv ON p.PRODUCT_ID = inv.PRODUCT_ID
WHERE inv.QUANTITY_ON_HAND > 200;

/* 3.- Utilizando la vista creada en el ejercicio anterior (o modificándola si fuera necesario) mostrar mediante una consulta el
 precio con descuento más IVA de los productos junto al stock actual de cada producto.*/
SELECT COD_PROD, DESCUENTO, IVA, STOCK
FROM ej2;


/* 4.- Crear una vista que muestre el empleado que tenga más empleados a su cargo (de forma directa) y muestre un complemento
de 50 euros por cada empleado que tiene a su cargo.*/
CREATE OR REPLACE VIEW ej4 (EMPLEADO, N_EMP)
AS SELECT e.EMPLOYEE_ID, COUNT(b.EMPLOYEE_ID)*50 AS COMPLEMENTO
FROM OEHR_EMPLOYEES e
JOIN OEHR_EMPLOYEES b ON e.EMPLOYEE_ID = b.MANAGER_ID
GROUP BY e.EMPLOYEE_ID
HAVING COUNT(b.EMPLOYEE_ID) = (SELECT MAX(COUNT(b.EMPLOYEE_ID))
                              FROM OEHR_EMPLOYEES e
                              JOIN OEHR_EMPLOYEES b ON e.EMPLOYEE_ID = b.MANAGER_ID
                              GROUP BY e.EMPLOYEE_ID)

/* 5.- Mostrar el almacén que tenga los artículos con mayor precio medio. */
SELECT WAREHOUSE_ID
FROM OEHR_INVENTORIES inv
JOIN OEHR_PRODUCT_INFORMATION i ON inv.PRODUCT_ID = i.PRODUCT_ID
GROUP BY WAREHOUSE_ID
HAVING AVG(LIST_PRICE) = (SELECT MAX(AVG(LIST_PRICE))
                            FROM OEHR_PRODUCT_INFORMATION i
                            JOIN OEHR_INVENTORIES inv ON inv.PRODUCT_ID = i.PRODUCT_ID
                            GROUP BY WAREHOUSE_ID);

/* 6.- Mostrar el almacén de fuera de EEUU ("United States of America") que tiene productos por
un mayor valor junto a la cantidad de artículos y su precio medio. */
SELECT w.WAREHOUSE_ID, COUNT(inv.PRODUCT_ID), AVG(p.LIST_PRICE)
FROM OEHR_WAREHOUSES w
JOIN OEHR_INVENTORIES inv ON w.WAREHOUSE_ID = inv.WAREHOUSE_ID
JOIN OEHR_PRODUCT_INFORMATION p ON inv.PRODUCT_ID = p.PRODUCT_ID
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
WHERE COUNTRY_NAME != 'United States of America'
GROUP BY w.WAREHOUSE_ID
HAVING COUNT(inv.PRODUCT_ID) = (SELECT MAX(COUNT(inv.PRODUCT_ID))
                                  FROM OEHR_PRODUCT_INFORMATION p
                                  JOIN OEHR_INVENTORIES inv ON p.PRODUCT_ID = inv.PRODUCT_ID
                                  JOIN OEHR_WAREHOUSES w ON inv.WAREHOUSE_ID = w.WAREHOUSE_ID
                                  JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
                                  JOIN OEHR_COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
                                  GROUP BY w.WAREHOUSE_ID);

/* 7.- Mostrar el nombre del país donde trabajan el mayor número de empleados. */
SELECT COUNTRY_NAME
FROM OEHR_COUNTRIES co
JOIN OEHR_LOCATIONS l ON co.COUNTRY_ID = l.COUNTRY_ID
JOIN OEHR_DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
JOIN OEHR_EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY COUNTRY_NAME
HAVING COUNT(EMPLOYEE_ID) = (SELECT MAX(COUNT(EMPLOYEE_ID))
                            FROM OEHR_EMPLOYEES e
                            JOIN OEHR_DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
                            JOIN OEHR_LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID
                            JOIN OEHR_COUNTRIES co ON l.COUNTRY_ID = co.COUNTRY_ID
                            GROUP BY COUNTRY_NAME);

/* 8.- Haciendo uso de DECODE mostrar los nombres de los almacenes con sus respectivos países
pero mostrando "EEUU" cuando el nombre del país sea "United States of America" y
"Gran Bretaña" cuando sea "United Kingdom". Para los demás países mostrar "Otros" en
vez del nombre del país */
SELECT w.WAREHOUSE_NAME, DECODE(co.COUNTRY_NAME, 'United States of America', 'EEUU'
                                          , 'Gran Bretaña', 'United Kingdom'
                                          , 'Otros')
FROM OEHR_WAREHOUSES w
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES co ON l.COUNTRY_ID = co.COUNTRY_ID;
