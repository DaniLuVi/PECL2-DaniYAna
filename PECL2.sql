
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