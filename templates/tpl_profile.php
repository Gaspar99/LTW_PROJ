<?php

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
                <img id="profile_pic" src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>.jpeg" alt="Profile Picture" />
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
                <img src="../images/profiles/thumbs_medium/<?= $user_info["profile_pic"] ?>.jpeg" alt="Profile_pic" />
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

            <div id="password">
                <label for="password">Password</b></label>
                <input type="password" name="password" value="" 
                pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
                title ="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" >
            </div>

        </section>

        <input type="hidden" name="id" value="<?= $user_id ?>">

        <button class="submit_button" type="submit" value="Upload">Save</button>

    </form>
<?php } ?>