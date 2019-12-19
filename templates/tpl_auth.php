<?php

/**
 * Draws the sign in modal form.
 */
function draw_sign_in()
{  ?>

  <div id="sign_in_form" class="modal">
    <form class="modal_content scale_animate" action="../actions/action_signin.php" method="post">

      <div class="img_container">
        <span class="close" id="close_sign_in_form" title="Close Form">&times;</span>
        <a href="../pages/home.php"><img class="site_logo" src="../images/site/logo.jpeg" alt="Web site Logo"></a>
      </div>

      <div class="form_container">
        <div class="grid_email">
          <label for="email">Email</label>
          <input type="text" placeholder="Enter Email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required>
        </div>

        <div class="password">
          <label for="password">Password</b></label>
          <input type="password" placeholder="Enter Password" name="password" patthern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" required>
        </div>
      </div>

      <button class="submit_button" type="submit">Sign In</button>

    </form>
  </div>

<?php }


/**
 * Draws the sign up modal form.
 */
function draw_sign_up($countries)
{  ?>

  <div id="sign_up_form" class="modal">
    <form class="modal_content scale_animate" action="../actions/action_signup.php" method="post">
      <div class="img_container">
        <span class="close" id="close_sign_up_form" title="Close Form">&times;</span>
        <a href="../pages/home.php"><img class="site_logo" src="../images/site/logo.jpeg" alt="Web site Logo"></a>
      </div>
      <div class="form_container">
        <div class="first_name">
          <label for="first_name">First Name</label>
          <input type="text" placeholder="Enter First Name" name="first_name" pattern="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$" required>
        </div>

        <div class="last_name">
          <label for="last_name">Last Name</label>
          <input type="text" placeholder="Enter Last Name" name="last_name" pattern="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$" required>
        </div>

        <div class="email">
          <label for="email">Email</label>
          <input type="email" placeholder="Enter Email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
        </div>

        <div class="password">
          <label for="password">Password</label>
          <input id="password" type="password" placeholder="Enter Password" name="password" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" title="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" required>
        </div>

        <div class="confirm_password">
          <label for="confirm_password">Confirm Password</label>
          <input id="confirm_password" type="password" placeholder="Repeat Password" name="confirm_password" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" title="Password needs to be 8 characters length and have at least 1 number - 1 special character - 1 capital letter" required>
        </div>

        <div class="phone_num">
          <label for="phone_num">Phone Number</label>
          <input type="text" placeholder="Enter Phone Number" name="phone_num" pattern="^(9([0-9]{8}))$" title="Phone Number should start with a 9 have 9 character length" required>
        </div>

        <div class="country_id">
          <label for="country_id">Country</label>
          <select name="country_id" class="country_selection" required><?= draw_country_options($countries) ?></select>
        </div>
      </div>
     
      <button class="submit_button" type="submit">Create Account</button>
  
    </form>
  </div>

<?php }
