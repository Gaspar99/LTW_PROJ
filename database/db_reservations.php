<?php
    include_once('../includes/database.php');

    /**
    * 
    */
    function add_reservation($reservation) {
        $db = Database::instance()->db();

        $stmt = $db->prepare(
            'INSERT INTO reservation
            (check_in, check_out, price, tourist, place_id)
            VALUES(?, ?, ?, ?, ?)'
        );

        $stmt->execute(array(
            $reservation['check_in'], 
            $reservation['check_out'],
            $reservation['price'],
            $reservation['tourist'],
            $reservation['place_id']
        ));
    }

?>
