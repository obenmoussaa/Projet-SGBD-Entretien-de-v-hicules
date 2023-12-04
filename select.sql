-- Liste des clients avec le nombre de véhicules qu’ils ont confiés au garage
SELECT
    c.numero_client,
    c.nom_client,
    c.prenom_client,
    COUNT(v.numero_immatricule) AS nombre_vehicules
FROM
    client c
LEFT JOIN
    vehicule v ON c.numero_client = v.client_numero
GROUP BY
    c.numero_client, c.nom_client, c.prenom_client
ORDER BY
    c.numero_client;
    
-- Liste des modèles de véhicule pris en charge lors de l’année écoulée
SELECT DISTINCT v.modele
FROM vehicule v
JOIN intervention i ON v.numero_immatricule = i.numero_vehicule
WHERE i.date_entree >= TO_DATE('2022-01-01', 'YYYY-MM-DD') 
AND i.date_entree <= TO_DATE('2023-12-31', 'YYYY/MM/DD');


-- Liste des véhicules actuellement en réparation
SELECT v.numero_immatricule, v.modele, i.date_entree
FROM vehicule v
JOIN intervention i ON v.numero_immatricule = i.numero_vehicule
WHERE i.date_retour IS NULL;

-- Historique complet des interventions sur un véhicule donné :
SELECT i.numero_intervention, i.date_entree, i.date_retour, i.devis, i.facture
FROM vehicule v
JOIN intervention i ON v.numero_immatricule = i.numero_vehicule
WHERE v.numero_immatricule = 101;


-- Top 5 des clients qui ont le plus dépensé
SELECT c.numero_client, c.nom_client, c.prenom_client, SUM(i.facture) AS total_depense
FROM client c
JOIN vehicule v ON c.numero_client = v.client_numero
JOIN prescription p ON v.numero_immatricule = p.vehicule_numero
JOIN prescriptions_par_interventions con ON p.numero_prescription = con.numero_prescription
JOIN intervention i ON con.numero_intervention = i.numero_intervention
GROUP BY c.numero_client, c.nom_client, c.prenom_client
ORDER BY total_depense DESC
LIMIT 5;




