CREATE OR REPLACE FUNCTION obtener_cantidad_autos_por_concesionario(p_ruc NUMBER)
RETURN NUMBER
AS
	cantidad_autos NUMBER;
BEGIN
	SELECT SUM(cantidad) INTO cantidad_autos FROM distribucion WHERE ruc=p_ruc;
	RETURN cantidad_autos;
END obtener_cantidad_autos_por_concesionario;

-- verificando
SELECT obtener_cantidad_autos_por_concesionario(3) FROM DUAL;