<?php
    include_once('../includes/session.php');
    include_once('../database/db_places.php');

    add_place($_POST);

    #redirect
    $id=(string)$_POST['owner_id'];
    header("Location: ../pages/usr_profile.php?id=$id");

?>