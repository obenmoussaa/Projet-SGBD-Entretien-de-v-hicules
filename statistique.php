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
            COALESCE(SUM(i.facture), 0) AS total_facture
            FROM
            client c
            LEFT JOIN
            vehicule v ON c.numero_client = v.client_numero
            LEFT JOIN
            intervention i ON v.numero_immatricule = i.numero_vehicule
            GROUP BY
            c.numero_client, c.nom_client, c.prenom_client";


$requete2 = "SELECT 
            EXTRACT(YEAR FROM date_entree) AS annee, 
            EXTRACT(MONTH FROM date_entree) AS mois, 
            COALESCE(SUM(i.duree_prevu ), 0) AS heures_facturees
            FROM 
            intervention i
            GROUP BY 
            annee, mois;";

$requete3 = "SELECT 
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
            COUNT(*) DESC ";

?>

    <header>
        <h1>Résultats des requêtes</h1>
    </header>

    <section>
        <form method="post">
            <label for="choix_client">Choisir la requete :</label>
            <select name="choix_client" id="choix_client">
                <option value="0">La liste des clients, avec le total des sommes facturées à chacun</option>
                <option value="1">Le nombre d’heures facturées par mois</option>
                <option value="2">La liste des types de véhicules, avec le type d’intervention majoritaire pratiqué sur ces véhicules</option>
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
            if($indiceChoisi == 0 ){
                print_requete($connection,$requete1);
            }    
            elseif($indiceChoisi==1) print_requete($connection,$requete2);
            else print_requete($connection,$requete3);
            
            pg_close($connection);
        }
    ?>
    </section>
</body>
</html>
