/*
 *  Creación de vistas en Oracle
 *  @author - Ramón Moñino Rubio
 *  Github - RamonMR95
 */

/* 1.- Crear una vista que muestre el peso de cada pedido (lo sacamos de WEIGHT_CLASS). */
CREATE OR REPLACE VIEW order_weight (ORDER_ID, PESO)
AS SELECT ORDER_ID, SUM(WEIGHT_CLASS * QUANTITY)
FROM OEHR_ORDER_ITEMS it
JOIN OEHR_PRODUCT_INFORMATION i ON it.PRODUCT_ID = i.PRODUCT_ID
GROUP BY ORDER_ID;


/* 2.- Crear una vista que muestre los artículos con su PVP que se calcula agregando un 21%
de IVA al precio que aparece en la tabla correspondiente (LIST_PRICE). */
CREATE OR REPLACE VIEW mostrar_precio_art (Cod_Art, Precio, PVP)
AS SELECT PRODUCT_ID, LIST_PRICE, LIST_PRICE * 1.21
FROM OEHR_PRODUCT_INFORMATION;


/* 3.- Obtener mediante una consulta los valores de PVP y peso de cada pedido usando las
anteriores vistas. */
SELECT ORDER_ID, PVP, PESO
FROM

/* 4.- Crear una vista que muestre el total de lo que se ha facturado en cada región
(el total del PVP). */
CREATE OR REPLACE VIEW total_fac_region (NOMBRE_REGION, PVP)
AS SELECT orr.REGION_NAME, SUM((UNIT_PRICE * QUANTITY) * 1.21)
FROM OEHR_CUSTOMERS oc, OEHR_REGIONS orr, OEHR_ORDER_ITEMS ooi, OEHR_ORDERS ood, OEHR_COUNTRIES oocu
WHERE oc.CUSTOMER_ID = ood.CUSTOMER_ID
  AND ooi.ORDER_ID = ood.ORDER_ID
  AND oocu.REGION_ID = orr.REGION_ID
  AND oc.COUNTRY_ID = oocu.COUNTRY_ID
GROUP BY orr.REGION_NAME;

/* 5.- Crear una vista que muestre el valor de lo que hay en cada almacén tomando
como campo para el cálculo el MIN_PRICE. */
