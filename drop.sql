-- Suppression de la table proposer
DROP TABLE IF EXISTS proposer_prescription;

-- Suppression de la table faire
DROP TABLE IF EXISTS garage_type_interventions;

-- DROP TABLE IF EXISTS 
-- Suppression de la table prescription
DROP TABLE IF EXISTS prescription CASCADE;

-- Suppression de la table intervention
DROP TABLE IF EXISTS intervention CASCADE;

-- Suppression de la table vehicule
DROP TABLE IF EXISTS vehicule CASCADE;

-- Suppression de la table garage
DROP TABLE IF EXISTS garage;
-- Suppression de la table client
DROP TABLE IF EXISTS client CASCADE;

DROP TABLE IF EXISTS prescriptions_par_interventions CASCADE;
DROP TABLE IF EXISTS types_interventions CASCADE;