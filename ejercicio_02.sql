CREATE OR REPLACE PROCEDURE sp_reporte_marcas
AS
	CURSOR marcas IS SELECT codmarca,nombre,ciudad FROM marca;
	CURSOR autos IS
	SELECT a.codauto,a.nombre,a.modelo,an.codmarca FROM auto a INNER JOIN asignacion an ON a.codauto=an.codauto;
	total_modelos NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('REPORTE AUTOS Y MARCAS');
	DBMS_OUTPUT.PUT_LINE('************************');
	FOR ma IN marcas
	LOOP
		total_modelos:=0;
		DBMS_OUTPUT.PUT_LINE('Marca: '||ma.nombre);
		FOR au IN autos
			LOOP
			IF au.codmarca=ma.codmarca THEN
				total_modelos:=total_modelos+1;
				DBMS_OUTPUT.PUT_LINE(au.nombre||' / '||au.modelo);
			END IF;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('Total modelos: '||total_modelos);
		DBMS_OUTPUT.PUT_LINE('---------------------------------');
	END LOOP;
END sp_reporte_marcas;

CALL sp_reporte_marcas();