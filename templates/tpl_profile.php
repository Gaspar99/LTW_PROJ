<?php 
    /**
    * 
    */
    function draw_profile() {
        #get user info 
        $user_info = getUserInfo($_GET['id']);?>
        <h1 id="profile_page"> My Profile </h1>
        <section id = "usr_profile">
            <section id="usr_bio">
                <h2><?=$user_info['first_name']?> <?=$user_info['last_name']?></h2>    
                <img id="profile_pic" src="../images/profiles/<?=$user_info['profile_pic']?>" alt="Profile_pic"/>
                <h3><?=$user_info['phone_number']?></h3>
                <h4><?=$user_info['email']?></h4>
            </section>
            <a class= "button" id="profile_button" href="../pages/add_place.php"> Add Place</a> <br>
            <a class= "button" id="profile_button" href="../pages/edit_profile.php?id=<?=$_GET['id']?>">Edit Profile</a>
        </section>

        <section id="usr_places" class = "places"> <!-- can use ids for each place if needed-->
            <div id="rental"> 
            <label for="rental"> My Places</label>
			<?php
                $usr_places = getUserPlaces($_GET['id']); #get places user places id 
				foreach($usr_places as $usr_place){
					draw_place($usr_place); 
				}		
            ?>
            </div>
            <div id="rented"> 
            <label for="rented"> History</label>
                <!-- Database must be populated -->
               
                TODO:Populate DB and get porperty history
            </div>
        </section> 

    <?php }

    /**
    * 
    */
    function draw_profile_edit() {
    $user_info = getUserInfo($_GET['id']);?>

    <form class="todo" action="../actions/action_profile_update.php" method="post">
        <section class= "profile_pic">
            <img src="../images/profiles/<?=$user_info['profile_pic']?>" alt="Profile_pic"/>
            <input type="image" src="../profiles/default.png" alt="Change"> <!--check this later idk-->
        </section>
        <section class= "profile_info">

            <label for="first_name">First Name:</label>
            <input type="text" name="first_name" value="<?=$user_info['first_name']?>"><br>

            <label for="last_name">Last Name:</label>
            <input type="text" name="last_name" value="<?=$user_info['last_name']?>"><br>

            <label for="phone_number">Phone Number:</label>
            <input type="text" name="phone_number" value="<?=$user_info['phone_number']?>" ><br>

            <label for="email">Email</label>
            <input type="email" name="email" value="<?=$user_info['email']?>"><br>

            <label for="password">Password:</b></label>
            <input type="password" name="password" value="<?=$user_info['password']?>"><br>

            <input type="hidden" name="id" value="<?=$_GET['id']?>"> 

            <button class="submit-button" type="submit">Save</button>
        </section>
    </form>
<?php } ?> 
