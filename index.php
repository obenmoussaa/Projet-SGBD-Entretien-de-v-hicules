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
        <h1>GaragePro: Entretien et réparation de véhicules.</h1>
    </header>


    <section id="buttons-section" class="ButtonSection">
        <div class="Button" id="update-button">
            <p> Mise à Jour de la Base de Données </p>
            <a href="update.php">
                <button>Cliquez ici</button>
            </a>
        </div>

        <div class="Button" id="consultation-button">
            <p>
            <p>Consultation des Résultats </p>
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
    <h2>Services Personnalisés pour Votre Satisfaction</h2>
    <p>Notre engagement envers la satisfaction client se reflète à travers une gamme de services personnalisés conçus pour répondre à vos besoins spécifiques.</p>
    <p>Découvrez comment nous pouvons vous offrir une expérience exceptionnelle :</p>
    <ul>
        <li>
            <strong>Entretien Préventif:</strong> Nos experts qualifiés vous aident à planifier des routines d'entretien préventif, minimisant les pannes et prolongeant la durée de vie de votre véhicule.
        </li>
        <li>
            <strong>Diagnostic Avancé:</strong> Grâce à nos technologies de pointe, nous offrons des diagnostics précis pour identifier rapidement les problèmes potentiels, assurant une intervention rapide.
        </li>
        <li>
            <strong>Personnalisation des Services:</strong> Choisissez parmi une variété d'options de service pour personnaliser l'entretien de votre véhicule en fonction de vos préférences et de votre utilisation.
        </li>
        <li>
            <strong>Rapports Détaillés:</strong> Accédez à des rapports détaillés sur l'état de votre véhicule, y compris les travaux effectués, les pièces remplacées et des conseils pour optimiser les performances.
        </li>
    </ul>

    <p>Confiez-nous votre véhicule, et nous nous engageons à dépasser vos attentes à chaque étape.</p>
</section>


</body>
</html>
