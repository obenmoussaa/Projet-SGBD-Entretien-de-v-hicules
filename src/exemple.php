<html>

<head>
    <title>PHP Test</title>
</head>

<body>
    <?php
    // error_reporting(E_ALL);
    // ini_set('display_errors', 1);
    include "connect_pg.php";
    //cette fonction affiche les colonnes du resultat d une requtte
    function print_nom_colonnes($res)
    {
        $n = pg_num_fields($res);
        for ($i = 0; $i < $n; $i++) {
            echo "<th>";
            echo pg_field_name($res, $i);
            echo "(";
            echo pg_field_type($res, $i);
            echo ")</th>";
        }
    }
    //cette fonction affiche les lignes du resultat d une requette
    function print_lignes($res)
    {
        $n = pg_num_fields($res);
        while ($client = pg_fetch_array($res)) {
            echo "<tr>";
            for ($i = 0; $i < $n; $i++) {
                echo "<td>";
                echo $client[$i];
                echo "</td>";
            }
            echo "</tr>" . "\n";
        }
        return;
    }
    ?>
    <section class="requete_display">
        <?php
    //cette focntion affiche le resultat d une requtte
    function print_requete($connection, $requete)
    {
        $res = pg_query($connection, $requete);

        if ($res) {
            ?>
            <table>
                <tr>
                    <?php   
                    print_nom_colonnes($res);
                    ?>
                </tr>
                <?php  
                print_lignes($res);
                pg_free_result($res);
            ?>
            </table>
            <?php
        }

    }
    ?>
    </section>
    <?php

    // Utilisation de la fonction print_requete avec votre requête
    $requete = "SELECT * FROM client;";
    $requette2 = "SELECT
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
            c.numero_client;";
   // print_requete($connection, $requete);
    
    //print_requete($connection,$requette2);
    //pg_close($connection);

    ?>
</body>

</html>
