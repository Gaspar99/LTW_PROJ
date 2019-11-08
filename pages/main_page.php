<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');

  if (isset($_SESSION['user_id'])) 
    draw_header($_SESSION['user_id']);
  else 
    draw_header(null);
  //draw_places();
  draw_footer();
?>