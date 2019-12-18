<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

// Verifies CSRF token
if ($_SESSION["csrf"] != $_POST["csrf"]) {
    $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid request!");
    die(header("Location: ../pages/home.php"));
}

$user_id = get_user_id($_SESSION["user_email"]);

update_profile($_POST); 

if ($_FILES["image"]["name"] != "") {
    update_profile_pic($user_id);  
}

header("Location: ../pages/profile.php?id=$user_id");
