<?php
    #include_once('../database/db_places.php'); #idk if i need this
    /**
    * 
    */
    function draw_places($places) { ?>

        <section class="places">
        <?php 
        if (sizeof($places)) {
            foreach ($places as $place) 
                draw_place($place);
        } else { ?>
            <h2 id="no_place">No places found</h2>
        <?php } ?>
        </section>

    <?php } ?> 

    <?php 
    /**
    * 
    */ 
    function draw_place($place) { ?>

        <article class="place">
            <a href="../pages/place.php?id=<?=$place['place_id']?>"> <!--TODO insert the get coise here-->
                <h2 class="place-city-country"><?=$place['city']?> - <?=$place['country']?></h2>
                <img class="place-image"  src="../images/places/<?=$place['image_name']?>" alt="Place Image" />
                <h1 class="place-title"><?=$place['title']?></h1>
                <ul class="place-footer">
                    <li class="place-rating">
                        <i class="material-icons">star</i>
                        <div class="rating-value"><?=$place['rating']?></div>
                    </li>
                    <li class="place-price">
                        <div class="price-value"><?=$place['price_per_night']?></div>
                        <i class="material-icons">euro</i>
                    </li>
                    <li class="place-num-people">
                        <i class="material-icons">people</i>
                        <div class="num-people-value"><?=$place['num_people']?></div>
                    </li>
                </ul>
            </a>
        </article>

    <?php } ?>

    <?php
    /**
    * 
    */    
    function draw_place_info($place_id) {

        $place = get_place_info($place_id);
        $owner = getUserInfo($place['place_owner']);
        $image_gallery = get_place_gallery($place_id); #TODO check if the rly works ?>

        <article id="place_page">

            <div id="place_header">
                <h1 id="place_title"><?=$place['title']?></h1>

                <?php if (isset($_SESSION['user_email']) && $owner['email'] == $_SESSION['user_email']) { ?>
                <a class="button" id="edit_place" href="../pages/home.php">
                    Edit Place
                </a>
                <?php } else { ?>
                <div id="owner_profile">
                    <a class="button" href="../pages/usr_profile.php?id=<?=$place['place_owner']?>">
                        <img src="../images/profiles/originals/<?=$owner['profile_pic']?>" alt="User Profile Picture">
                        <div id="username"><?=$owner['first_name']?> <?=$owner['last_name']?></div>
                    </a>
                </div>
                <?php } ?>
            </div>

            <ul id= "location">
                <li><?=$place['country_name']?></li>
                <li><?=$place['city_name']?></li>
                <li><?=$place['place_address']?></li>
            </ul>

            <div id="place_details">
                 <div class="rating">
                    <i class="material-icons">star</i>
                    <div class="rating_value"><?=$place['rating']?></div>
                </div>

                <li id="num_people">
                    <i class="material-icons">people</i>
                    <div class="num_people_value"><?=$place['num_people']?></div>
                </li>
            </div>

            </div>
            <hr>

            <section id="place_body"> 
                
                <section id="gallery_rent">
            
                    <section id="place_gallery">
                        <div id="image_container">
                            <?php foreach($image_gallery as $image) { ?>
                                <img class="imgGallery" src="../images/places/<?=$image?>" alt="Image Place">
                            <?php } ?>
                            <!-- ver isto melhor https://www.w3schools.com/w3css/w3css_slideshow.asp-->
                            <button class="display_left" onclick="plusDivs(-1)">&#10094;</button>
                            <button class="display_right" onclick="plusDivs(+1)">&#10095;</button>
                        </div>
                    </section>
                
                    <section id="rent_section">

                        <div id="price_per_night">
                            <div><?=$place['price']?></div>
                            <i class="material-icons">euro</i> 
                        </div>

                        <?php if(isset($_SESSION['user_email'])) { ?>
                        <form id="rent_form" action="../actions/action_rent_place.php" method="post">

                            <div class="form-date">
                                <label for="check_in">Check In</label>
                                <input required id="check_in_value" type="date" name="check_in" oninput="calculateRentPrice(<?=$place['price']?>)">
                            </div>
                
                            <div class="form-date">
                                <label for="check_out">Check Out</label>
                                <input required id="check_out_value" type="date" name="check_out" oninput="calculateRentPrice(<?=$place['price']?>)">
                            </div>
                            
                            <div class="num_people">
                                <label for="num_people">Number of People</lable>
                                <input required id="num_people_value" type="number" name="num_people" oninput="calculateRentPrice(<?=$place['price']?>)" min="1" max="<?=$place['num_people']?>">
                            </div>

                            <input type="hidden" name="tourist" value="<?=getUserId($_SESSION['user_email'])?>">
                            <input type="hidden" name="place_id" value="<?=$place_id?>">

                            <button class="submit-button" type="submit">Rent Place</button>
                        </form>
                        <?php } else { ?>
                        <h2>Log In To Rent This Place</h2>
                        <?php } ?>
                    </section>

                </section>

                <div class="vertical-rule"></div>
                                
                <section id="place_info">

                    <section id="description">
                        <p><?=$place['place_description']?></p>
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


    function draw_add_place() { ?>

        <form class="add_place_form" action="../actions/action_add_place.php" method="post">

            <div id= "description">

                <label for="title">Title</label>
                <input type="text" name="title"  placeholder="Enter Title" required><br>

                <label for="description">Description</label>
                <textarea name="description" rows="4" cols="50" placeholder="Enter Place Description" required></textarea>

                <div id= "tags">
                    <?php $tags = get_place_tags(); ?>
                    <label for="tags">Tags</label>
                    <select name="tags" id="tags" multiple> 
                        <?php foreach($tags as $tag) { ?>
                            <option value="<?=$tag['tag_name']?>"><?=$tag['tag_name']?></option>
                       <?php } ?>
                    </select>
                </div>

            </div>

            <div id= "address">
                <!-- country -->
                TODO: country 
                TODO: city
                <!-- city --> 
                <label for="address">Adress</label>
                <input type="text" name="adress"  placeholder="Enter Adress" required><br>
            </div>
            <div id= "numbers">
                <label for="num_people">People Number</label>
                <input type="number" value= "1" min="1" max="10" step="1" name="num_people" required><br>
                
                <label for="price">Price</label>
                <input type="number" value= "1" min="0"step="1" name="price" required><br>
            </div>

            <div class= "upload">

            </div>
            
            <input type="hidden" name="owner_id" value="<?=$_GET['id']?>"> 

            <button class="submit-button" type="submit">Create New Place</button>
        </form>

   <?php } ?>