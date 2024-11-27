
create database PECL2;

create schema temporal;

create schema final;

CREATE TABLE IF NOT EXISTS temporal.vehiculos(
    vehicle_id  TEXT,
    vehicle_year    TEXT,
    vehicle_type    TEXT,
    vehicle_model   TEXT,
    vehicle_make    TEXT
);

CREATE TABLE IF NOT EXISTS temporal.accidentes (
   crash_date TEXT,
   crash_time TEXT,
   borough TEXT,
   zip_code TEXT,
   latitude TEXT,
   longitude TEXT,
   location TEXT,
   on_street_name TEXT,
   cross_street_name TEXT,
   off_street_name TEXT,
   number_of_persons_injured TEXT,
   number_of_persons_killed TEXT,
   number_of_pedestrians_injured TEXT,
   number_of_pedestrians_killed TEXT,
   number_of_cyclist_injured TEXT,
   number_of_cyclist_killed TEXT,
   number_of_motorist_injured TEXT,
   number_of_motorist_killed TEXT,
   contributing_factor_vehicle_1 TEXT,
   contributing_factor_vehicle_2 TEXT,
   contributing_factor_vehicle_3 TEXT,
   contributing_factor_vehicle_4 TEXT,
   contributing_factor_vehicle_5 TEXT,
   collision_id TEXT,
   vehicle_type_code_1 TEXT,
   vehicle_type_code_2 TEXT,
   vehicle_type_code_3 TEXT,
   vehicle_type_code_4 TEXT,
   vehicle_type_code_5 TEXT
);


CREATE TABLE IF NOT EXISTS temporal.personas_accidente (
   unique_id TEXT,
   collision_id TEXT,
   crash_date TEXT,
   crash_time TEXT,
   person_id TEXT,
   person_type TEXT,
   person_injury TEXT,
   vehicle_id TEXT,
   person_age TEXT,
   ejection TEXT,
   emotional_status TEXT,
   bodily_injury TEXT,
   position_in_vehicle TEXT,
   safety_equipment TEXT,
   ped_location TEXT,
   ped_action TEXT,
   complaint TEXT,
   ped_role TEXT,
   contributing_factor_1 TEXT,
   contributing_factor_2 TEXT,
   person_sex TEXT
);


CREATE TABLE IF NOT EXISTS temporal.vehiculos_accidente (
   unique_id TEXT,
   collision_id TEXT,
   crash_date TEXT,
   crash_time TEXT,
   vehicle_id TEXT,
   state_registration TEXT,
   vehicle_type TEXT,
   vehicle_make TEXT,
   vehicle_model TEXT,
   vehicle_year TEXT,
   travel_direction TEXT,
   vehicle_occupants TEXT,
   driver_sex TEXT,
   driver_license_status TEXT,
   driver_license_jurisdiction TEXT,
   pre_crash TEXT,
   point_of_impact TEXT,
   vehicle_damage TEXT,
   vehicle_damage_1 TEXT,
   vehicle_damage_2 TEXT,
   vehicle_damage_3 TEXT,
   public_property_damage TEXT,
   public_property_damage_type TEXT,
   contributing_factor_1 TEXT,
   contributing_factor_2 TEXT
);


CREATE TABLE IF NOT EXISTS temporal.personas (
   person_id TEXT,
   person_sex TEXT,
   person_lastname TEXT,
   person_firstname TEXT,
   person_phone TEXT,
   person_address TEXT,
   person_city TEXT,
   person_state TEXT,
   person_zip TEXT,
   person_ssn TEXT,
   person_dob TEXT
);

-- hasta aquí  se tienen creadas todas las tablas iniciales (con todos los atributos de tipo TEXT) que van a estar dentro del esquema temporal, con los archivos importados con todos los datos para cada tabla

CREATE TABLE IF NOT EXISTS final.accidentes (
   crash_date DATE,
   crash_time TIME without time zone,
   borough VARCHAR(15),
   zip_code VARCHAR(5),
   latitude DOUBLE PRECISION,
   longitude DOUBLE PRECISION,
   location POINT,
   on_street_name VARCHAR(35),
   cross_street_name VARCHAR(25),
   off_street_name VARCHAR(35),
   number_of_persons_injured INTEGER,
   number_of_persons_killed INTEGER,
   number_of_pedestrians_injured INTEGER,
   number_of_pedestrians_killed INTEGER,
   number_of_cyclist_injured INTEGER,
   number_of_cyclist_killed INTEGER,
   number_of_motorist_injured INTEGER,
   number_of_motorist_killed INTEGER,
   contributing_factor_vehicle_1 VARCHAR(100),
   contributing_factor_vehicle_2 VARCHAR(100),
   contributing_factor_vehicle_3 VARCHAR(100),
   contributing_factor_vehicle_4 VARCHAR(100),
   contributing_factor_vehicle_5 VARCHAR(100),
   collision_id UUID,
   vehicle_type_code_1 VARCHAR(100),
   vehicle_type_code_2 VARCHAR(100),
   vehicle_type_code_3 VARCHAR(100),
   vehicle_type_code_4 VARCHAR(100),
   vehicle_type_code_5 VARCHAR(100),
    CONSTRAINT Collision_pk PRIMARY KEY (collision_id)

);


CREATE TABLE IF NOT EXISTS final.persona (
   person_id UUID,
   person_sex CHAR(1),
   person_lastname VARCHAR(15),
   person_firstname VARCHAR(15),
   person_phone VARCHAR(20),
   person_address VARCHAR(50),
   person_city VARCHAR(25),
   person_state VARCHAR(20),
   person_zip CHAR(5),
   person_ssn CHAR(11),
   person_dob DATE,
   CONSTRAINT Persona_pk PRIMARY KEY (person_id)
);


CREATE TABLE IF NOT EXISTS final.vehiculo (
   vehicle_id UUID,
   state_registration INT NULL,
   vehicle_year INT,
   vehicle_type VARCHAR(50),
   vehicle_model VARCHAR(25),
   vehicle_make VARCHAR(25),
   CONSTRAINT Vehiculo_pk PRIMARY KEY (vehicle_id)
);


CREATE TABLE IF NOT EXISTS final.colision_persona (
   unique_id UUID,
   collision_id UUID,
   crash_date DATE,
   crash_time TIME without time zone,
   person_id UUID,
   person_type VARCHAR(15),
   person_injury VARCHAR(15),
   vehicle_id UUID,
   person_age INT,
   ejection VARCHAR(15),
   emotional_status VARCHAR(25),
   bodily_injury VARCHAR(25),
   position_in_vehicle VARCHAR(100),
   safety_equipment VARCHAR(25),
   ped_location VARCHAR(100),
   ped_action VARCHAR(25),
   complaint VARCHAR(40),
   ped_role VARCHAR(20),
   contributing_factor_1 VARCHAR(25),
   contributing_factor_2 VARCHAR(25),
   person_sex CHAR(1),
    CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES final.vehiculo (vehicle_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Person_pk FOREIGN KEY (person_id) REFERENCES final.persona (person_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Unique_pk1 PRIMARY KEY (unique_id)    -- seria unique_id o collision_id
);


CREATE TABLE IF NOT EXISTS final.colision_vehiculo (
   unique_id UUID,
   collision_id UUID,
   crash_date DATE,
   crash_time TIME without time zone,
   vehicle_id UUID,
   state_registration VARCHAR(2),
   vehicle_type VARCHAR(50),
   vehicle_make VARCHAR(15),
   vehicle_model VARCHAR(15),
   vehicle_year INT,
   travel_direction VARCHAR(15),
   vehicle_occupants INT,
   driver_sex CHAR(1),
   driver_license_status VARCHAR(20),
   driver_license_jurisdiction VARCHAR(2),
   pre_crash VARCHAR(50),
   point_of_impact VARCHAR(50),
   vehicle_damage VARCHAR(50),
   vehicle_damage_1 VARCHAR(50),
   vehicle_damage_2 VARCHAR(50),
   vehicle_damage_3 VARCHAR(25),
   public_property_damage CHAR(1),
   public_property_damage_type VARCHAR(50),
   contributing_factor_1 VARCHAR(100),
   contributing_factor_2 VARCHAR(100),
    CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES final.vehiculo (vehicle_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Collision_pk FOREIGN KEY (collision_id) REFERENCES final.accidentes (collision_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Unique_pk2 PRIMARY KEY (unique_id)        -- seria unique_id o collision_id

);


-- hasta aquí están creadas las tablas con los tipos de datos elegidos correctamente

COPY temporal.vehiculos FROM 'C:\DATOS PL2\Vehicles.csv'
DELIMITER ';' CSV HEADER NULL '';

COPY temporal.personas FROM 'C:\DATOS PL2\personas2.csv'
DELIMITER ';' CSV HEADER NULL '';

COPY temporal.accidentes FROM 'C:\DATOS PL2\Collisions_Crashes_20241020.csv'
DELIMITER ',' CSV HEADER NULL '';

COPY temporal.personas_accidente FROM 'C:\DATOS PL2\Collisions_Person_20241020.csv'
DELIMITER ',' CSV HEADER NULL '';

COPY temporal.vehiculos_accidente FROM 'C:\DATOS PL2\Collisions_Vehicles_20241020.csv'
DELIMITER ',' CSV HEADER NULL '';

-- hechos los copies de los archivos .csv a nuestra base de datos

INSERT INTO final.accidentes(crash_date, crash_time, borough, zip_code, latitude, longitude, location, on_street_name, cross_street_name, off_street_name, number_of_persons_injured, number_of_persons_killed, number_of_pedestrians_injured, number_of_pedestrians_killed, number_of_cyclist_injured, number_of_cyclist_killed, number_of_motorist_injured, number_of_motorist_killed, contributing_factor_vehicle_1, contributing_factor_vehicle_2, contributing_factor_vehicle_3, contributing_factor_vehicle_4, contributing_factor_vehicle_5, collision_id, vehicle_type_code_1, vehicle_type_code_2, vehicle_type_code_3, vehicle_type_code_4, vehicle_type_code_5)
SELECT
    TO_DATE(temporal.accidentes.crash_date, 'MM/DD/YYYY'),  -- Convertir la fecha al formato adecuado
    cast(temporal.accidentes.crash_time AS TIME without time zone),
    cast(temporal.accidentes.borough AS VARCHAR(15)),
    cast(temporal.accidentes.zip_code AS VARCHAR(5)),
    cast(temporal.accidentes.latitude AS DOUBLE PRECISION),
    cast(temporal.accidentes.longitude AS DOUBLE PRECISION),
    cast(temporal.accidentes.location AS POINT),
    cast(temporal.accidentes.on_street_name AS VARCHAR(35)),
    cast(temporal.accidentes.cross_street_name AS VARCHAR(25)),
    cast(temporal.accidentes.off_street_name AS VARCHAR(35)),
    cast(temporal.accidentes.number_of_persons_injured AS INTEGER),
    cast(temporal.accidentes.number_of_persons_killed AS INTEGER),
    cast(temporal.accidentes.number_of_pedestrians_injured AS INTEGER),
    cast(temporal.accidentes.number_of_pedestrians_killed AS INTEGER),
    cast(temporal.accidentes.number_of_cyclist_injured AS INTEGER),
    cast(temporal.accidentes.number_of_cyclist_killed AS INTEGER),
    cast(temporal.accidentes.number_of_motorist_injured AS INTEGER),
    cast(temporal.accidentes.number_of_motorist_killed AS INTEGER),
    cast(temporal.accidentes.contributing_factor_vehicle_1 AS VARCHAR(100)),
    cast(temporal.accidentes.contributing_factor_vehicle_2 AS VARCHAR(100)),
    cast(temporal.accidentes.contributing_factor_vehicle_3 AS VARCHAR(100)),
    cast(temporal.accidentes.contributing_factor_vehicle_4 AS VARCHAR(100)),
    cast(temporal.accidentes.contributing_factor_vehicle_5 AS VARCHAR(100)),
    gen_random_uuid(),    -- Genera un nuevo UUID para cada fila
    cast(temporal.accidentes.vehicle_type_code_1 AS VARCHAR(100)),
    cast(temporal.accidentes.vehicle_type_code_2 AS VARCHAR(100)),
    cast(temporal.accidentes.vehicle_type_code_3 AS VARCHAR(100)),
    cast(temporal.accidentes.vehicle_type_code_4 AS VARCHAR(100)),
    cast(temporal.accidentes.vehicle_type_code_5 AS VARCHAR(100))

FROM temporal.accidentes;

INSERT INTO final.persona(person_id, person_sex, person_lastname, person_firstname, person_phone, person_address, person_city, person_state, person_zip, person_ssn, person_dob)
SELECT
    gen_random_uuid(),    -- Genera un nuevo UUID para cada fila
    cast(temporal.personas.person_sex AS CHAR(1)),
    cast(temporal.personas.person_lastname AS VARCHAR(15)),
    cast(temporal.personas.person_firstname AS VARCHAR(15)),
    cast(temporal.personas.person_phone AS VARCHAR(20)),
    cast(temporal.personas.person_address AS VARCHAR(50)),
    cast(temporal.personas.person_city AS VARCHAR(25)),
    cast(temporal.personas.person_state AS VARCHAR(20)),
    cast(temporal.personas.person_zip AS CHAR(5)),
    cast(temporal.personas.person_ssn AS CHAR(11)),
    cast(temporal.personas.person_dob AS DATE)

FROM temporal.personas;

INSERT INTO final.vehiculo(vehicle_id, vehicle_year, vehicle_type, vehicle_model, vehicle_make)
SELECT
    gen_random_uuid(),    -- Genera un nuevo UUID para cada fila
    cast(vehicle_year AS INT),
    cast(vehicle_type AS VARCHAR(50)),
    cast(vehicle_model AS VARCHAR(25)),
    cast(vehicle_make AS VARCHAR(25))

FROM temporal.vehiculos;

INSERT INTO final.colision_persona(unique_id, collision_id, crash_date, crash_time, person_id, person_type, person_injury, vehicle_id, person_age, ejection, emotional_status, bodily_injury, position_in_vehicle, safety_equipment, ped_location, ped_action, complaint, ped_role, contributing_factor_1, contributing_factor_2, person_sex)
SELECT
    cast(temporal.personas_accidente.unique_id, final.colision_persona.unique_id),
    cast(temporal.personas_accidente.collision_id, final.colision_persona.collision_id),
    cast(temporal.personas_accidente.crash_date, final.colision_persona.crash_date),
    cast(temporal.personas_accidente.crash_time, final.colision_persona.crash_time),
    cast(temporal.personas_accidente.person_id, final.colision_persona.person_id),
    cast(temporal.personas_accidente.person_type, final.colision_persona.person_type),
    cast(temporal.personas_accidente.person_injury, final.colision_persona.person_injury),
    cast(temporal.personas_accidente.vehicle_id, final.colision_persona.vehicle_id),
    cast(temporal.personas_accidente.person_age, final.colision_persona.person_age),
    cast(temporal.personas_accidente.ejection, final.colision_persona.ejection),
    cast(temporal.personas_accidente.emotional_status, final.colision_persona.emotional_status),
    cast(temporal.personas_accidente.bodily_injury, final.colision_persona.bodily_injury),
    cast(temporal.personas_accidente.position_in_vehicle, final.colision_persona.position_in_vehicle),
    cast(temporal.personas_accidente.safety_equipment, final.colision_persona.safety_equipment),
    cast(temporal.personas_accidente.ped_location, final.colision_persona.ped_location),
    cast(temporal.personas_accidente.ped_action, final.colision_persona.ped_action),
    cast(temporal.personas_accidente.complaint, final.colision_persona.complaint),
    cast(temporal.personas_accidente.ped_role, final.colision_persona.ped_role),
    cast(temporal.personas_accidente.contributing_factor_1, final.colision_persona.contributing_factor_1),
    cast(temporal.personas_accidente.contributing_factor_2, final.colision_persona.contributing_factor_2),
    cast(temporal.personas_accidente.person_sex, final.colision_persona.person_sex);

INSERT INTO final.colision_vehiculo(unique_id, collision_id, crash_date, crash_time, vehicle_id, state_registration, vehicle_type, vehicle_make, vehicle_model, vehicle_year, travel_direction, vehicle_occupants, driver_sex, driver_license_status, driver_license_jurisdiction, pre_crash, point_of_impact, vehicle_damage, vehicle_damage_1, vehicle_damage_2, vehicle_damage_3, public_property_damage, public_property_damage_type, contributing_factor_1, contributing_factor_2)
SELECT
    cast(temporal.vehiculos_accidente.unique_id, final.colision_vehiculo.unique_id),
    cast(temporal.vehiculos_accidente.collision_id, final.colision_vehiculo.collision_id),
    cast(temporal.vehiculos_accidente.crash_date, final.colision_vehiculo.crash_date),
    cast(temporal.vehiculos_accidente.crash_time, final.colision_vehiculo.crash_time),
    cast(temporal.vehiculos_accidente.vehicle_id, final.colision_vehiculo.vehicle_id),
    cast(temporal.vehiculos_accidente.state_registration, final.colision_vehiculo.state_registration),
    cast(temporal.vehiculos_accidente.vehicle_type, final.colision_vehiculo.vehicle_type),
    cast(temporal.vehiculos_accidente.vehicle_make, final.colision_vehiculo.vehicle_make),
    cast(temporal.vehiculos_accidente.vehicle_model, final.colision_vehiculo.vehicle_model),
    cast(temporal.vehiculos_accidente.vehicle_year, final.colision_vehiculo.vehicle_year),
    cast(temporal.vehiculos_accidente.travel_direction, final.colision_vehiculo.travel_direction),
    cast(temporal.vehiculos_accidente.vehicle_occupants, final.colision_vehiculo.vehicle_occupants),
    cast(temporal.vehiculos_accidente.driver_sex, final.colision_vehiculo.driver_sex),
    cast(temporal.vehiculos_accidente.driver_license_status, final.colision_vehiculo.driver_license_status),
    cast(temporal.vehiculos_accidente.driver_license_jurisdiction, final.colision_vehiculo.driver_license_jurisdiction),
    cast(temporal.vehiculos_accidente.pre_crash, final.colision_vehiculo.pre_crash),
    cast(temporal.vehiculos_accidente.point_of_impact, final.colision_vehiculo.point_of_impact),
    cast(temporal.vehiculos_accidente.vehicle_damage, final.colision_vehiculo.vehicle_damage),
    cast(temporal.vehiculos_accidente.vehicle_damage_1, final.colision_vehiculo.vehicle_damage_1),
    cast(temporal.vehiculos_accidente.vehicle_damage_2, final.colision_vehiculo.vehicle_damage_2),
    cast(temporal.vehiculos_accidente.vehicle_damage_3, final.colision_vehiculo.vehicle_damage_3),
    cast(temporal.vehiculos_accidente.public_property_damage, final.colision_vehiculo.public_property_damage),
    cast(temporal.vehiculos_accidente.public_property_damage_type, final.colision_vehiculo.public_property_damage_type),
    cast(temporal.vehiculos_accidente.contributing_factor_1, final.colision_vehiculo.contributing_factor_1),
    cast(temporal.vehiculos_accidente.contributing_factor_2, final.colision_vehiculo.contributing_factor_2);


-- hechos todos los inserts para obtener todas las ocurrencias en las tablas finales

--     CONSULTAS A LA BASE DE DATOS

-- 1.

