/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(100),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN DEFAULT false,
 weight_kg DECIMAL,
 PRIMARY KEY(id)
 );

-- Add a column species of type string to your animals table
ALTER TABLE animals ADD species VARCHAR(50);

-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners(
 id SERIAL PRIMARY KEY,
 full_name VARCHAR(100),
 age INT
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species(
 id SERIAL PRIMARY KEY,
 name VARCHAR(100)
);

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_table FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets with the following columns:
-- id: integer
-- name: string
-- age: integer
-- date_of_graduation: date
CREATE TABLE vets(
  id integer serial not null primary key,
  name VARCHAR(100),
  age integer,
  date_of_graduation date
);
CREATE TABLE specializations(
  vet_id int,
  species_id int,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id)
);
CREATE TABLE visits(
  animal_id integer,
  vet_id integer,
  date_of_visit date,
  CONSTRAINT fk_vets FOREIGN KEY(vet_id) REFERENCES vets(id),
  CONSTRAINT fk_animals FOREIGN KEY(animal_id) REFERENCES animals(id)
);

alter table owners add column email varchar(120);