<!-- <html>
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
    // $client = pg_fetch_array($res);
    // echo "<tr>".$client[1]. "</tr>";
    $res = pg_query($connection, $requete);
    if($res) {
        // echo "<th>" . "okaaaaay";
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
</html> -->


<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
   <h2>Exemple de requ&ecirc;te php PostgreSQL</h2>
<?php
        include "connect_pg.php"; /* You don't have permission to access this resource.Le fichier connect_pg.php contient
les identifiants de connexion */
      /*  $requete = "SELECT A.nom_acteur, COUNT AS nombre
                    from acteur A, role Ro
                    WHERE A.numero_acteur = Ro.numero_acteur
                    GROUP BY A.nom_acteur";*/

            $requete = "SELECT * from client;";
            
             /* Si l'execution est reussie... */
      $res = pg_query($connection, $requete);
          if($res) {
     ?>
     <table>
       <tr>
         <!-- <th>Nom acteur</th>
         <th>Nombre de flims</th> -->
         <?php
         $n = pg_num_fields($res);
         for($i=0; $i<$n ; $i++){
          echo "<th>";
        echo pg_field_name($res,$i);
        echo"(";
        echo pg_field_type($res,$i);
        echo")</th>";
        }
         ?>
       </tr>
<?php
                /* ... on récupère un tableau stockant le résultat */
            while ($client =  pg_fetch_array($res)) {
              echo "<tr>";
              for($i=0; $i<$n; $i++){
                echo"<td>";
                echo $client[$i];
                echo "</td>";
              }
              echo "</tr>"."\n";

            }
            /*liberation de l'objet requete:*/
      }
    pg_free_result($res);
/*fermeture de la connexion avec la base*/
         pg_close($connection);
?>
   </table>
 </body>
</html>