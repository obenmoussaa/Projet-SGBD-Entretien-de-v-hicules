<html>

<head>
    <title>PHP Test</title>
</head>

<body>
    <h2>Exemple de requ&ecirc;te php PostgreSQL</h2>
    <?php
    include "connect_pg.php"; /* You don't have permission to access this resource.Le fichier connect_pg.php contient
les identifiants de connexion */
    /* Si l'execution est reussie... */
    function print_requette($connection, $requete) {
        $res = pg_query($connection, $requete);
        if ($res) {
            ?>
            <table>
                <tr>
                    <?php
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
                    print_nom_colonnes($res);
                    ?>
                </tr>
                <?php
                function print_lignes($res)
                {
                    $n = pg_num_fields($res);
                    /* ... on récupère un tableau stockant le résultat */
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
                print_lignes($res);
            /*liberation de l'objet requete:*/
        }
    }
    pg_free_result($res);
    /*fermeture de la connexion avec la base*/
    pg_close($connection);
    $requete1 = "SELECT * from client;";
    $requete2 = "";
    
    print_requette($connection,$requete1);
    ?>
    </table>
</body>

</html>