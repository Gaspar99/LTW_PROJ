<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../util/security_checks.php");

// Security checks
if ( 
  !verify_person_name($_POST["first_name"], "First Name") ||
  !verify_person_name($_POST["last_name"], "Last Name") ||
  !verify_email($_POST["email"]) ||
  !verify_phone_number($_POST["phone_num"]) ||
  !verify_password($_POST["password"]) ||
  !verify_number($_POST["country_id"], "Country")
) die(header("Location: ../pages/home.php"));

// Set up of user array with input data
$user = array(
  "first_name" => $_POST["first_name"],
  "last_name" => $_POST["last_name"],
  "email" => $_POST["email"],
  "phone_num" => $_POST["phone_num"],
  "password" => $_POST["password"],
  "country_id" => $_POST["country_id"]
);

// email already exists
if (get_id_by_email($_POST["email"]) != false){
  $_SESSION["messages"][] = array("type" => "error", "content" => "Email already exists!");
  die(header("Location: ../pages/home.php"));
}

try {
  add_user($user);

  $_SESSION["user_email"] = $user["email"];
  $_SESSION["messages"][] = array("type" => "success", "content" => "Signed up and logged in!");

} catch (PDOException $e) {

  die($e->getMessage());

  $_SESSION["messages"][] = array("type" => "error", "content" => "Failed to signup!");
}

header("Location: ../pages/home.php");
