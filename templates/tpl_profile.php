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
                <img id="profile_pic" src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>" alt="Profile Picture" />
                <h2 id="phone_number"><?= $user_info["phone_number"] ?></h2>
                <h2 id="email"><?= $user_info["email"] ?></h2>
            </div>

            <?php if (isset($_SESSION["user_email"]) && $user_info["email"] == $_SESSION["user_email"]) { ?>
                <div id="user_options">
                    <a class="button" href="../pages/add_place.php">Add Place</a>
                    <a class="button" href="../pages/edit_profile.php">Edit Profile</a>
                </div>
            <?php } ?>
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

    <form id="edit_profile" action="../actions/action_update_profile.php" method="post" enctype="multipart/form-data">

        <section id="profile_info">

            <div id="user_name">

                <div id="user_first_name">
                    <label for="first_name">First Name</label>
                    <input type="text" name="first_name" value="<?= $user_info["first_name"] ?>">
                </div>

                <div id="user_last_name">
                    <label for="last_name">Last Name</label>
                    <input type="text" name="last_name" value="<?= $user_info["last_name"] ?>">
                </div>

            </div>

            <div id="profile_pic_update">
                <img src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>" alt="Profile_pic" />
                <div class="button upload_button">
                    Update Profile Picture
                    <input type="file" name="image" required>
                </div>
            </div>

        </section>

        <section id="profile_details">

            <div id="phone_number">
                <label for="phone_number">Phone Number</label>
                <input type="text" name="phone_number" value="<?= $user_info["phone_number"] ?>" pattern="(9([0-9]{8}))" 
                title ="Phone Number should start with a 9 and have 9 characters length">
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
                <!-- todo only required if passord above has smth in value, a script basically -->
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" type="password" placeholder="Repeat Password" name="confirm_password" 
                pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" 
                title="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" required>
            </div>

        </section>

        <input type="hidden" name="id" value="<?= $user_id ?>">

        <button class="submit_button" type="submit" value="Upload">Save</button>

    </form>
<?php } 
/**
 * 
 */
function draw_list_reservations($user_id){
    $user_reservations = get_user_reservations($user_id); ?>
    <ul id="reservations_list" > <?php
        foreach($user_reservations as $reservation){
            $place_info = get_place_reserved($reservation['place_id']);?>
            <li id="reservation_line"> 
                <?=$place_info['title']?>
                <a id="adress">
                    <?=$place_info['country_name']?> - <?=$place_info['city_name']?> <?=$place_info['address']?> 
                </a> 
                <a id="numerical">
                    Guests: <?=$reservation['num_guests']?>  
                    <?=$reservation['check_in']?> - <?=$reservation['check_out']?>       
                    Price: <?=$reservation['price']?>€  
                </a>
                <div id="owner_profile">
                    <a class="button" href="../pages/profile.php?id=<?= $place_info["owner_id"] ?>">
                        <img src="../images/profiles/thumbs_small/<?= $place_info["owner_profile_pic"] ?>" alt="User Profile Picture">
                        <div id="username"><?= $place_info["owner_first_name"] ?> <?= $place_info["owner_last_name"] ?></div>
                    </a>
                </div>

                <!-- check if can be reviewed -->
                <button id="review" onclick="toggle_review_box(<?=$reservation['id']?>)"> Review </button>

                <!-- check if can be canceled -->
                <button id="cancel" onclick="cancel_reservation(<?=$reservation['id']?>)"> Cancel </button>
            
                
                <?php draw_review_box($reservation['id']);?>              
            </li>
        <?php } ?>
    </ul>
<?php }
/**
 * 
 */
function draw_review_box($id){
    $box_id = "review_box";
    $box_id .= $id; 

    $comment_holder_id = "comment_holder";
    $comment_holder_id .= $id; 

    $rating_holder_id = "rating_holder";
    $rating_holder_id .= $id; 
    ?>

  <div id=<?=$box_id?> class="modal">
   
    <span class="close" onclick="close_review_box(<?=$id?>)" title="Close Form">&times;</span>
     
    <div class="container">
        <label for="comment"></label>
        <input id=<?=$comment_holder_id?> type="text_area" placeholder="Write your comment" name="comment" required>

        <label for="rating">Rate</label>
        <input id=<?=$rating_holder_id?> type="number" name="rating" min="1" max="5" required>
        <button class="submit_button" onclick="upload_comment(<?=$id?>)">Post</button><!-- todo ajax submit-->
    </div>
  </div>
<?php } ?>

