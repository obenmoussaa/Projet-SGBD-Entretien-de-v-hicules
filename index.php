<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style_page.css" rel="stylesheet" media="all" />
    <title>Entretien de véhicules</title>
</head>
<body>

    <header>
        <h1>Garage des véhicules</h1>
    </header>

    <section id="garage-info">
        <div>
            <p>Bienvenue dans notre garage. Nous sommes spécialisés dans l'entretien et la réparation de véhicules.</p>
        </div>
    </section>

    <section id="buttons-section" class="ButtonSection">
        <div class="Button" id="update-button">
            <p> Pour faire une mise à jour sur la base de données </p>
            <a href="update.php">
                <button>Cliquez ici</button>
            </a>
        </div>

        <div class="Button" id="consultation-button">
            <p>
            <p>Pour consulter les resultats de nous requetes </p>
            <a href="consultation.php">
               
                <button class="texte_button">Cliquez ici</button>
            </a>
        </div>

        <div class="Button" id="stats-button">
            <p> Pour consulter les statistiques </p> 
            <a href="statistique.php">
                <button>Cliquez ici</button>
            </a>
        </div>
    </section>
    <section class="image">
    <?php 
    $imagePath = 'garage.jpg';
    if (file_exists($imagePath)) {
        echo '<img src="' . $imagePath . '" alt="Garage Image">';
    } else {
        echo 'L\'image n\'existe pas.';
    }
    ?>

    </section>

    <section id="additional-info">
        <h2>Informations supplémentaires</h2>
        <p>Nous proposons des services personnalisés pour assurer la satisfaction de nos clients.</p>

        <h4> Maji Medghali, Abderrahim Lagraoui, Oussama Ben moussa, Hamza Baakili </h4>
    </section>

</body>
</html>
