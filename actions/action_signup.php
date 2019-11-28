<?php
  include_once('../includes/session.php');
  include_once('../database/db_user.php');

  try {
    addUser($_POST);
    $_SESSION['user_email'] = $_POST['email'];
  } catch (PDOException $e) {
    die($e->getMessage());
  }

  header('Location: ../pages/home.php');
  
?>

