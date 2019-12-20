<?php
include_once("../database/db_user.php");
include_once("../database/db_location.php");
include_once("../database/db_notifications.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");

/**
 * Function resposible to draw the header of the site considering the state of the user
 */
function draw_site_header($styles, $scripts)
{
    $countries = get_countries();

    if (isset($_SESSION["user_email"])) {
        draw_header($_SESSION["user_email"], $styles, $scripts);
    } else {
        draw_header(null, $styles, $scripts);
        draw_sign_in();
        draw_sign_up($countries);
    }

    draw_search_bar();
    draw_messages();
    init_site_content();
}

/**
 * Draws the html header for all pages. Receives an user id 
 * if the user is logged in in order to know what to draw
 */
function draw_header($user_email, $styles, $scripts)
{
    $user_id = get_user_id($user_email); ?>

    <!DOCTYPE html>
    <html lang="en-US">

    <head>
        <title>Rental Eye</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="icon" href="../images/site/logo.jpeg">
        <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/js/main.js" defer></script>
        <?php draw_styles($styles); 
        draw_scripts($scripts); ?>
    </head>
    
    <body id="site_container">
        <header id="site_header">
            <div id="site_logo">
                <a href="../pages/home.php">
                    <img src="../images/site/logo.jpeg" alt="Web site Logo" width="50" height="50">
                    <div id="site_name">Rental Eye</div>
                </a>
            </div>
            <button id="search_button" >Search</button>
            <?php if ($user_email == null) { ?>
                <div id="auth_forms_buttons">
                    <button id="sign_in_form_button" >Log In</button>
                    <button id="sign_up_form_button" >Sign Up</button>
                </div>
            <?php } else {
                    $user = get_user_name($user_email);
                    $usr_id = get_user_id($user_email) ?>
                <body onload="setInterval(function() { polling_notification(<?= $usr_id ?>); }, 5000);">
                    <div id="user_options">
                        <span id="notification_bell">
                           <?php 
                            $seen_status = get_unseen_notification($user_id);
                           if($seen_status['unseen_num'] == $seen_status['notification_num']) { ?>
                                <i class="material-icons">notifications</i>
                            <?php } else {?>
                                <i class="material-icons">notifications_active</i>
                            <?php } 
                            draw_notifications($_SESSION["user_email"]); ?>
                        </span>
                        <a id="chat_icon" href="../pages/chat.php">
                            <i class="material-icons">mail_outline</i>
                        </a>
                        <div id="user_menu">
                            <button id="username_tile">
                                <img src="../images/profiles/thumbs_small/<?= $user["profile_pic"] ?>" alt="User Profile Picture" width="50" height="50">
                                <div id="username"><?= $user["first_name"] ?> <?= $user["last_name"] ?></div>
                                <i class="material-icons">arrow_drop_down</i>
                            </button>
                            <a class="user_menu_option" href="../pages/profile.php?id=<?= $user_id ?>">My Profile</a>
                            <a class="user_menu_option" href="../pages/add_place.php">Add Place</a>
                            <a class="user_menu_option" href="../actions/action_logout.php">Logout</a>
                        </div>
                    </div>
                <?php } ?>
        </header>

    <?php }


/**
* Draws a title on the top of the web page
*/
function draw_title($title)
{ ?>
    <h1 id="main_title"><?= $title ?></h1>
<?php }


/**
* Draws error and sucess messages
*/
function draw_messages()
{
    if (isset($_SESSION["messages"])) { ?>

        <section id="messages">
            <?php foreach ($_SESSION["messages"] as $message) { ?>
                <div class="<?= $message["type"] ?>"><?= $message["content"] ?></div>
            <?php } ?>
        </section>

        <?php unset($_SESSION["messages"]);
    }
}


/**
* Initiates the main site content
*/
function init_site_content()
{ ?>
<main id="site_content">
<?php }


/**
* Draws the footer for all pages.
 */
function draw_footer()
{ ?>
            </main>
        <footer id="site_footer">Copyright © 2019 LTW FEUP</footer>
    </body>

    </html>
<?php }

/**
 * Displays all the notificaitons of the user
 */
function draw_notifications($email)
{
    $usr_id = get_user_id($email);
    $notifications = get_all_usr_notifications($usr_id);
    
    ?>
    <div id="notifications_box"> 
        <ul id="notification_list">

            <?php if (sizeof($notifications) == 0) { ?>
            <h3>No Notifications</h3>
            <?php } else { 
            foreach ($notifications as $notification) { 
                if($notification["is_read"]){?>
                    <li id="read_notification" name="notification_id<?= $notification['id'] ?>">
                        <a href="../pages/place.php?id=<?=$notification['place_id']?>"?>
                            <span> <?=$notification['notification_content']?> </span>
                            <span><?= date("M-d H:i",strtotime($notification['notification_date'])) ?></span>
                        </a>
                        <span name="button_type<?= $notification['id'] ?>" onclick="unmark_as_seen(<?= $notification['id'] ?>)">
                            <i name="icon_visibility<?= $notification['id'] ?>" class="material-icons">visibility_off</i>
                        </span>
                        <span  onclick="remove_notification(<?= $notification['id'] ?>)">
                            <i class="material-icons">delete</i>
                        </span>
                    </li>
                <?php } else { ?>
                    <li id="unread_notification" name="notification_id<?= $notification['id'] ?>">
                        <a href="../pages/place.php?id=<?=$notification['place_id']?>"?>
                            <span> <?=$notification['notification_content']?> </span>
                            <span><?= date("M-d H:i",strtotime($notification['notification_date'])) ?></span>
                        </a>
                        <span name="button_type<?= $notification['id'] ?>" onclick="mark_as_seen(<?= $notification['id'] ?>)">
                            <i name="icon_visibility<?= $notification['id'] ?>" class="material-icons">visibility</i>
                        </span>
                        <span  onclick="remove_notification(<?= $notification['id'] ?>)">
                            <i class="material-icons">delete</i>
                        </span>
                    </li>
            <?php }
        } ?>
        </ul>
    <?php } ?>
    </div>
<?php } 

/**
 * Draws the links to the css files included
 */
function draw_styles($styles) {
    foreach ($styles as $style) { ?>
    <link rel="stylesheet" href="../css/<?=$style?>">
    <?php } 
}

/**
 * Draws the links to the javascript files included
 */
function draw_scripts($scripts) {
    foreach ($scripts as $script) { ?>
    <script src="../script/<?=$script?>" defer></script>
    <?php }
}