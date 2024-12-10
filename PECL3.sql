
-- PECL3: CONSULTAS DE ARREGLO DE LLA BASE DE DATOS

-- ejercicio 1

DELETE FROM pecl2.final.vehiculo WHERE vehicle_id IS NULL OR vehicle_id LIKE '' OR length(vehicle_id) < 10;

DELETE FROM pecl2.final.colision_vehiculo WHERE vehicle_id IS NULL OR vehicle_id LIKE '' OR length(vehicle_id) < 10;

ALTER TABLE pecl2.final.colision_persona DROP COLUMN vehicle_id;

-- ejercicio 2
DELETE FROM pecl2.final.persona
where person_id is NULL or person_id like '' or length(person_id) < 10;


-- ejercicio 3
INSERT INTO pecl2.final.vehiculo
(select colision_vehiculo.state_registration
 from pecl2.final.colision_vehiculo, pecl2.final.vehiculo
 where colision_vehiculo.vehicle_id = vehiculo.vehicle_id)

DELETE FROM pecl2.final.colision_vehiculo.state_registration;

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


-- ejercicio 6


-- ejercicio 7


-- ejercicio 8


