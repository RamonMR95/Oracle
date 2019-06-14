--2. Primera solicitud de alquiler que se inició y período de duración (alquiler,
--fecha_inicio, cuantos_dias).

-- Cuantos dias = Limite superior - limite inferior + 1
SELECT alquiler, MIN(fecha_inicio) AS fecha_inicio, ((fecha_fin - fecha_inicio) + 1) AS cuantos_dias
FROM (DETALLE_ALQUILER JOIN ALQUILER ON alquiler = id)
WHERE fecha_inicio = ( SELECT MIN(fecha_inicio)
                      FROM ALQUILER)
GROUP BY ((fecha_fin - fecha_inicio) + 1), alquiler;





