<?php 
  include_once('../includes/session.php');
  include_once('../templates/tpl_common.php');
  include_once('../templates/tpl_places.php');
  include_once('../templates/tpl_auth.php');
  include_once('../templates/tpl_search.php');
  include_once('../database/db_places.php');
  include_once('../database/db_geography.php');

  $places = get_places();
  $countries = get_countries();
  $place_id = $_GET['id'];

  draw_site_header();
  draw_place_info($place_id);
  draw_footer();
?>