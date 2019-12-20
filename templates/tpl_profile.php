<?php
include_once("../database/db_reservations.php");

/**
 * 
 */
function draw_profile($user_id)
{
    $user_info = get_user_info($user_id); ?>
    
    <article id="profile_page">

        <section id="user_info">
            <div id="user_bio">
                <h1 id="user_first_name"><?= $user_info["first_name"] ?></h1>
                <h1 id="user_last_name"><?= $user_info["last_name"] ?></h1>
                <script src="../script/title.js" onload="update_title(document.getElementById('user_first_name').innerHTML + ' ' + document.getElementById('user_last_name').innerHTML)" defer></script>
                <img id="profile_pic" src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>" alt="Profile Picture" />
                <h2 id="phone_number"><?= $user_info["phone_number"] ?></h2>
                <h2 id="email"><?= $user_info["email"] ?></h2>
            </div>

            <?php if (isset($_SESSION["user_email"]) && $user_info["email"] == $_SESSION["user_email"]) { ?>
                <div id="user_options">
                    <a class="button" href="../pages/add_place.php">Add Place</a>
                    <a class="button" href="../pages/edit_profile.php">Edit Profile</a>
                </div>
            <?php } else {?>
                <a id="send_message" class="button" href="../pages/chat.php?id=<?=$user_id?>">Send a Message</a>
           <?php }?>
        </section>

        <section id="user_places">
            <!-- can use ids for each place if needed-->
            <div id="for_rental">
                <h3>My Places</h3>
                <?php draw_places(get_user_places($user_id)); ?>
            </div>
            <?php if (isset($_SESSION["user_email"]) && $user_info["email"] == $_SESSION["user_email"]) { ?>
                <div id="reservations">
                    <h3>My Reservations</h3>
                    <?php draw_list_reservations($user_id); ?>
                </div>
            <?php } ?>
        </section>
    </article>

<?php }

/**
 * 
 */
function draw_edit_profile($user_id)
{
    $user_info = get_user_info($user_id); ?>
    <script src="../script/title.js" onload="update_title('Edit Profile')" defer></script>
    <form id="edit_profile" action="../actions/action_update_profile.php" method="post" enctype="multipart/form-data">

        <section id="profile_info">

            <div id="user_name">

                <div id="user_first_name">
                    <label for="first_name">First Name</label>
                    <input type="text" name="first_name" value="<?= $user_info["first_name"] ?>" pattern="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
                </div>

                <div id="user_last_name">
                    <label for="last_name">Last Name</label>
                    <input type="text" name="last_name" value="<?= $user_info["last_name"] ?>" pattern="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
                </div>

            </div>

            <div id="profile_pic_update">
                <img src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>" alt="Profile_pic" />
                <div class="button upload_button">
                    Update Profile Picture
                    <input type="file" name="image">
                </div>
            </div>

        </section>

        <section id="profile_details">

            <div id="phone_number">
                <label for="phone_number">Phone Number</label>
                <input type="text" name="phone_number" value="<?= $user_info["phone_number"] ?>" pattern="^(9\d{8})$" 
                title ="Phone Number should start with a 9 and have 9 characters of length">
            </div>

            <div id="email">
                <label for="email">Email</label>
                <input type="email" name="email" value="<?= $user_info["email"] ?>" pattern= "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
            </div>

            <div id="password_div">
                <label for="password">Password</b></label>
                <input id="password" type="password" name="password" value="" 
                pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
                title ="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" >
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" type="password" placeholder="Repeat Password" name="confirm_password" 
                pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" 
                title="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter">
            </div>

        </section>

        <input type="hidden" name="id" value="<?= $user_id ?>">
        <input type="hidden" name="csrf" value="<?=$_SESSION["csrf"]?>">

        <button id="edit_profile_submit_button" class="submit_button" type="submit" value="Upload">Save</button>

    </form>
<?php } 


/**
 * 
 */
function draw_list_reservations($user_id) 
{
    $user_reservations = get_user_reservations($user_id); 

    if ($user_reservations == null ) { ?>
        <h2>No reservations made<h2>

    <?php } else { 
        
        draw_reservations_header(); ?>
        
        <ul id="reservations_list" > <?php
    
            foreach ($user_reservations as $reservation) { ?>

                <li id="reservation_line" name="reservation_id<?=$reservation['id']?>">
                    <?php draw_reservation($reservation); ?>
                </li>

            <?php } ?>

        </ul>

    <?php } 
}


function draw_reservations_header() 
{ ?>

    <div id="reservations_header">

        <label id="price_label">Price</label>

        <label id="num_guests_label">Guests</label>

        <div id="time_label">
            <label id="check_in_label"> Check-In</label>
            <label id="check_out_label">Check-Out</label>
        </div>

        <label id="options_label">Options</label>

    </div>
    
<?php }


function draw_reservation($reservation) 
{ ?>

    <div class="price"><?=$reservation["price"]?>€</div>

    <div class="num_guests"><?=$reservation["num_guests"]?></div>

    <div class="time">
        <span class="reservation_check_in"><?=$reservation["check_in"]?></span>
        <span class="reservation_check_out"><?=$reservation["check_in"]?></span>
    </div>

    <div class="options">

        <a class="view_place button" href="../pages/place.php?id=<?=$reservation["place_id"]?>">View Place</a>

        <?php if (can_be_reviewed($reservation['id'])) { ?>
            <button class="review" id="open_review_box">Review</button>
            <?php draw_review_box($reservation['id'], $reservation["place_id"]);  
        } 

        if (can_be_cancelled($reservation['id'])) { ?>
            <button class="cancel" onclick="cancel_reservation(<?=$reservation['id']?>)">Cancel</button>
        <?php } ?> 

    </div>
    
<?php }

/**
 * 
 */
function draw_review_box($reservation_id, $place_id) { ?>
    
    <div class="modal">
        <form class="review_box modal_content animate" action="../actions/action_make_review.php" method="post">

            <span class="close" id="close_review_box" title="Close Review Form">&times;</span>

            <div class="review_rating">
                <label for="rating">Rating</label>
                <input type="number" name="rating">
            </div>
        
            <div class="review_comment">
                <label for="comment">Comment</label>
                <textarea name="comment" rows="4" placeholder="Write a review comment" pattern="^[ \w\s.,;\/()!?\$#@%&{}<>\"']+$"></textarea>
            </div>

            <input type="hidden" name="reservation_id" value="<?=$reservation_id?>">
            <input type="hidden" name="place_id" value="<?=$place_id?>">
            <input type="hidden" name="csrf" value="<?=$_SESSION["csrf"]?>">

            <button type="submit" class="submit_button">Post Review</button>

        </form>
    </div>
<?php } ?>

