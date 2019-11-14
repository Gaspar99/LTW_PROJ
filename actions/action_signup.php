<?php
  include_once('../includes/session.php');
  include_once('../database/db_user.php');

  $user['first_name'] = $_POST['first_name'];
  $user['last_name'] = $_POST['last_name'];
  $user['email'] = $_POST['email'];
  $user['password'] = $_POST['password'];
  $user['phone_num'] = $_POST['phone_num'];

  //$user['country_id'] = $_POST['country_id'];

  try {
    addUser($user);

    $_SESSION['user_email'] = $user['email'];
    
    header('Location: ../pages/home.php');
    
  } catch (PDOException $e) {
    die($e->getMessage());
    header('Location: ../pages/home.php');
  }
?>