
-- PECL3: CONSULTAS DE ARREGLO DE LLA BASE DE DATOS

-- ejercicio 1

DELETE FROM pecl2.final.vehiculo WHERE pecl2.final.vehiculo.vehicle_id IS NULL OR pecl2.final.vehiculo.vehicle_id LIKE '' OR length(pecl2.final.vehiculo.vehicle_id) < 10;

DELETE FROM pecl2.final.colision_vehiculo WHERE pecl2.final.colision_vehiculo.vehicle_id IS NULL OR pecl2.final.colision_vehiculo.vehicle_id LIKE '' OR length(pecl2.final.colision_vehiculo.vehicle_id) < 10;

ALTER TABLE pecl2.final.colision_persona DROP COLUMN vehicle_id;

-- ejercicio 2
DELETE FROM final.persona WHERE persona.person_id IS NULL OR persona.person_id LIKE '' OR length(person_id) < 10;

-- ejercicio 3
INSERT INTO pecl2.final.vehiculo
(select colision_vehiculo.state_registration
 from pecl2.final.colision_vehiculo, pecl2.final.vehiculo
 where colision_vehiculo.vehicle_id = vehiculo.vehicle_id);

ALTER TABLE pecl2.final.colision_vehiculo DROP COLUMN state_registration;

-- ejercicio 4

UPDATE pecl2.final.vehiculo
SET vehicle_type = 'unknown'
WHERE vehicle_type IS NULL OR vehicle_type LIKE '';

UPDATE pecl2.final.vehiculo
SET vehicle_make = 'unknown'
WHERE vehiculo.vehicle_make IS NULL OR vehiculo.vehicle_make LIKE '';

UPDATE pecl2.final.vehiculo
SET vehicle_model = 'unknown'
WHERE vehicle_model IS NULL OR vehicle_model LIKE '';

UPDATE pecl2.final.vehiculo
SET vehicle_year = 9999
WHERE vehicle_year IS NULL OR vehicle_year LIKE '';

UPDATE pecl2.final.vehiculo
SET state_registration = 'unknown'
WHERE state_registration IS NULL OR state_registration LIKE '';

-- ejercicio 5
INSERT INTO pecl2.final.persona
(select pecl2.final.colision_persona.person_sex
 from pecl2.final.colision_persona, pecl2.final.persona
 where pecl2.final.colision_persona.person_id = pecl2.final.persona.person_id);

ALTER TABLE pecl2.final.colision_persona DROP COLUMN person_sex;

UPDATE pecl2.final.persona
SET person_sex = 'U'
WHERE person_sex is NULL or person_sex LIKE '';

-- ejercicio 6
ALTER TABLE pecl2.final.persona ADD COLUMN person_age;

CREATE TRIGGER calcular_edad
    BEFORE INSERT ON persona
    FOR EACH ROW
    BEGIN

-- ejercicio 7
ALTER TABLE pecl2.final.vehiculo ADD COLUMN vehicle_accidents;



-- ejercicio 8


