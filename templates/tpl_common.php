<?php
include_once("../database/db_user.php");
include_once("../database/db_geography.php");
include_once("../templates/tpl_auth.php");
include_once("../templates/tpl_search.php");

/**
 * 
 */
function draw_site_header()
{
    $countries = get_countries();

    if (isset($_SESSION["user_email"])) {
        draw_header($_SESSION["user_email"]);
        draw_notifications($_SESSION["user_email"]);
    } else {
        draw_header(null);
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
function draw_header($user_email)
{
    $user_id = get_user_id($user_email); ?>

    <!DOCTYPE html>
    <html lang="en-US">

    <head>
        <title>Rental Eye</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="../script/main.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/js/main.js"></script>
    </head>

    <body id="site_container">
        <header id="site_header">
            <div id="site_logo">
                <a href="../pages/home.php">
                    <img src="../images/site/logo.jpeg" alt="Web site Logo" width="50" height="50">
                    <div id="site_name">Rental Eye</div>
                </a>
            </div>
            <button id="search_button" onclick="toggle_search_form()">Search</button>
            <?php if ($user_email == null) { ?>
                <div id="auth_forms_buttons">
                    <button onclick="open_sign_in_form()">Log In</button>
                    <button onclick="open_sign_up_form()">Sign Up</button>
                </div>
            <?php } else {
                    //todo put the loop to always check for new notifications/messages..
                    $user = get_user_name($user_email); ?>
                <div id="user_options">
                    <span id="notification_bell" onclick="toggle_notifications()">
                        <i class="material-icons">notifications</i>
                    </span>
                    <a id="chat_icon" href="../pages/chat.php">
                        <i class="material-icons">chat</i>
                    </a>
                    <div id="user_menu">
                        <button id="username_tile" onclick="toggle_dropdown_menu()">
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
     * 
     */
    function draw_title($title)
    { ?>
        <h1><?= $title ?></h1>
        <hr>
        <?php }


        /**
         * 
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
         * 
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

function draw_notifications($email)
{ ?>
    <div id="notifications_box">
        bleh
    </div>
<?php } ?>