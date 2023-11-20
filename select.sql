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
JOIN intervention i ON v.numero_immatricule = i.numero_intervention
WHERE i.date_entree >= TO_DATE('2023-01-01', 'YYYY-MM-DD') 
AND i.date_entree <= TO_DATE('2024-12-31', 'YYYY/MM/DD');