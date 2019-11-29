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
                <script src="../script/main.js" defer></script>
            </head>
            
            <body class="site-container">
                <header class="site-header">
                    <a href="../pages/home.php"><img class="site-logo" src="../images/logo.png" alt="Web site Logo"></a>
                    <button onclick="openSearchForm()">Search</button>
                    <?php if ($user_email == null) { ?>
                        <div class="auth">
                            <button onclick="openSignInForm()">Log In</button>
                            <button onclick="openSignUpForm()">Sign Up</button>
                        </div>
                    <?php } else { 
                        $user = getUserName($user_email); ?>
                        <button class="username" onclick="toggleDropDownMenu()"><?=$user['first_name']?> <?=$user['last_name']?></button>
                    <?php } ?>
                </header>

                <main class="site-content">
    <?php } ?>


<?php
    /**
    * Draws the footer for all pages.
    */ 
    function draw_footer() { ?>
                </main>
                <footer class="site-footer">Copyright © 2019 LTW FEUP</footer>
            </body>
        </html>
<?php } ?>
    

