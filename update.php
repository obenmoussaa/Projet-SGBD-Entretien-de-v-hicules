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
    <input type="submit" value="Accueil" name="Submit" id="accueil" style="font-weight: bold;">
</form>

<?php
// index.php

// Inclure le fichier exemple.php
include 'exemple.php';
include "connect_pg.php";
?>

<section class="update_text">
    <p> Cette requete c'est pour changer l'adresse email d'un utilisateur </p>
</section>

<form action="" method="post" class="adresse_client">
    <label for="numero_client">Entrez un numéro client :</label>
    <input type="text" id="numero_client" name="numero_client" required>

    <label for="email">Entrez votre adresse e-mail :</label>
    <input type="email" id="email" name="email" required>

    <input type="submit" value="Envoyer">
</form>


<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["email"]) && isset($_POST["numero_client"])) {
  // Récupère l'adresse e-mail et le numéro saisis par l'utilisateur
  $email = $_POST["email"];
  $numero = $_POST["numero_client"];

  // Prépare et exécute la requête d'UPDATE
  $requete = "UPDATE client SET adresse_mail='" . htmlspecialchars($email) . "' WHERE numero_client='" . htmlspecialchars($numero) . "'";
  $result = pg_query($connection, $requete);

  if ($result) {
      echo "La mise à jour est passée !";  
  } else {
      echo "Erreur lors de la mise à jour : " . pg_last_error($connection);
  }

  // Affiche la requête de sélection mise à jour
  $requete1 = "SELECT * FROM client WHERE numero_client='" . htmlspecialchars($numero) . "'";
  echo "<div style='text-align: center;'>";
  print_requete($connection, $requete1);
  echo "</div>";
  
  // Ferme la connexion
  pg_close($connection);
}
?>

<section class="update_text">
    <p> Cette requete c'est pour changer le statut d'une prescription </p>
</section>
<form action="" method="post" class="prescription">
    <label for="numero">Entrez le numéro de la prescription :</label>
    <input type="text" id="numero" name="numero" required>

    <label for="status">Status :</label>
    <input type="text" id="status" name="status" required>

    <input type="submit" value="Envoyer">
</form>

<?php
    
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["status"]) && isset($_POST["numero"])) {
      // Récupère le status et le numéro saisis par l'utilisateur
      $status = $_POST["status"];
      $numero = $_POST["numero"];
        if(htmlspecialchars($numero)<501 || htmlspecialchars($numero)>514 || ( strcmp(htmlspecialchars($status),'En attente')!=0 && strcmp(htmlspecialchars($status),'Terminé')))
          echo "les données sont invalides, essayez avec un numéro entre 501 et 514, le status parmi ['En attente', 'Terminé] ";
        else{
      // Prépare et exécute la requête d'UPDATE
      $requete = "UPDATE prescription SET statut = '" . htmlspecialchars($status) . "' WHERE numero_prescription ='" . htmlspecialchars($numero) . "'";
      $result = pg_query($connection, $requete);

      if ($result) {
          echo "La mise à jour est passée !";
      } else {
          echo "Erreur lors de la mise à jour : " . pg_last_error($connection);
      }

      // Affiche la requête de sélection mise à jour
      $requete1 = "SELECT * FROM prescription WHERE numero_prescription='" . htmlspecialchars($numero) . "'";
      echo "<div class=requte_display'>";
      print_requete($connection, $requete1);
      echo "</div>";

      // Ferme la connexion
      pg_close($connection);
    }
    }
?>
</body>
</html>
