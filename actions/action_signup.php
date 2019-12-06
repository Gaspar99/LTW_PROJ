<?php
  include_once('../includes/session.php');
  include_once('../database/db_user.php');

  try {
    addUser($_POST);

    $_SESSION['user_email'] = $_POST['email'];
    $_SESSION['messages'][] = array('type' => 'success', 'content' => 'Signed up and logged in!');
    
  } catch (PDOException $e) {
    
    die($e->getMessage());
    
    $_SESSION['messages'][] = array('type' => 'error', 'content' => 'Failed to signup!');
    
  }

  header('Location: ../pages/home.php');
  
?>

