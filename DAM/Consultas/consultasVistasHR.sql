/*
 *  Consultas sobre la base de datos HR de oracle
 *  @author - Ramón Moñino Rubio
 *  Github - RamonMR95
 */

/* 1.- Obtener los empleados con el nombre de su país de origen. */
SELECT FIRST_NAME, COUNTRY_NAME
FROM OEHR_EMP_DETAILS_VIEW;


/* 2.- Obtener el inventario (PRODUCT_ID, PRODUCT_NAME, QUANTITY_ON_HAND)
del almacén de Toronto */
SELECT *
FROM OEHR_TORONTO_INVENTORY;

SELECT p.PRODUCT_ID, PRODUCT_NAME, QUANTITY_ON_HAND
FROM OEHR_PRODUCT_INFORMATION p , OEHR_INVENTORIES i, OEHR_WAREHOUSES w, OEHR_LOCATIONS l
WHERE p.PRODUCT_ID = i.PRODUCT_ID
  AND i.WAREHOUSE_ID = w.WAREHOUSE_ID
  AND w.LOCATION_ID = l.LOCATION_ID
  AND l.CITY LIKE 'Toronto';

/* 3.- Obtener la cantidad de clientes de cada región */
SELECT COUNT(CUSTOMER_ID), REGION_NAME
FROM OEHR_CUSTOMERS_VIEW c, OEHR_REGIONS r
WHERE r.REGION_ID = c.REGION_ID
GROUP BY REGION_NAME;


SELECT COUNT(CUSTOMER_ID), REGION_NAME
FROM OEHR_CUSTOMERS c, OEHR_COUNTRIES co, OEHR_REGIONS r
WHERE c.COUNTRY_ID = co.COUNTRY_ID
  AND r.REGION_ID = co.REGION_ID
GROUP BY REGION_NAME;


/* 4.- Para cada categoría de productos mostrar el número de productos diferentes,
el precio mínimo y el máximo. */
SELECT *
FROM OEHR_PRODUCT_PRICES;


SELECT category_id, count(*) AS N_productos, MIN(list_price) AS precio_minimo, MAX(list_price) AS precio_maximo
FROM OEHR_PRODUCT_INFORMATION
GROUP BY category_id;


/* 5.- Obtener el nombre de empleado,  el nombre de departamento en que trabaja,
la tarea que desempeña, la ciudad, el país y la región para cada uno de los
empleados. */
SELECT FIRST_NAME, DEPARTMENT_NAME, JOB_TITLE, CITY, COUNTRY_NAME, REGION_NAME
FROM OEHR_EMP_DETAILS_VIEW;

SELECT e.first_name, d.department_name, j.job_title, l.city, c.country_name, r.region_name
FROM  oehr_employees e
JOIN oehr_departments d ON e.department_id = d.department_id
JOIN oehr_jobs j ON j.job_id = e.job_id
JOIN oehr_locations l ON d.location_id = l.location_id
JOIN oehr_countries c ON  l.country_id = c.country_id
JOIN oehr_regions r ON  c.region_id = r.region_id;
