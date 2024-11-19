
create database PECL2;

create schema temporal;

create schema final;

CREATE TABLE IF NOT EXISTS Vehiculos(
    vehicle_id  TEXT,
    state_registration  TEXT,
    vehicle_type    TEXT,
    vehicle_make    TEXT,
    vehicle_model   TEXT,
    vehicle_year    TEXT
);

CREATE TABLE IF NOT EXISTS personas(

);

CREATE TABLE IF NOT EXISTS colision_persona(

);

create table colision_vehiculo(

);

create table accidente(

);

CREATE TABLE IF NOT EXISTS accidentes (
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
   collision_id INTEGER PRIMARY KEY,
   vehicle_type_code_1 VARCHAR(100),
   vehicle_type_code_2 VARCHAR(100),
   vehicle_type_code_3 VARCHAR(100),
   vehicle_type_code_4 VARCHAR(100),
   vehicle_type_code_5 VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS colision_persona (
   unique_id INT PRIMARY KEY,
   collision_id INT FOREIGN KEY,
   crash_date DATE,
   crash_time TIME without time zone,
   person_id UUID FOREIGN KEY,
   person_type VARCHAR(15),
   person_injury VARCHAR(15),
   vehicle_id INT FOREIGN KEY,
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
   person_sex CHAR(1)
);


CREATE TABLE IF NOT EXISTS colision_vehiculo (
   unique_id INT UNIQUE,
   collision_id INT UNIQUE,
   crash_date DATE,
   crash_time TIME without time zone,
   vehicle_id UUID UNIQUE,
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
    CONSTRAINT Vehiculo_pk FOREIGN KEY (vehicle_id) REFERENCES vehiculo (vehicle_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Collision_pk FOREIGN KEY (collision_id) REFERENCES accidentes (collision_id) MATCH FULL
       ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
    CONSTRAINT Unique_pk FOREIGN KEY (unique_id)

);


CREATE TABLE IF NOT EXISTS persona (
   person_id UUID PRIMARY KEY,
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


CREATE TABLE IF NOT EXISTS vehiculo (
   vehicle_id VARCHAR(50) UNIQUE,
   state_registration INT NULL,
   vehicle_year INT,
   vehicle_type VARCHAR(50),
   vehicle_model VARCHAR(25),
   vehicle_make VARCHAR(25),
   CONSTRAINT Vehiculo_pk PRIMARY KEY (vehicle_id)
);
