<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet" media="all" />
    <title>Résultats des requêtes</title>
</head>
<body>

<?php
// index.php

// Inclure le fichier exemple.php
include 'exemple.php';
include "connect_pg.php";

$requete1 = "select * from client ";

$requete2 = "select * from  vehicule";
$requete3 = "select * from intervention";


?>

    <header>
        <h1>Résultats des requêtes</h1>
    </header>

    <section>
        <form method="post">
            <label for="choix_client">Choisir la requete :</label>
            <select name="choix_client" id="choix_client">
                <option value="0">Les clients avec le nombre de véhicules qu’ils ont confiés au garage</option>
                <option value="1">Liste des modèles de véhicule pris en charge lors de l’année écoulée</option>
                <option value="2">Client 3</option>
            </select>
            <input type="submit" value="Afficher la requete">
        </form>
    </section>

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
</body>
</html>
