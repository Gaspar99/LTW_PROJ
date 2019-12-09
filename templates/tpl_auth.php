<?php

/**
 * Draws the sign in modal form.
 */
function draw_sign_in()
{  ?>

  <div id="sign_in_form" class="modal">
    <form class="modal_content animate" action="../actions/action_signin.php" method="post">

      <div class="img_container">
        <span class="close" onclick="close_sign_in_form()" title="Close Form">&times;</span>
        <a href="../pages/home.php"><img class="site_logo" src="../images/site/logo.jpeg" alt="Web site Logo"></a>
      </div>

      <div class="container">
        <label for="email">Email</label>
        <input type="text" placeholder="Enter Email" name="email" pattern= "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>

        <label for="password">Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <button class="submit_button" type="submit">Sign In</button>
      </div>
    </form>
  </div>

<?php } 


/**
 * Draws the sign up modal form.
 */
function draw_sign_up($countries)
{  ?>

  <div id="sign_up_form" class="modal">
    <form class="modal_content animate" action="../actions/action_signup.php" method="post">
      <div class="img_container">
        <span class="close" onclick="close_sign_up_form()" title="Close Form">&times;</span>
        <a href="../pages/home.php"><img class="site_logo" src="../images/site/logo.jpeg" alt="Web site Logo"></a>
      </div>
      <div class="container">
        <label for="first_name">First Name</label>
        <input type="text" placeholder="Enter First Name" name="first_name" required>

        <label for="last_name">Last Name</label>
        <input type="text" placeholder="Enter Last Name" name="last_name" required>

        <label for="email">Email</label>
        <input type="email" placeholder="Enter Email" name="email" pattern= "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>

        <label for="password">Password</label>
        <input type="password" placeholder="Enter Password" name="password" 
          pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" 
          title="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" required>

        <label for="phone_num">Phone Number</label>
        <input type="text" placeholder="Enter Phone Number" name="phone_num" 
        pattern="(9([0-9]{8}))"  title="Phone Number should start with a 9 have 9 character length" required>

        <label for="country_id">Country</label>
        <select name="country_id" class="country_selection" required><?=draw_country_options($countries)?></select>

        <button class="submit_button" type="submit">Create Account</button>
      </div>
    </form>
  </div>

<?php } 


/**
 * 
 */
function draw_dropdrown($user_email)
{
  $id = get_user_id($user_email); ?>

  <div id="user_dropdown_menu" class="dropdown_menu">
    <a href="../pages/profile.php?id=<?= $id ?>">My Profile</a>
    <a href="../pages/add_place.php">Add Place</a>
    <a href="../actions/action_logout.php">Logout</a>
  </div>

<?php } ?>