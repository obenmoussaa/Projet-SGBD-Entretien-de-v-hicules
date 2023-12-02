-- Modifier l'adresse mail d'un client
UPDATE client SET adresse_mail = 'nouvelle_adresse@email.com' WHERE numero_client = 1;

-- Modifier le modèle d'un véhicule
UPDATE vehicule SET modele = 'nouveau_modele' WHERE numero_immatricule = 101;

-- Changer le statut d'une prescription
UPDATE prescription SET statut = 'Terminé' WHERE numero_prescription = 501;

-- Ajouter une intervention à un client existant
INSERT INTO intervention (numero_intervention, date_entree, date_retour, devis, facture)
VALUES (1008, '2023-09-01', '2023-09-05', 120.00, 150.00);

INSERT INTO concerner (numero_prescription, numero_intervention)
VALUES (504, 1008);

-- Modifier le numéro de téléphone d'un garage
UPDATE garage SET numero_telephone = '555-1234' WHERE numero_garage = 201;


-- Ajout de données
INSERT INTO garage (numero_garage, nom_garage, adresse_garage, numero_telephone)
VALUES (208, 'Garage Dupont', '234 Rue Huitième', '555-4321');

INSERT INTO faire (id_type) VALUES (8);

-- Suppression de données
DELETE FROM client WHERE numero_client = 1;

DELETE FROM intervention WHERE numero_intervention = 1008;
DELETE FROM concerner WHERE numero_intervention = 1008;

-- Modification de données
UPDATE intervention SET devis = 200.00 WHERE numero_intervention = 1001;

UPDATE prescription SET statut = 'En cours' WHERE statut = 'En attente';

-- Requêtes utiles pour la gestion
-- Liste tous les clients avec leurs véhicules associés
SELECT client.*, vehicule.*
FROM client
LEFT JOIN vehicule ON client.numero_client = vehicule.client_numero;

-- Calcul du montant total facturé par garage
SELECT garage.nom_garage, SUM(intervention.facture) AS montant_total
FROM garage
JOIN faire ON garage.numero_garage = faire.garage_numero
JOIN proposer ON faire.id_type = proposer.id_type
JOIN prescription ON proposer.numero_prescription = prescription.numero_prescription
JOIN concerner ON prescription.numero_prescription = concerner.numero_prescription
JOIN intervention ON concerner.numero_intervention = intervention.numero_intervention
GROUP BY garage.nom_garage;

