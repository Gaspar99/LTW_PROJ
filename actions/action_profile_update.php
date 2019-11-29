<?php 
    include_once('../includes/session.php');
    include_once('../database/db_user.php');

    #print_r($_POST);
    update_profile($_POST);

    #redirect
    $id=(string)$_POST['id'];
    header("Location: ../pages/usr_profile.php?id=$id");
?>
