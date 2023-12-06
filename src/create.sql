-- Création de la table client
CREATE TABLE client (
    numero_client INTEGER PRIMARY KEY,
    nom_client VARCHAR(50) NOT NULL CHECK (nom_client <> ''),
    prenom_client VARCHAR(50),
    addresse_mail VARCHAR(100),
    numero_telephone VARCHAR(20) CHECK ((numero_telephone IS NULL) OR (numero_telephone LIKE '+33%'))
);

-- Création de la table vehicule
CREATE TABLE vehicule (
    numero_immatricule INTEGER PRIMARY KEY,
    date_mise_circulation DATE,
    modele VARCHAR(50),
    client_numero INT,
    FOREIGN KEY (client_numero) REFERENCES client(numero_client)
);

-- Création de la table garage
CREATE TABLE garage (
    numero_garage INT PRIMARY KEY,
    nom_garage VARCHAR(50),
    adresse_garage VARCHAR(100),
    numero_telephone VARCHAR(20)
);

--creation de la table des types d interventions
CREATE TABLE types_interventions(
    id_type INT PRIMARY KEY,
    libelle VARCHAR(50)
);
-- Création de la table intervention
CREATE TABLE intervention (
    numero_intervention INT PRIMARY KEY,
    date_entree DATE ,
    date_retour DATE ,
    duree_prevu INT,
    devis DECIMAL(10, 2),
    facture DECIMAL(10, 2),
    numero_vehicule INT,
    numero_garage INT,
    id_type INT,
    FOREIGN KEY (numero_vehicule) REFERENCES vehicule(numero_immatricule),
    FOREIGN KEY (id_type) REFERENCES types_interventions(id_type),
    FOREIGN KEY (numero_garage) REFERENCES garage(numero_garage),
    CONSTRAINT date_valide CHECK ((date_entree IS NULL AND date_retour IS NULL) OR (date_entree <= date_retour))
);


-- Création de la table prescription
CREATE TABLE prescription (
    numero_prescription INT PRIMARY KEY,
    description TEXT,
    duree INTEGER,
    statut VARCHAR(50),
    date_realisation DATE,
    vehicule_numero INT,
    FOREIGN KEY (vehicule_numero) REFERENCES vehicule(numero_immatricule)
);


-- Création de la table faire
CREATE TABLE garage_type_interventions (
    garage_numero INTEGER,
    id_type INTEGER,
    PRIMARY KEY (garage_numero, id_type),
    FOREIGN KEY (garage_numero) REFERENCES garage(numero_garage),
    FOREIGN KEY (id_type) REFERENCES types_interventions(id_type)
);

-- Création de la table proposer
CREATE TABLE proposer_prescription (
    garage_numero INTEGER NOT NULL,
    numero_prescription INTEGER NOT NULL,
    PRIMARY KEY (garage_numero, numero_prescription),
    FOREIGN KEY (garage_numero) REFERENCES garage(numero_garage),
    FOREIGN KEY (numero_prescription) REFERENCES prescription(numero_prescription)
);

-- Création de la table proposer
CREATE TABLE prescriptions_par_interventions (
    numero_intervention INTEGER NOT NULL,
    numero_prescription INTEGER NOT NULL,
    PRIMARY KEY (numero_intervention, numero_prescription),
    FOREIGN KEY (numero_intervention) REFERENCES intervention(numero_intervention),
    FOREIGN KEY (numero_prescription) REFERENCES prescription(numero_prescription)
);