<?php
  include_once("../includes/session.php");
  include_once("../database/db_user.php");

  $password = $_POST["password"];
  //TODO: preg_match on password

  //TODO: preg_match on other input

  $user = $_POST;

  try {
    add_user($user);

    $_SESSION["user_email"] = $user["email"];
    $_SESSION["messages"][] = array("type" => "success", "content" => "Signed up and logged in!");
    
  } catch (PDOException $e) {
    
    die($e->getMessage());
    
    $_SESSION["messages"][] = array("type" => "error", "content" => "Failed to signup!");
  }

  header("Location: ../pages/home.php");
  
?>

