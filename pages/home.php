<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');
  include_once('../templates/tpl_places.php');
  include_once('../database/db_places.php');

  $places = get_places();
 
  draw_site_header();
  draw_places($places);
  draw_footer();

?>
