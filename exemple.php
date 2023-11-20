<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
   <h2>Exemple de requ&ecirc;te php PostgreSQL</h2>
   <h2>Exemple hahahahahahahah</h2>

<?php
    include "connect_pg.php"; /* Le fichier connect_pg.php contient la connexion à la base de données PostgreSQL */
?>
    <table>
<?php
    $requete = "SELECT * from client;";
    $res = pg_query($connection, $requete);
    if($res) {
        $n = pg_num_fields($res);
        echo "<tr>";
        for($i = 0; $i < $n; $i++) {
            echo "<th>" . pg_field_name($res, $i) . " (" . pg_field_type($res, $i) . ")</th>";
        }
        echo "</tr>";

        while($client = pg_fetch_array($res)) {
            echo "<tr>";
            for($i = 0; $i < $n; $i++) {
                echo "<td>" . $client[$i] . "</td>";
            }
            echo "</tr>";
        }
        pg_free_result($res);
    }
    /* Fermeture de la connexion avec la base */
    pg_close($connection);
?>
    </table>
 </body>
</html>
