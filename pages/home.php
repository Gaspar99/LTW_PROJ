<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');
  include_once('../templates/tpl_places.php');
  include_once('../templates/tpl_auth.php');
  include_once('../database/db_places.php');

  $places = get_places();

  if (isset($_SESSION['user_email'])) 
    draw_header($_SESSION['user_email']);
  else {
    draw_header(null);
    draw_signIn();
    draw_signUp();
  }

  draw_places($places);
  draw_footer();
?>