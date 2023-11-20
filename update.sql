
/* Ajouter un nouveau client */

INSERT INTO client (numéro_client, nom_client, prenom_client, addresse_mail, numéro_téléphone)
VALUES ('NouveauNumClient', 'NomNouveauClient', 'PrenomNouveauClient', 'email@example.com', 'NumTelNouveauClient');

/* Modifier les informations d'un client */

UPDATE client
SET nom_client = 'NouveauNom', prenom_client = 'NouveauPrenom'
WHERE numéro_client = 'NumClientÀModifier';


