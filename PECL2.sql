
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
    cast(temporal.accidentes.crash_date, final.accidentes.crash_date),
    cast(temporal.accidentes.crash_time, final.accidentes.crash_time),
    cast(temporal.accidentes.borough, final.accidentes.borough),
    cast(temporal.accidentes.zip_code, final.accidentes.zip_code),
    cast(temporal.accidentes.latitude, final.accidentes.latitude),
    cast(temporal.accidentes.longitude, final.accidentes.longitude),
    cast(temporal.accidentes.location, final.accidentes.location),
    cast(temporal.accidentes.on_street_name, final.accidentes.on_street_name),
    cast(temporal.accidentes.cross_street_name, final.accidentes.cross_street_name),
    cast(temporal.accidentes.off_street_name, final.accidentes.off_street_name),
    cast(temporal.accidentes.number_of_persons_injured, final.accidentes.number_of_persons_injured),
    cast(temporal.accidentes.number_of_persons_killed, final.accidentes.number_of_persons_killed),
    cast(temporal.accidentes.number_of_pedestrians_injured, final.accidentes.number_of_pedestrians_injured),
    cast(temporal.accidentes.number_of_pedestrians_killed, final.accidentes.number_of_pedestrians_killed),
    cast(temporal.accidentes.number_of_cyclist_injured, final.accidentes.number_of_cyclist_injured),
    cast(temporal.accidentes.number_of_cyclist_killed, final.accidentes.number_of_cyclist_killed),
    cast(temporal.accidentes.number_of_motorist_injured, final.accidentes.number_of_motorist_injured),
    cast(temporal.accidentes.number_of_motorist_killed, final.accidentes.number_of_motorist_killed),
    cast(temporal.accidentes.contributing_factor_vehicle_1, final.accidentes.contributing_factor_vehicle_1),
    cast(temporal.accidentes.contributing_factor_vehicle_2, final.accidentes.contributing_factor_vehicle_2),
    cast(temporal.accidentes.contributing_factor_vehicle_3, final.accidentes.contributing_factor_vehicle_3),
    cast(temporal.accidentes.contributing_factor_vehicle_4, final.accidentes.contributing_factor_vehicle_4),
    cast(temporal.accidentes.contributing_factor_vehicle_5, final.accidentes.contributing_factor_vehicle_5),
    cast(temporal.accidentes.collision_id, final.accidentes.collision_id),
    cast(temporal.accidentes.vehicle_type_code_1, final.accidentes.vehicle_type_code_1),
    cast(temporal.accidentes.vehicle_type_code_2, final.accidentes.vehicle_type_code_2),
    cast(temporal.accidentes.vehicle_type_code_3, final.accidentes.vehicle_type_code_3),
    cast(temporal.accidentes.vehicle_type_code_4, final.accidentes.vehicle_type_code_4),
    cast(temporal.accidentes.vehicle_type_code_5, final.accidentes.vehicle_type_code_5);

INSERT INTO final.persona(person_id, person_sex, person_lastname, person_firstname, person_phone, person_address, person_city, person_state, person_zip, person_ssn, person_dob)
SELECT
    cast(temporal.personas.person_id, final.persona.person_id),
    cast(temporal.personas.person_sex, final.persona.person_sex),
    cast(temporal.personas.person_lastname, final.persona.person_lastname),
    cast(temporal.personas.person_firstname, final.persona.person_firstname),
    cast(temporal.personas.person_phone, final.persona.person_phone),
    cast(temporal.personas.person_address, final.persona.person_address),
    cast(temporal.personas.person_city, final.persona.person_city),
    cast(temporal.personas.person_state, final.persona.person_state),
    cast(temporal.personas.person_zip, final.persona.person_zip),
    cast(temporal.personas.person_ssn, final.persona.person_ssn),
    cast(temporal.personas.person_dob, final.persona.person_dob);

INSERT INTO final.vehiculo(vehicle_id, vehicle_year, vehicle_type, vehicle_model, vehicle_make)
SELECT
    cast(temporal.vehiculos.vehicle_id, final.vehiculo.vehicle_id),
    cast(temporal.vehiculos.vehicle_year, final.vehiculo.vehicle_year),
    cast(temporal.vehiculos.vehicle_type, final.vehiculo.vehicle_type),
    cast(temporal.vehiculos.vehicle_model, final.vehiculo.vehicle_model),
    cast(temporal.vehiculos.vehicle_make, final.vehiculo.vehicle_make);

INSERT INTO final.colision_persona(unique_id, collision_id, crash_date, crash_time, person_id, person_type, person_injury, vehicle_id, person_age, ejection, emotional_status, bodily_injury, position_in_vehicle, safety_equipment, ped_location, ped_action, complaint, ped_role, contributing_factor_1, contributing_factor_2, person_sex)
SELECT
    cast(temporal.personas_accidente.unique_id, final.colision_persona.unique_id),
    cast(temporal.personas_accidente.collision_id, final.colision_persona.collision_id),
    cast(temporal.personas_accidente.crash_date, final.colision_persona.crash_date),
    cast(temporal.personas_accidente.crash_time, final.colision_persona.crash_time),
    cast(temporal.personas_accidente.person_id, final.colision_persona.person_id),
    cast(temporal.personas_accidente.person_type, final.colision_persona.person_type),
    cast(temporal.personas_accidente.person_injury, final.colision_persona.person_injury), -- seguir

