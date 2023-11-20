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
    