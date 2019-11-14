<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');
  include_once('../templates/tpl_places.php');
  include_once('../templates/tpl_auth.php');
  include_once('../database/db_places.php');

  $places = get_places();

<<<<<<< HEAD
  if (isset($_SESSION['user_email'])) 
    draw_header($_SESSION['user_email']);
=======
  if (isset($_SESSION['user_id'])) 
    draw_header($_SESSION['user_id']);
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a
  else {
    draw_header(null);
    draw_signIn();
    draw_signUp();
  }

  draw_places($places);
  draw_footer();
?>