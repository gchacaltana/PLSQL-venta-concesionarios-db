CREATE OR REPLACE TRIGGER actualizar_cantidad_autos_after_venta
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
	UPDATE distribucion SET cantidad=cantidad-1 WHERE ruc=:NEW.ruc AND codauto=:NEW.codauto;
END actualizar_cantidad_autos_after_venta;

-- Probando
-- RUC: 3 AUTO: 10 -- Cantidad: 5
select * from distribucion WHERE ruc=3 and codauto=10
-- Insertando registro de venta de un auto para RUC=3 y Auto=10
INSERT INTO venta(nroventa,ruc,dni,codauto,color,precio) VALUES (9,3,2,10,'BLANCO HUMO',22500);
select * from distribucion WHERE ruc=3 and codauto=10;
-- Devuelve 4