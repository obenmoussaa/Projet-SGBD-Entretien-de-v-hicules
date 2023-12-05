<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style_page.css" rel="stylesheet" media="all" />
    <title>Résultats des requêtes</title>
</head>
<body>

<form action="index.php" method="get" class="accueil">
    <input type="submit" value="Accueil"
         name="Submit" id="accueil" style="font-weight: bold;"/>
    </form>


<?php
// index.php

// Inclure le fichier exemple.php
include 'exemple.php';
include "connect_pg.php";

$requete1 = "SELECT
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
c.numero_client";

$requete2 = "SELECT c.numero_client, c.nom_client, c.prenom_client, SUM(i.facture) AS total_depense
        FROM client c
        JOIN vehicule v ON c.numero_client = v.client_numero
        JOIN prescription p ON v.numero_immatricule = p.vehicule_numero
        JOIN prescriptions_par_interventions con ON p.numero_prescription = con.numero_prescription
        JOIN intervention i ON con.numero_intervention = i.numero_intervention
        GROUP BY c.numero_client, c.nom_client, c.prenom_client
        ORDER BY total_depense DESC
        LIMIT 5";
$requete3 = "SELECT i.numero_intervention, i.date_entree, i.date_retour, i.devis, i.facture
        FROM vehicule v
        JOIN intervention i ON v.numero_immatricule = i.numero_vehicule
        WHERE v.numero_immatricule = 101";


?>

    <header>
        <h1>Résultats des requêtes</h1>
    </header>

    <section class="selectionner">
        <form method="post">
            <label for="choix_client">Choisir une requete :</label>
            <select name="choix_client" id="choix_client">
                <option value="0">Les clients avec le nombre de véhicules qu’ils ont confiés au garage</option>
                <option value="1">Top 5 des clients qui ont le plus dépensé</option>
                <option value="2">Historique complet des interventions sur un véhicule donné</option>
            </select>
            <input type="submit" value="Afficher la requete">
        </form>
    </section>

    <section class="affichage_requite">
    <?php

            // Si le formulaire a été soumis
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // // Récupérer l'indice du choix du client
            $indiceChoisi = $_POST['choix_client'];
            echo "<div id='result-container'>";
            if($indiceChoisi == 0 ){
                print_requete($connection,$requete1);
            }    
            else if ($indiceChoisi == 1 ) print_requete($connection,$requete2);
            else print_requete($connection,$requete3);
        echo "</div>";

            
            pg_close($connection);
        }
    ?>
    </section>
</body>
</html>
