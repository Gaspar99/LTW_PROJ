<?php
include_once("../includes/session.php");
include_once("../templates/tpl_common.php");

include_once("../templates/tpl_chat.php");

// Verify if user is logged in
if (!isset($_SESSION["user_email"]))
    die(header('Location: ../pages/home.php'));

$new_msg = $_GET['id'];

#get_messages 

draw_site_header();
draw_title("My messages");
draw_chat($new_msg);
draw_footer();
