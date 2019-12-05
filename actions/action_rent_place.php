<?php 
    include_once('../includes/session.php');
    include_once('../database/db_reservations.php');

    try {
        
        add_reservation($_POST);

    } catch (PDOException $e) {

        die($e->getMessage());
    }

?>