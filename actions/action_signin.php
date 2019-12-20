<?php
include_once("../includes/session.php");
include_once("../database/db_user.php");
include_once("../util/security_checks.php");

// Security checks
if (
  !verify_email($_POST["email"]) ||
  !verify_password($_POST["password"])
) die(header("Location: ../pages/home.php"));

// Set up of input data
$email = $_POST["email"];
$password = $_POST["password"];

if (check_user_password($email, $password)) {
  $_SESSION["user_email"] = $email;
  $_SESSION["messages"][] = array("type" => "success", "content" => "Logged in successfully!");
} else
  $_SESSION["messages"][] = array("type" => "error", "content" => "Login failed!");

header("Location: ../pages/home.php");
