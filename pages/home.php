<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');
  include_once('../database/db_places.php');

  $places = get_places();

  if (isset($_SESSION['user_id'])) 
    draw_header($_SESSION['user_id']);
  else 
    draw_header(null);

  draw_places($places);
  draw_footer();
?>