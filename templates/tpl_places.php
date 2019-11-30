<?php
    #include_once('../database/db_places.php'); #idk if i need this
    /**
    * 
    */
    function draw_places($places) { ?>

        <section class="places">
        <?php foreach ($places as $place) {
            draw_place($place);
        }
        ?>
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

        $place = get_place($place_id);
        $image_gallery = get_place_gallery($place_id); #TODO check if the rly works ?>

        <article class="place_info"> 
            <section class="left_side"> 

                <?php if ($place['availability']) { ?> 
                    <div class="availability" id="available">
                        Available
                    </div> 
                <?php } else { ?>
                    <div class="availability" id="not_available">
                        Not Available
                    </div>
                <?php } ?>

                <div class="owner_profile">
                    TODO: inserir aqui um phpzito para ir sacar o owner
                </div>

                <div class="image_gallery">
                    <?php foreach($image_gallery as $image) { ?>
                        <img class= "imgGallery" src="../images/places/<?=$image?>" alt="Image Place">
                    <?php } ?>
                <!-- ver isto melhor https://www.w3schools.com/w3css/w3css_slideshow.asp-->
                    <button class="w3-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
                    <button class="w3-button w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
                </div>
                
                <div class="num_people">
                    <?php for($i = 1; $i<= $place['num_people']; $i++){ #pq n da? so estupido...?>
                        <img id="num_people_icon" src="../images/site/num_people.png" alt="icon" >
                    <?php } ?>
                </div>
                <h4>Rating: <?=$place['rating']?></h4>
                <h3>Price: <?=$place['price']?></h3>
            </section>
            <!-- right side do it after-->
            <section class="right_side"> 
                <h1> <?=$place['title']?></h1>
                <h2> <?=$place['description']?></h2>
                <!-- <table class="place_tags">TODO </table>-->
                <div class= "adress">
                    <h3><?=$place['country_name']?> </h3>
                    <h3><?=$place['city_name']?> </h4>
                    <h4> <?=$place['adress']?></h4>
                </div>
                <div class="buy_section">
                    TODO: Buy section <!--Should this be smth else?-->
                </div>
             </section>
        </article>

    <?php } 


    function draw_add_place(){?>
        <form class="add_form" action="../actions/action_add_place.php" method="post">
            <div id= "description">

                <label for="title">Title</label>
                <input type="text" name="title"  placeholder="Enter Title" required><br>

                <label for="description">Description</label>
                <textarea name="description" rows="4" cols="50" placeholder="Enter Place Description" required> </textarea><br>

                <div id= "tags">
                    <?php $tags = get_place_tags();?>
                    <label for="tags">Tags</label>
                    <select name="tags" id="tags" multiple> 
                        <?php foreach($tags as $tag){?>
                            <option value="<?=$tag['tag_name']?>"><?=$tag['tag_name']?></option>
                       <?php }?>
                    </select>
                </div>

            </div>
            <div id= "adress">
                <!-- country -->
                TODO: country <br>
                TODO: city <br>
                <!-- city --> 
                <label for="adress">Adress</label>
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