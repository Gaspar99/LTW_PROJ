<?php 
    include_once('../database/db_user.php');
    include_once('../database/db_geography.php');
    include_once('../templates/tpl_auth.php');
    include_once('../templates/tpl_search.php');

    /**
    * 
    */
    function draw_site_header() {
        $countries = get_countries();

        if (isset($_SESSION['user_email'])) {
            draw_header($_SESSION['user_email']);
            draw_dropdrown($_SESSION['user_email']);
        }
        else {
            draw_header(null);
            draw_signIn();
            draw_signUp($countries);
        }
    
        draw_search_bar($countries);
        draw_messages();
        init_site_content();
    }

    /**
    * Draws the html header for all pages. Receives an user id 
    * if the user is logged in in order to know what to draw
    */
    function draw_header($user_email) { ?>

        <!DOCTYPE html>
        <html lang="en-US">
            <head>
                <title>Rental Eye</title>
                <meta charset="utf-8">
                <link rel="stylesheet" href="../css/style.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <script src="../script/main.js" defer></script>
            </head>
            
            <body id="site-container">
                <header id="site-header">
                    <div id="site-logo">
                        <a href="../pages/home.php">
                            <img src="../images/logo.png" alt="Web site Logo">
                            <div id='site-name'>Rental Eye</div>
                        </a>
                    </div>
                    <button id="search-button" onclick="toggleSearchForm()">Search</button>
                    <?php if ($user_email == null) { ?>
                        <div id="auth-forms-buttons">
                            <button onclick="openSignInForm()">Log In</button>
                            <button onclick="openSignUpForm()">Sign Up</button>
                        </div>
                    <?php } else { 
                        $user = getUserName($user_email); ?>
                        <button id="username-tile" onclick="toggleDropDownMenu()">
                            <img src="../images/profiles/originals/<?=$user['profile_pic']?>" alt="User Profile Picture">
                            <div id="username"><?=$user['first_name']?> <?=$user['last_name']?></div>
                            <i class="material-icons">arrow_drop_down</i>
                        </button>
                    <?php } ?>
                </header>         
                   
    <?php } ?> 

<?php 
    /**
    * 
    */
    function draw_title($title) { ?>
        <h1><?=$title?></h1>
        <hr>
<?php } ?>

<?php
    /**
    * 
    */
    function draw_messages() { 
        if (isset($_SESSION['messages'])) { ?>

            <section id="messages">
                <?php foreach($_SESSION['messages'] as $message) { ?>
                    <div class="<?=$message['type']?>"><?=$message['content']?></div>
                <?php } ?>
            </section>

            <?php unset($_SESSION['messages']); 
        } 
    } ?>

<?php 
    /**
    * 
    */
    function init_site_content() { ?>
        <main id="site-content">
    <?php } ?>

<?php
    /**
    * Draws the footer for all pages.
    */ 
    function draw_footer() { ?>
                </main>
                <footer id="site-footer">Copyright © 2019 LTW FEUP</footer>
            </body>
        </html>
<?php } ?>
    

