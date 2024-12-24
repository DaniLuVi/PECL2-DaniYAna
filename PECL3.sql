
-- PECL3: CONSULTAS DE ARREGLO DE LLA BASE DE DATOS

create database pecl3;

-- ejercicio 1      HECHO BIEN

DELETE FROM pecl3.final.vehiculo WHERE pecl3.final.vehiculo.vehicle_id IS NULL OR pecl3.final.vehiculo.vehicle_id LIKE '' OR length(pecl3.final.vehiculo.vehicle_id) < 10;

DELETE FROM pecl3.final.colision_vehiculo WHERE pecl3.final.colision_vehiculo.vehicle_id IS NULL OR pecl3.final.colision_vehiculo.vehicle_id LIKE '' OR length(pecl3.final.colision_vehiculo.vehicle_id) < 10;

ALTER TABLE pecl3.final.colision_persona DROP COLUMN vehicle_id;

-- ejercicio 2      HECHO BIEN
DELETE FROM pecl3.final.persona WHERE pecl3.final.persona.person_id IS NULL OR pecl3.final.persona.person_id LIKE '' OR length(pecl3.final.persona.person_id) < 10;

-- ejercicio 3      HECHO BIEN
UPDATE pecl3.final.vehiculo
SET state_registration = pecl3.final.colision_vehiculo.state_registration
FROM pecl3.final.colision_vehiculo
WHERE pecl3.final.vehiculo.vehicle_id = pecl3.final.colision_vehiculo.vehicle_id;

ALTER TABLE pecl3.final.colision_vehiculo DROP COLUMN state_registration;

--INSERT INTO pecl3.final.vehiculo
--(select colision_vehiculo.state_registration
 --from pecl3.final.colision_vehiculo, pecl3.final.vehiculo
 --where pecl3.final.colision_vehiculo.vehicle_id = pecl3.final.vehiculo.vehicle_id);

-- ejercicio 4      HECHO BIEN

UPDATE pecl3.final.vehiculo
SET vehicle_type = 'unknown'
WHERE vehicle_type IS NULL OR vehicle_type LIKE '';

UPDATE pecl3.final.vehiculo
SET vehicle_make = 'unknown'
WHERE vehiculo.vehicle_make IS NULL OR vehiculo.vehicle_make LIKE '';

UPDATE pecl3.final.vehiculo
SET vehicle_model = 'unknown'
WHERE vehicle_model IS NULL OR vehicle_model LIKE '';

UPDATE pecl3.final.vehiculo
SET vehicle_year = 9999
WHERE vehicle_year IS NULL OR vehicle_year = 0;

UPDATE pecl3.final.vehiculo
SET state_registration = 'unknown'
WHERE state_registration IS NULL OR state_registration = '';

-- ejercicio 5      HECHO BIEN

UPDATE pecl3.final.persona
SET person_sex = pecl3.final.colision_persona.person_sex
FROM pecl3.final.colision_persona
WHERE pecl3.final.persona.person_id = pecl3.final.colision_persona.person_id;

ALTER TABLE pecl3.final.colision_persona DROP COLUMN person_sex;

UPDATE pecl3.final.persona
SET person_sex = 'U'
WHERE person_sex is NULL or person_sex LIKE '';

--INSERT INTO pecl3.final.persona
--(select pecl3.final.colision_persona.person_sex
 --from pecl3.final.colision_persona, pecl3.final.persona
 --where pecl3.final.colision_persona.person_id = pecl3.final.persona.person_id);

-- ejercicio 6
ALTER TABLE pecl3.final.persona ADD COLUMN person_age INT;
CREATE OR REPLACE FUNCTION calcular_edad_persona()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.person_dob IS NOT NULL THEN
        NEW.person_age := EXTRACT(YEAR FROM AGE(NEW.person_dob));
    ELSE
        NEW.person_age := NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_edad_persona_final
BEFORE INSERT ON pecl3.final.persona
FOR EACH ROW
EXECUTE FUNCTION calcular_edad_persona();

-- ejercicio 7
ALTER TABLE pecl3.final.vehiculo ADD COLUMN vehicle_accidents INT;
CREATE OR REPLACE FUNCTION actualizar_accidentes_vehiculo()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE pecl3.final.vehiculo
    SET vehicle_accidents = (
        SELECT COUNT(*)
        FROM pecl3.final.colision_vehiculo
        GROUP BY vehicle_id
    )
    WHERE vehicle_id = NEW.vehicle_id;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_accidentes_vehiculo
AFTER INSERT ON pecl3.final.colision_vehiculo
FOR EACH ROW
EXECUTE FUNCTION actualizar_accidentes_vehiculo();




-- ejercicio 8
