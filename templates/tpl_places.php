<?php
include_once("../database/db_places.php");

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
            <!--TODO insert the get coise here-->
            <h2 class="place_city_country"><?= $place["city"] ?> - <?= $place["country"] ?></h2>
            <img class="place_image" src="../images/places/thumbs_small/<?= $place["image_name"] ?>.jpeg" alt="Place Image" width="400" height="250" />
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
    ?>

    <article id="place_page">

        <div id="place_header">
            <h1 id="place_title"><?= $place["title"] ?></h1>

            <?php if (isset($_SESSION["user_email"]) && $owner["email"] == $_SESSION["user_email"]) { ?>
                <a class="button" id="edit_place" href="../pages/home.php">Edit Place</a>
            <?php } else { ?>
                <div id="owner_profile">
                    <a class="button" href="../pages/profile.php?id=<?= $place["place_owner"] ?>">
                        <img src="../images/profiles/thumbs_small/<?= $owner["profile_pic"] ?>.jpeg" alt="User Profile Picture">
                        <div id="username"><?= $owner["first_name"] ?> <?= $owner["last_name"] ?></div>
                    </a>
                </div>
            <?php } ?>
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
                            <img src="../images/places/thumbs_medium/<?= $image['img_name'] ?>.jpeg" alt="Image Place">
                        <?php } ?>
                        <!-- ver isto melhor https://www.w3schools.com/w3css/w3css_slideshow.asp-->
                        <button class="display_left" onclick="plusDivs(-1)">&#10094;</button>
                        <button class="display_right" onclick="plusDivs(+1)">&#10095;</button>
                    </div>
                </section>

                <section id="rent_section">

                    <div id="price_per_night">
                        <div><?= $place["price"] ?></div>
                        <i class="material-icons">euro</i>
                    </div>

                    <?php if (isset($_SESSION["user_email"])) { ?>
                        <form id="rent_form" action="../actions/action_rent_place.php" method="post">

                            <div class="form_date">
                                <label for="check_in">Check In</label>
                                <input required id="check_in_value" type="date" name="check_in" oninput="calculate_rent_price(<?=$place["price"] ?>)">
                            </div>

                            <div class="form_date">
                                <label for="check_out">Check Out</label>
                                <input required id="check_out_value" type="date" name="check_out" oninput="calculate_rent_price(<?= $place["price"] ?>)">
                            </div>

                            <div id="form_num_guests">
                                <label for="num_guests">Number of Guests</label>
                                <div id="num_guests_input">
                                    <span class="button" onclick="update_guests(event, -1);calculate_rent_price(<?= $place["price"] ?>);">-</span>
                                    <input readonly type="number" value="1" min="1" max="<?= $place["num_guests"] ?>" step="1" name="num_guests" required>
                                    <span class="button" onclick="update_guests(event, +1);calculate_rent_price(<?=$place["price"]?>);">+</span>
                                </div>
                            </div>

                            <input type="hidden" name="tourist" value="<?= get_user_id($_SESSION["user_email"]) ?>">
                            <input type="hidden" name="place_id" value="<?= $place_id ?>">

                            <button class="submit_button" type="submit">Rent Place</button>
                        </form>
                    <?php } else { ?>
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
                    TODO: Tags
                </div>

                <hr>

                <section id="comments">
                    <h2>Comments</h2>
                    TODO: Get comments from database
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
    $countries = get_countries() ?>

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
                    <textarea name="description" rows="4" cols="50" placeholder="Enter Place Description" required></textarea>
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
                                    <input type="checkbox" name="tag" value="<?= $tag["tag_name"] ?>" oninput="toggle_checkbox(event)">
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

<?php } ?>