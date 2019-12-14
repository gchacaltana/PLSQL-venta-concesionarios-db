CREATE OR REPLACE PROCEDURE sp_insertar_cliente(p_nombres VARCHAR2,p_apellidos VARCHAR2,p_ciudad VARCHAR2)
AS
	cantidad_registros NUMBER;
	dni NUMBER;
	ultimo_dni NUMBER;
BEGIN
	SELECT COUNT(dni) INTO cantidad_registros FROM cliente;
	SELECT MAX(dni) INTO ultimo_dni FROM cliente;
	IF cantidad_registros = 0 THEN
		dni := 1;
	ELSE
		dni := ultimo_dni + 1;
	END IF;
	INSERT INTO cliente(dni, nombre,apellido,ciudad) VALUES(dni,p_nombres,p_apellidos,p_ciudad);
	DBMS_OUTPUT.PUT_LINE('Cliente registrado con exito.');
END sp_insertar_cliente;

-- Probando
select * from cliente
CALL sp_insertar_cliente('Arturo', 'Lazo', 'Bilbao');
CALL sp_insertar_cliente('Gonzalo', 'Chacaltana', 'Lima');