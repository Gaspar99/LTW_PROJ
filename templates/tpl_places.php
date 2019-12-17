<?php
include_once("../database/db_places.php");
include_once("../database/db_comments.php");
include_once("../database/db_user.php");

/**
 * 
 */
function draw_places($places)
{ ?>
    <section class="places">
        <?php
            if (sizeof($places)) {
                foreach ($places as $place)
                    draw_place($place);
            } else { ?>
            <h2 id="no_place">No places found</h2>
        <?php } ?>
    </section>

<?php }


/**
 * 
 */
function draw_place($place)
{ ?>
    <article class="place">
        <a href="../pages/place.php?id=<?= $place["place_id"] ?>">
            <h2 class="place_city_country"><?= $place["city"] ?> - <?= $place["country"] ?></h2>
            <img class="place_image" src="../images/places/thumbs_small/<?= $place["image_name"] ?>" alt="Place Image" width="400" height="250" />
            <h1 class="place_title"><?= $place["title"] ?></h1>
            <ul class="place_footer">
                <li class="place_rating">
                    <i class="material-icons">star</i>
                    <div class="rating_value"><?= $place["rating"] ?></div>
                </li>
                <li class="place_price">
                    <div class="price_value"><?= $place["price_per_night"] ?></div>
                    <i class="material-icons">euro</i>
                </li>
                <li class="place_num_guests">
                    <i class="material-icons">people</i>
                    <div class="num_guests_value"><?= $place["num_guests"] ?></div>
                </li>
            </ul>
        </a>
    </article>

<?php }


/**
 * 
 */
function draw_place_info($place_id)
{
    $place = get_place_info($place_id);
    $owner = get_user_info($place["place_owner"]);
    $image_gallery = get_place_gallery($place_id); #TODO check if the rly works 
    $place_tags = get_place_tags($place_id);
    ?>
    <article id="place_page">
        <div id="place_header">
            <h1 id="place_title"><?= $place["title"] ?></h1>
           <script src="../script/title.js" onload="update_title(document.getElementById('place_title').innerHTML)" defer></script>
            <?php if (isset($_SESSION["user_email"]) && $owner["email"] == $_SESSION["user_email"]) { ?>
                <form method="POST" action="../pages/edit_place.php">
                    <input type="hidden" name="place_id" value="<?= $place_id ?>" />
                    <button id="edit_place" type="submit">Edit Place</button>
                </form>
                <form method="POST" action="../actions/action_remove_place.php">
                    <input type="hidden" name="place_id" value="<?= $place_id ?>" />
                    <button id="remove_place" type="submit">Remove Place</button>
                </form>
            <?php } else { 
                draw_user_tile($place["place_owner"]);    
            } ?>
        </div>

        <ul id="location">
            <li><?= $place["country_name"] ?></li>
            <li><?= $place["city_name"] ?></li>
            <li><?= $place["place_address"] ?></li>
        </ul>

        <div id="place_details">
            <div class="rating">
                <i class="material-icons">star</i>
                <div class="rating_value"><?= $place["rating"] ?></div>
            </div>

            <div id="num_guests">
                <i class="material-icons">people</i>
                <div class="num_guests_value"><?= $place["num_guests"] ?></div>
            </div>
        </div>

        </div>
        <hr>

        <section id="place_body">

            <section id="gallery_rent">

                <section id="place_gallery">
                    <div id="image_container">
                        <?php foreach ($image_gallery as $image) { ?>
                            <img class="image_slide" src="../images/places/thumbs_medium/<?= $image['img_name'] ?>" width="550" height="400" alt="Image Place">
                            <img class="fullscreen_slide" src="../images/places/originals/<?= $image['img_name'] ?>" alt="Image Place">
                        <?php }
                            if (sizeof($image_gallery) > 1) {  ?>
                            <button class="display_left" onclick="plusDivs(-1)">&#10094;</button>
                            <button class="display_right" onclick="plusDivs(+1)">&#10095;</button>
                        <?php } ?>
                        <button class="full_screen" onclick="toggle_image_fullscreen()">
                            <i class="material-icons">fullscreen</i>
                        </button>
                    </div>
                </section>

                <section id="rent_section">

                    <div id="price_per_night">
                        <div><?= $place["price"] ?></div>
                        <i class="material-icons">euro</i>
                    </div>

                    <?php if (isset($_SESSION["user_email"])) { 
                        if(is_owner(get_user_id($_SESSION["user_email"]),$place_id)){
                           draw_reservations_made($place_id);
                            }else{ ?>
                            <script src="../script/reservation.js" onload="get_locked_days(<?=$place_id?>)" defer></script>
                            <form id="rent_form" action="../actions/action_rent_place.php" method="post">

                                <div class="form_date">
                                    <div class="check_in">
                                        <label for="check_in">Check In</label>
                                        <input id="reservation_check_in" name="check_in"  required autocomplete="off">
                                    </div>

                                    <div class="check_out">
                                        <label for="check_out">Check Out</label>
                                        <input id="reservation_check_out" name="check_out"  required autocomplete="off">
                                    </div>
                                </div>
                                <div id="form_num_guests">
                                    <label for="num_guests">Number of Guests</label>
                                    <div id="num_guests_input">
                                        <span class="button" onclick="update_guests(event, -1);calculate_rent_price(<?=$place["price"]?>);">-</span>
                                        <input readonly type="number" value="1" min="1" max="<?= $place["num_guests"] ?>" step="1" name="num_guests" required>
                                        <span class="button" onclick="update_guests(event, +1);calculate_rent_price(<?= $place["price"] ?>);">+</span>
                                    </div>
                                </div>

                                <input type="hidden" name="tourist" value="<?= get_user_id($_SESSION["user_email"]) ?>">
                                <input type="hidden" name="place_id" value="<?= $place_id ?>">

                                <button class="submit_button" type="submit">Rent Place</button>
                            </form>
                        <?php }
                    } else { ?>
                        <h2>Log In To Rent This Place</h2>
                    <?php } ?>
                </section>

            </section>

            <section id="place_info">

                <section id="description">
                    <p><?= $place["place_description"] ?></p>
                </section>

                <hr>

                <div id="place_tags">
                    <?php foreach ($place_tags as $tag) { ?>
                        <div class="tag">
                            <i class="material-icons"><?= $tag["tag_icon"] ?></i>
                            <div id="tag"><?= $tag["tag_name"] ?></div>
                        </div>
                    <?php } ?>
                </div>

                <hr>

                <section id="comments">
                    <h2>Comments</h2>
                    <?php draw_place_comments($place_id, $place["place_owner"]) ?>
                </section>

            </section>

        </section>

    </article>

<?php }

/**
 * 
 */
function draw_add_place($user_id)
{
    $countries = get_countries(); ?>
    <script src="../script/title.js" onload="update_title('Add Place')" defer></script>
    <form id="add_place" action="../actions/action_add_place.php" method="post" enctype="multipart/form-data">

        <div id="place_title">
            <label for="title">Title</label>
            <input type="text" name="title" placeholder="Enter Title" required>
        </div>

        <section id="location">

            <div class="form_country">
                <label for="country">Country</label>
                <select name="country" class="country_select" oninput="get_city_by_country(event)" required>
                    <?= draw_country_options($countries); ?>
                </select>
            </div>

            <div class="form_city">
                <label for="city">City</label>
                <select name="city" class="city_select" required>
                    <option disabled selected>Select City</option>
                </select>
            </div>

            <div class="address">
                <label for="address">Address</label>
                <input type="text" name="address" placeholder="Enter Place Address" required>
            </div>

        </section>

        <section id="numbers">
            <div class="num_guests">
                <label for="num_guests">Max. Guests</label>
                <div id="num_guests_input">
                    <span class="button" onclick="update_guests(event, -1)">-</span>
                    <input readonly type="number" value="1" min="1" max="10" step="1" name="num_guests" required>
                    <span class="button" onclick="update_guests(event, +1)">+</span>
                </div>
            </div>

            <div id="price">
                <label for="price">Price per Night</label>
                <div class="price_input">
                    <input type="number" value="1" min="0" name="price" required>
                    <i class="material-icons">euro</i>
                </div>
            </div>

        </section>

        <hr>

        <article id="body">

            <div id="upload">
                <img src="../images/site/default_place.jpeg" width="400" height="300">
                <div class="button upload_button">
                    Upload Photo
                    <input type="file" name="image" required>
                </div>
            </div>

            <section id="details">
                <div id="description">
                    <label for="description">Description</label>
                    <textarea name="description" rows="4" placeholder="Enter Place Description" required></textarea>
                </div>

                <hr>

                <section id="tags_section">
                    <?php $tags = get_tags(); ?>
                    <label for="tags">Tags</label>
                    <div id="tags">
                        <?php foreach ($tags as $tag) { ?>
                            <div class="tag">
                                <i class="material-icons"><?= $tag["tag_icon"] ?></i>
                                <div class="tag_name"><?= $tag["tag_name"] ?></div>
                                <div class="checkbox_container">
                                    <input type="checkbox" name="tags[]" value="<?= $tag["id"] ?>" oninput="toggle_checkbox(event)">
                                    <i class="material-icons">check</i>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </section>
            </section>
        </article>


        <input type="hidden" name="owner" value="<?= $user_id ?>">

        <button class="submit_button" type="submit">Create New Place</button>
    </form>

<?php }

/*
 * 
 */
function draw_edit_place($user_id, $place_id)
{
    $place = get_place_info($place_id);
    $place_tags = get_place_tags($place_id);
    $image_gallery = get_place_gallery($place_id);
    ?>
    <script src="../script/title.js" onload="update_title('Edit Place')" defer></script>
    <form id="edit_place" action="../actions/action_update_place.php" method="post" enctype="multipart/form-data">

        <div id="place_title">
            <label for="title">Title</label>
            <input type="text" name="title" value="<?= $place["title"] ?>" placeholder="Enter Title" required>
        </div>

        <section id="location">

            <div class="form_country">
                <label for="country">Country</label>
                <div id="country"><?= $place["country_name"] ?></div>
            </div>

            <div class="form_city">
                <label for="city">City</label>
                <div id="city"><?= $place["city_name"] ?></div>
            </div>

            <div class="address">
                <label for="address">Address</label>
                <div id="address"><?= $place["place_address"] ?></div>
            </div>

        </section>

        <section id="numbers">
            <div class="num_guests">
                <label for="num_guests">Max. Guests</label>
                <div id="num_guests_input">
                    <span class="button" onclick="update_guests(event, -1)">-</span>
                    <input readonly type="number" value="<?= $place["num_guests"] ?>" min="1" max="10" step="1" name="num_guests" required>
                    <span class="button" onclick="update_guests(event, +1)">+</span>
                </div>
            </div>

            <div id="price">
                <label for="price">Price per Night</label>
                <div class="price_input">
                    <input type="number" value="<?= $place['price'] ?>" min="0" name="price" required>
                    <i class="material-icons">euro</i>
                </div>
            </div>

        </section>

        <hr>

        <article id="body">

            <div id="upload">
        
                <section id="place_gallery">
                    <div id="image_container">
                        <?php foreach ($image_gallery as $image) { ?>
                            <img class="image_slide" src="../images/places/thumbs_medium/<?= $image["img_name"] ?>" width="550" height="400" alt="Image Place">
                            <img class="fullscreen_slide" src="../images/places/originals/<?= $image['img_name'] ?>" alt="Image Place">
                        <?php }
                            if (sizeof($image_gallery) > 1) {  ?>
                            <button class="display_left" onclick="plusDivs(-1)">&#10094;</button>
                            <button class="display_right" onclick="plusDivs(+1)">&#10095;</button>
                        <?php } ?>

                        <button class="full_screen" onclick="toggle_image_fullscreen()">
                            <i class="material-icons">fullscreen</i>
                        </button>
                    </div>
                </section>

                <span class="button upload_button">
                        Upload Photo
                        <input type="file" name="image">
                    </span>
            </div>

            <section id="details">
                <div id="description">
                    <label for="description">Description</label>
                    <textarea name="description" rows="4" cols="50" placeholder="Enter Place Description" required><?= $place["place_description"] ?></textarea>
                </div>

                <hr>

                <section id="tags_section">
                    <?php $tags = get_tags(); ?>
                    <label for="tags">Tags</label>
                    <div id="tags">
                        <?php foreach ($tags as $tag) { ?>
                            <div class="tag">
                                <div class="tag_name"><?= $tag["tag_name"] ?></div>
                                <div class="checkbox_container">
                                    <input type="checkbox" name="tags[]" value="<?= $tag["id"] ?>" oninput="toggle_checkbox(event)" <?= in_array($tag, $place_tags) ? "checked" : null ?>>
                                    <i class="material-icons">check</i>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </section>
            </section>
        </article>


        <input type="hidden" name="owner" value="<?= $user_id ?>">
        <input type="hidden" name="id" value="<?= $place_id ?>">

        <button class="submit_button" type="submit">Save Changes</button>
    </form>

<?php }

/**
 * 
 */
function draw_place_comments($place_id, $place_owner_id)
{
    $comments = get_place_comments($place_id);
    $place_owner = get_user_info($place_owner_id);

    if ($comments == null) { ?>
    <h3>No comments to display</h3>
    <?php } else { 
    
        foreach ($comments as $comment) { ?>
            <article class="comment"> 
                <?php draw_comment($comment, $place_owner_id, $place_owner); ?>
            </article>
            <hr>
        <?php }
    }
}

/**
 * 
 */
function draw_comment($comment, $place_owner_id, $place_owner) 
{ 
    ?>

    <div class="comment_header">

        <?php draw_user_tile($comment["usr_id"]); ?>

        <div class="comment_date">
            <?= $comment['usr_comment_date'] ?>
        </div>

    </div>

    <div class="comment_body">
        <p><?= $comment['usr_comment'] ?></p>
    </div>

    <div class="comment_reply">

        <?php if ($comment["owner_reply"] == NULL) { 

            if (isset($_SESSION["user_email"]) && $place_owner["email"] == $_SESSION["user_email"]) { ?>
            <button class="reply" onclick="open_reply_box(event)">Reply</button>
            <?php draw_reply_box($comment);
            }

        } else { ?>
            <article class="comment">
                <?php draw_owner_reply($comment, $place_owner_id); ?>
            </article>
        <?php } ?>

    </div>

<?php }

/**
 * 
 */
function draw_owner_reply($comment, $place_owner) 
{ ?>

    <div class="comment_header">
        <?php draw_user_tile($place_owner); ?>

        <div class="comment_date">
            <?= $comment['owner_reply_date'] ?>
        </div>
    </div>

    <div class="comment_body">
        <p><?= $comment['owner_reply'] ?></p>
    </div>
    
<?php }

/**
 * 
 */
function draw_user_tile($user_id) 
{   
    $user = get_user_info($user_id); ?>

    <div class="user_profile_tile">
        <a class="button" href="../pages/profile.php?id=<?= $user_id ?>">
            <img src="../images/profiles/thumbs_small/<?= $user["profile_pic"] ?>" alt="User Profile Picture">
            <span class="username"><?= $user["first_name"] ?> <?= $user["last_name"] ?></span>
        </a>
    </div>

<?php }

/**
 * 
 */
function draw_reply_box($comment) { 

    $reservation_id = $comment["reservation_id"]; ?>

    <div class="reply_box" id="<?=$reservation_id?>">
        <textarea name="reply" placeholder="Enter a reply comment" rows="3" required></textarea>
        
        <button class="submit_button" onclick="upload_reply(event, <?=$reservation_id?>)">Reply</button>
    </div>
    
<?php }
/**
 * 
 */
function draw_reservations_made($place_id){
    $reservations = get_owner_place_reservations($place_id);
    if($reservations == null ){?>
        No reservations made
    <?php }else{
        foreach($reservations as $reservation){?>
            <div class="reservation_tile">
                <div id="tourist">
                    <?php draw_user_tile($reservation["usr_id"]); ?>
                </div>
                <div id="reservation_tile_info">
                   <span>Reserved Between:</span>  <?= $reservation['check_in'] ?> - <?= $reservation['check_out'] ?> 
                   <br>
                    <?= $reservation['num_guests'] ?> Guests - <?= $reservation['price'] ?> €
                </div>
            </div>
        <?php }
    }
}




                 
    