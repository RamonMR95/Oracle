/*
 *  Consultas sobre la base de datos HR de oracle
 *  @author - Ramón Moñino Rubio
 *  Github - RamonMR95
 */

/* 1.- Obtener los empleados con salario superior a los 22000 */
SELECT *
FROM OEHR_EMPLOYEES
WHERE SALARY > 22000;


/* 2.- Obtener los clientes cuya línea de crédito es inferior a 500 */
SELECT *
FROM OEHR_CUSTOMERS
WHERE CREDIT_LIMIT < 500;


/* 3.- Obtener todos los clientes de Australia */
SELECT *
FROM OEHR_CUSTOMERS CU, OEHR_COUNTRIES C
WHERE CU.COUNTRY_ID = C.COUNTRY_ID
 AND C.COUNTRY_NAME LIKE 'AUSTRALIA';


/* 4.- Hallar los departamentos que no tienen Manager */
SELECT DEPARTMENT_ID
FROM FROM OEHR_DEPARTMENTS
WHERE DEPARTMENT_ID IS NULL;


/* 5.-Usando la tabla JOB_HISTORY hallar todos los apellidos de los empleados junto
con el nombre del departamento dónde trabajan o han trabajado en los departamentos
"Marketing" o "IT", indicando también la fecha de contratación en ese departamento. */
SELECT LAST_NAME, DEPARTMENT_NAME, START_DATE
FROM OEHR_EMPLOYEES e
JOIN OEHR_JOB_HISTORY jh ON e.EMPLOYEE_ID=jh.EMPLOYEE_ID
INNER JOIN OEHR_DEPARTMENTS d ON jh.DEPARTMENT_ID=d.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'MARKETING' OR DEPARTMENT_NAME LIKE 'IT';


/* 6.- Listar los productos que se encuentran en almacenes de Seattle (cualquier
almacén que incluya Seattle en su nombre) junto a la cantidad de los mismos en
dicho almacén. */
SELECT PRODUCT_ID, QUANTITY_ON_HAND
FROM OEHR_INVENTORIES I
INNER JOIN OEHR_WAREHOUSES W ON I.WAREHOUSE_ID = W.WAREHOUSE_ID
INNER JOIN OEHR_LOCATIONS L ON W.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY LIKE 'Seattle';


/* 7:- Buscar el almacén que tiene un mayor número de productos diferentes (cada
 producto diferente contabiliza como 1). */
SELECT WAREHOUSE_ID
FROM OEHR_INVENTORIES
GROUP BY WAREHOUSE_ID
HAVING COUNT(PRODUCT_ID) >= ALL (SELECT COUNT(PRODUCT_ID)
				                          FROM OEHR_INVENTORIES
	                                GROUP BY WAREHOUSE_ID);

SELECT WAREHOUSE_ID
FROM OEHR_INVENTORIES
GROUP BY WAREHOUSE_ID
HAVING COUNT(PRODUCT_ID) = (SELECT MAX(COUNT(PRODUCT_ID))
				                    FROM OEHR_INVENTORIES
	                          GROUP BY WAREHOUSE_ID);


/* 8.- Buscar el almacén que tiene una mayor cantidad total de unidades de
productos. */
SELECT WAREHOUSE_ID
FROM OEHR_INVENTORIES
GROUP BY WAREHOUSE_ID
HAVING SUM(QUANTITY_ON_HAND) >= ALL(SELECT SUM(QUANTITY_ON_HAND)
                                    FROM OEHR_INVENTORIES
                                    GROUP BY WAREHOUSE_ID);

/* 9.- Obtener los códigos de dos letras (COUNTRY_ID) de los países de Asia */
SELECT COUNTRY_ID
FROM OEHR_COUNTRIES C
INNER JOIN OEHR_REGIONS R ON C.REGION_ID = R.REGION_ID
WHERE R.REGION_NAME LIKE 'Asia';


/* 10.- Indicar cuántos países tiene cada región (debe mostrarse el nombre de
la región y la cantidad de países que incluye). */
SELECT REGION_NAME, COUNT(COUNTRY_ID)
FROM OEHR_COUNTRIES C
INNER JOIN OEHR_REGIONS R ON C.REGION_ID = R.REGION_ID
GROUP BY REGION_NAME;


/* 11.- Hallar los productos que se encuentran almacenados en almacenes de
Japón (COUNTRY_NAME es Japan). */
SELECT PRODUCT_NAME
FROM OEHR_PRODUCT_INFORMATION if
JOIN OEHR_INVENTORIES i ON if.PRODUCT_ID = i.PRODUCT_ID
JOIN OEHR_WAREHOUSES w ON i.WAREHOUSE_ID = w.WAREHOUSE_ID
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
WHERE c.COUNTRY_NAME LIKE 'Japan';

/* 12.- Obtener la masa salarial total que paga actualmente la empresa */
SELECT SUM(SALARY)
FROM OEHR_EMPLOYEES;


/* 13.- Obtener la masa salarial máxima y mínima posibles (según los límites
de cada puesto) que puede tener la empresa. */
SELECT MIN(MIN_SALARY), MAX(MAX_SALARY)
FROM OEHR_JOBS
GROUP BY JOB_TITLE;


/* 14.- Hallar el nombre y apellidos de los empleados que cobran actualmente
mas que el salario medio de la empresa (incluye duplicados). */
SELECT DISTINCT FIRST_NAME, LAST_NAME
FROM OEHR_EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM OEHR_EMPLOYEES);


/* 15.- Obtener los nombres y apellidos de los empleados junto al nombre y
apellidos de su jefe directo. */
SELECT emp.FIRST_NAME, emp.LAST_NAME, boss.FIRST_NAME, boss.LAST_NAME
FROM OEHR_EMPLOYEES emp
JOIN OEHR_EMPLOYEES boss ON emp.MANAGER_ID = boss.EMPLOYEE_ID;


/* 16.- Obtener el cliente que más pedidos ha realizado */
SELECT CUSTOMER_ID
FROM OEHR_ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) >= ALL(SELECT COUNT(ORDER_ID)
                              FROM OEHR_ORDERS
                              GROUP BY CUSTOMER_ID);


SELECT CUSTOMER_ID
FROM OEHR_ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) = (SELECT MAX(COUNT(ORDER_ID))
                          FROM OEHR_ORDERS
                          GROUP BY CUSTOMER_ID);


/* 17.- Obtener el cliente que más gasto ha realizado (más dinero ha gastado
en compras a nuestra empresa). */
SELECT CUSTOMER_ID
FROM OEHR_ORDERS
GROUP BY CUSTOMER_ID
HAVING SUM(ORDER_TOTAL) >= ALL(SELECT SUM(ORDER_TOTAL)
                                FROM OEHR_ORDERS
                                GROUP BY CUSTOMER_ID);

SELECT CUSTOMER_ID
FROM OEHR_ORDERS
GROUP BY CUSTOMER_ID
HAVING SUM(ORDER_TOTAL) = (SELECT MAX(SUM(ORDER_TOTAL))
                            FROM OEHR_ORDERS
                            GROUP BY CUSTOMER_ID);

/* 18.- Obtener el país con mayor número de clientes */
SELECT COUNTRY_NAME
FROM OEHR_COUNTRIES co
JOIN OEHR_CUSTOMERS cu ON co.COUNTRY_ID = cu.COUNTRY_ID
GROUP BY COUNTRY_NAME
HAVING COUNT(CUSTOMER_ID) = (SELECT MAX(COUNT(CUSTOMER_ID))
                              FROM OEHR_CUSTOMERS
                              GROUP BY COUNTRY_ID);

SELECT COUNTRY_NAME
FROM OEHR_COUNTRIES co
JOIN OEHR_CUSTOMERS cu ON co.COUNTRY_ID = cu.COUNTRY_ID
GROUP BY COUNTRY_NAME
HAVING COUNT(CUSTOMER_ID) >= ALL (SELECT COUNT(CUSTOMER_ID)
                                  FROM OEHR_CUSTOMERS
                                  GROUP BY COUNTRY_ID);


/* 19.- Obtener el límite de crédito de los clientes truncado a centenas. */
SELECT TRUNCATE(CREDIT_LIMIT, -1)
FROM OEHR_CUSTOMERS;


/* 20.- Obtener un listado de productos que se encuentren en un almacén de EEUU,
 cuyo coste (LIST_PRICE) sea menor de 200 y que incluyan WAN en su descripción. */
SELECT DISTINCT p.PRODUCT_ID
FROM OEHR_INVENTORIES i
JOIN OEHR_WAREHOUSES w ON i.WAREHOUSE_ID = w.WAREHOUSE_ID
JOIN OEHR_PRODUCT_INFORMATION p ON i.PRODUCT_ID = p.PRODUCT_ID
JOIN OEHR_LOCATIONS l ON w.LOCATION_ID = l.LOCATION_ID
JOIN OEHR_COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
WHERE c.COUNTRY_NAME LIKE 'United States of America'
  AND p.LIST_PRICE < 200
  AND p.PRODUCT_DESCRIPTION LIKE '%WAN%';
