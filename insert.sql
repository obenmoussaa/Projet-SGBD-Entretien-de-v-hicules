
-- Insertion de données dans la table client
INSERT INTO client (numero_client, nom_client, prenom_client, adresse_mail, numero_telephone)
VALUES
    (1, 'Dupont', 'Jean', 'jean.dupont@email.com', '+33 6 12 34 56 78'),
    (2, 'Martin', 'Marie', 'marie.martin@email.com', '+33 6 98 76 54 32'),
    (3, 'Dubois', 'Pierre', 'pierre.dubois@email.com', '+33 6 45 67 89 01'),
    (4, 'Lefevre', 'Isabelle', 'isabelle.lefevre@email.com', '+33 6 23 45 67 89'),
    (5, 'Garcia', 'Antoine', 'antoine.garcia@email.com', '+33 6 87 65 43 21'),
    (6, 'Moreau', 'Sophie', 'sophie.moreau@email.com', '+33 6 54 32 10 98'),
    (7, 'Fontaine', 'Luc', 'luc.fontaine@email.com', '+33 6 09 87 65 43'),
    (8, 'Andre', 'Nathalie', 'nathalie.andre@email.com', '+33 6 76 54 32 10'),
    (9, 'Bertrand', 'Philippe', 'philippe.bertrand@email.com', '+33 6 34 56 78 90'),
    (10, 'Leroy', 'Christine', 'christine.leroy@email.com', '+33 6 56 78 90 12'),
    (11, 'Roux', 'David', 'david.roux@email.com', '+33 6 78 90 12 34'),
    (12, 'Leclerc', 'Catherine', 'catherine.leclerc@email.com', '+33 6 90 12 34 56'),
    (14, 'Marchand', 'Thierry', 'thierry.marchand@email.com', '+33 6 87 65 43 21'),
    (40, 'March', 'Thierry', 'thierry.march@email.com', '+33 6 87 90 45 21'),
    (41, 'Michel', 'Henri', 'mhenri@email.com', '+33 6 80 69 43 21'),
    (42, 'Girard', 'Paul', 'paul.girard@email.com', '+33 6 12 34 56 78'),
    (43, 'Blanc', 'Sandrine', 'sandrine.blanc@email.com', '+33 6 98 76 54 32'),
    (44, 'Martin', 'François', 'francois.martin@email.com', '+33 6 78 90 12 34'),
    (45, 'Dufour', 'Martine', 'martine.dufour@email.com', '+33 6 90 12 34 56'); 

-- Insertion de données dans la table vehicule
INSERT INTO vehicule (numero_immatricule, date_mise_circulation, modele, client_numero)
VALUES
    (101, '2020-01-15', 'Toyota Camry', 1),
    (102, '2018-05-20', 'Honda Accord', 2),
    (103, '2020-11-10', 'Ford Focus', 3),
    (104, '2020-10-15', 'Ford Fiesta', 7),
    (105, '2022-7-12', 'Dacia', 10),
    (120, '2021-9-07', 'Audi', 11),
    (106, '2022-08-05', 'Chevrolet Malibu', 12),
    (107, '2021-03-12', 'Nissan Altima', 14),
    (108, '2020-11-18', 'Volkswagen Passat' , 40),
    (109, '2019-07-25', 'Hyundai Elantra' , 5); -- Ajoutez un point-virgule



-- Insertion de données dans la table garage avec des numéros de téléphone valides en France
INSERT INTO garage (numero_garage, nom_garage, adresse_garage, numero_telephone)
VALUES
    (201, 'Garage AutoTech', '123 Rue de la Réparation', '+33 1 23 45 67 89'),
    (202, 'Garage MécanoPro', '456 Avenue des Pièces', '+33 1 45 67 89 01'),
    (203, 'Garage Express', '789 Boulevard d Entretien', '+33 1 23 45 67 89'),
    (204, 'Garage SpeedyFix', '456 Rue des Réparateurs', '+33 1 23 45 67 89'),
    (205, 'Garage RapidCar', '789 Avenue des Dépanneurs', '+33 1 45 67 89 01'),
    (206, 'Garage TurboMoteur', '012 Boulevard des Experts', '+33 1 23 45 67 89'),
    (207, 'Garage ProService', '345 Rue des Mécaniciens', '+33 1 23 45 67 89'),
    (208, 'Garage DirectAuto', '678 Avenue des Techniciens', '+33 1 45 67 89 01'),
    (209, 'Garage EfficaceCar', '901 Boulevard des Spécialistes', '+33 1 23 45 67 89'),
    (210, 'Garage TechMéca', '234 Rue des Ingénieurs', '+33 1 45 67 89 01'),
    (211, 'Garage PerformAuto', '567 Avenue des Professionnels', '+33 1 23 45 67 89'),
    (212, 'Garage PrestigeMoteur', '890 Boulevard des Experts', '+33 1 45 67 89 01');
-- Insertion de données dans la table intervention

INSERT INTO intervention (numero_intervention, date_entree, date_retour , duree_prevu, devis, facture, numero_vehicule, numero_garage)
VALUES
    (1001, '2023-01-02', '2023-01-10', 5 ,150.00, 180.00, 101, 201),
    (1002, '2023-02-15', '2023-02-27', 10, 100.00, 120.00, 101, 202),
    (1003, '2023-11-15', '2023-11-27', 3, 120.00, 130.00, 102, 202),    
    (1004, '2023-03-20', '2023-03-23', 2, 200.00, 240.00, 102, 202),
    (1005, '2022-03-02', '2022-04-08', 25, 200.00, 240.00, 102, 201),
    (1006, '2022-02-27', '2022-03-20', 28, 300.00, 340.00, 103, 201),
    (1007, '2022-02-15', '2022-02-25', 4, 230.00, 240.00, 103, 201),
    (1008, '2021-07-20', '2021-07-28', 6,150.00, 180.00, 104, 211),
    (1009, '2023-04-10', '2023-04-15', 4, 120.00, 150.00, 104, 210),
    (1010, '2023-05-22', '2023-05-25', 3, 180.00, 220.00, 109, 209),
    (1011, '2023-07-30', NULL, 10, 30.00, 160.00, 108, 201),
    (1012, '2023-08-15', NULL, 17, 90.00, 110.00, 107, 208);


-- Insertion de données dans la table prescription
INSERT INTO prescription (numero_prescription, description, duree, statut, date_realisation, vehicule_numero)
VALUES
    (501, 'Changement d''huile', 4, 'En cours', '2023-01-05', 101),
    (502, 'Remplacement des freins', 3, 'Terminé', '2023-02-18', 102),
    (503, 'Diagnostic moteur', 2, 'En attente', '2023-03-25', 103),
    (504, 'Réparation du système électrique', 5, 'En attente', NULL, 104),
    (505, 'Vérification de la transmission', 3, 'Terminé', '2023-05-25', 105),
    (506, 'Alignement des roues', 2, 'En cours', NULL, 106),
    (507, 'Entretien du système de refroidissement', 4, 'Terminé', '2023-07-02', 107), -- Ajoutez un point-virgule
    (508, 'Changement d''huile', 4, 'En cours', '2022-01-05', 101),
    (509, 'Remplacement des freins', 3, 'Terminé', '2022-02-18', 102),
    (510, 'Diagnostic moteur', 2, 'En attente', '2022-03-25', 103),
    (511, 'Réparation du système électrique', 5, 'En attente', NULL, 104),
    (512, 'Vérification de la transmission', 3, 'Terminé', '2022-05-25', 105),
    (513, 'Alignement des roues', 2, 'En cours', NULL, 106),
    (514, 'Entretien du système de refroidissement', 4, 'Terminé', '2022-07-02', 107); 




INSERT INTO types_interventions (id_type, libelle)
VALUES 
    (2, 'peinture'),
    (1, 'changement de pneus'),
    (3, 'remplacement d elements'),
    (4, 'mécanique'),
    (5, 'tôlerie'),
    (6, 'vitrerie'),
    (7, 'rébovation jantes'),
    (8, 'dépannage');

-- Insertion de données dans la table faire
INSERT INTO garage_type_interventions (garage_numero, id_type)
VALUES
    (201, 1),
    (201, 2),
    (201, 3),
    (201, 4),
    (201, 5),
    (202, 1),
    (202, 2),
    (202, 5),
    (202, 6),
    (203, 3),
    (203, 4),
    (203, 6),
    (203, 7),
    (205, 1),
    (205, 2),
    (206, 7),
    (212, 1),
    (212, 2),
    (212, 6);



-- Insertion de données dans la table proposer
INSERT INTO proposer_prescription (garage_numero, numero_prescription)
VALUES
    (201, 501),
    (201, 502),
    (201, 503),
    (201, 504),
    (201, 505),

    (202, 506),
    (202, 507),
    (202, 508),
    (202, 509),
    (202, 510),

    (203, 511),
    (203, 512),
    (203, 513);


-- Ajout de données supplémentaires dans la table concerner
INSERT INTO  prescriptions_par_interventions (numero_prescription, numero_intervention)
VALUES
    (504, 1004),
    (504, 1005),
    (504, 1006),
    (505, 1005),
    (506, 1006),
    (507, 1007),
    (501, 1001),
    (502, 1002),
    (503, 1003);