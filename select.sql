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


--La liste des clients, avec le total des sommes facturées à chacun
SELECT
    c.numero_client,
    c.nom_client,
    c.prenom_client,
    COALESCE(SUM(i.facture), 0) AS total_facture
FROM
    client c
LEFT JOIN
    vehicule v ON c.numero_client = v.client_numero
LEFT JOIN
    intervention i ON v.numero_immatricule = i.numero_vehicule
GROUP BY
    c.numero_client, c.nom_client, c.prenom_client;


-- Le nombre d’heures facturées par mois.
SELECT 
    EXTRACT(YEAR FROM date_entree) AS annee, 
    EXTRACT(MONTH FROM date_entree) AS mois, 
    COALESCE(SUM(i.duree_prevu ), 0) AS heures_facturees
FROM 
    intervention i
GROUP BY 
    annee, mois;





-- La liste des types de véhicules, avec le type d’intervention majoritaire pratiqué sur ces véhicules.
SELECT 
    v.modele, 
    ti.libelle AS type_intervention_majoritaire
FROM 
    vehicule v
JOIN 
    intervention i ON v.numero_immatricule = i.numero_vehicule
JOIN 
    types_interventions ti ON i.id_type = ti.id_type
GROUP BY 
    v.modele, ti.libelle
ORDER BY 
    COUNT(*) DESC
;
