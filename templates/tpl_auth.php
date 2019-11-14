<?php 
  /**
  * Draws the sign in modal form.
  */ 
  function draw_signIn() {  ?>

    <div id="signInForm" class="modal">
<<<<<<< HEAD
      <form class="modal-content animate" action="../actions/action_signin.php" method="post">
=======
      <form class="modal-content animate" action="/action_page.php" method="post">
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a
        <div class="imgContainer">
          <span class="close" onclick="closeSignInForm()" title="Close Form">&times;</span>
          <a href="../pages/home.php"><img class="page_logo" src="../images/logo.png" alt="Web site Logo"></a>
        </div>
        <div class="container">
          <label for="email">Email</label>
<<<<<<< HEAD
          <input type="text" placeholder="Enter Email" name="email" required>

          <label for="password">Password</b></label>
          <input type="password" placeholder="Enter Password" name="password" required>
=======
          <input type="text" placeholder="Enter Email" name="emal" required>

          <label for="psw">Password</b></label>
          <input type="password" placeholder="Enter Password" name="psw" required>
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a

          <button type="submit">Sign In</button>
        </div>
      </form>
    </div>
      
<?php } ?>


<?php 
  /**
  * Draws the sign up modal form.
  */ 
  function draw_signUp() {  ?>

    <div id="signUpForm" class="modal">
<<<<<<< HEAD
      <form class="modal-content animate" action="../actions/action_signup.php" method="post">
=======
      <form class="modal-content animate" action="/action_page.php" method="post">
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a
        <div class="imgContainer">
          <button class="close" onclick="closeSignUpForm()" title="Close Form">&times;</button>
          <a href="../pages/home.php"><img class="page_logo" src="../images/logo.png" alt="Web site Logo"></a>
        </div>
        <div class="container">
          <label for="first_name">First Name</label>
          <input type="text" placeholder="Enter First Name" name="first_name" required>

          <label for="last_name">Last Name</label>
          <input type="text" placeholder="Enter Last Name" name="last_name" required>

          <label for="email">Email</label>
<<<<<<< HEAD
          <input type="text" placeholder="Enter Email" name="email" required>

          <label for="password">Password</label>
          <input type="password" placeholder="Enter Password" name="password" required>

          <label for="phone_num">Phone Number</label>
          <input type="text" placeholder="Enter Phone Number" name="phone_num">

          <!--<label for="country">Country</label>
          <select class="country_selection"><?php //draw_countryOptions() ?></select>-->
=======
          <input type="text" placeholder="Enter Email" name="emal" required>

          <label for="psw">Password</label>
          <input type="password" placeholder="Enter Password" name="psw" required>

          <label for="phone_num">Phone Number</label>
          <input type="text" placeholder="Enter Phone Number" name="phone_num">
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a
          
          <button type="submit">Create Account</button>
        </div>
      </form>
    </div>
      
<?php } ?>


    

