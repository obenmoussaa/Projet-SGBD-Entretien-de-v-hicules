<?php
  $login = 'alagraoui001'   /*A compléter*/;
  $db_pwd = 'lagraoui2020'  /*A compléter*/;
  /* Creation de l'objet qui gere la connexion: */
  $connection_string = "host=localhost port=5432 dbname=".$login." user=".$login." password=".$db_pwd;
  $connection = pg_connect($connection_string);
  if(!$connection) {
     echo 'error';
  }
?>
