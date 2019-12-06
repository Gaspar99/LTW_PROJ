<?php 
    /**
    * 
    */
    function draw_profile() {
        $user_info = getUserInfo($_GET['id']); ?>

        <article id="profile_page">

            <section id="user_info">
                <div id="user_bio">
                    <h1 id="user_first_name"><?=$user_info['first_name']?></h1> 
                    <h1 id="user_last_name"><?=$user_info['last_name']?></h1>
                    <img id="profile_pic" src="../images/profiles/<?=$user_info['profile_pic']?>" alt="Profile_pic"/>
                    <h2 id="phone_number"><?=$user_info['phone_number']?></h3>
                    <h2 id="email"><?=$user_info['email']?></h4>
                </div>

                <?php if (isset($_SESSION['user_email']) && $user_info['email'] == $_SESSION['user_email']) { ?>
                <div id="user_options">
                    <a class="button" href="../pages/add_place.php">Add Place</a>
                    <a class="button" href="../pages/edit_profile.php?id=<?=$_GET['id']?>">Edit Profile</a>
                </div>
                <?php } ?>
            </section>

            <section id="user_places"> <!-- can use ids for each place if needed-->
                <div id="for_rental"> 
                    <h3>My Places</h3>
			        <?php draw_places(getUserPlaces($_GET['id'])); #get user places id ?>
                </div>

                <div id="reservations"> 
                    <h3>My Reservations</h2>
                    <!-- Database must be populated -->
                    TODO: Populate DB and get property history
                </div>
            </section>
        </article> 

    <?php }

    /**
    * 
    */
    function draw_profile_edit() {
    $user_info = getUserInfo($_GET['id']);?>

    <form class="todo" action="../actions/action_profile_update.php" method="post">
        <section id="profile_pic_update">
            <img src="../images/profiles/<?=$user_info['profile_pic']?>" alt="Profile_pic"/>
            <input type="file" name="image" accept="image/*" alt="Upload"> <!--check this later idk-->
        </section>
        <section id= "profile_info_update">

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
