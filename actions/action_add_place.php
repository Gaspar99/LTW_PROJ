<?php
    include_once('../includes/session.php');
    include_once('../database/db_places.php');

    try {
        add_place($_POST);

    } catch (PDOException $e) {
        die($e->getMessage());
    }

    #redirect
    $id= (string) $_POST['owner_id'];

    header("Location: ../pages/usr_profile.php?id=$id");

?>