<?php
include_once('../includes/session.php');
include_once('../database/db_user.php');

update_profile($_POST); 

if ($_FILES['image']['name'] != '') {
    update_profile_pic($_POST);  
}

#redirect
$id = (string) $_POST['id'];
header("Location: ../pages/usr_profile.php?id=$id");
?>