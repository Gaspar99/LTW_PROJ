<?php 
  /**
  * Draws the sign in modal form.
  */ 
  function draw_signIn() {  ?>

    <div id="signInForm" class="modal">
      <form class="modal-content animate" action="/action_page.php" method="post">
        <div class="imgContainer">
          <span class="close" onclick="closeSignInForm()" title="Close Form">&times;</span>
          <a href="../pages/home.php"><img class="page_logo" src="../images/logo.png" alt="Web site Logo"></a>
        </div>
        <div class="container">
          <label for="email">Email</label>
          <input type="text" placeholder="Enter Email" name="emal" required>

          <label for="psw">Password</b></label>
          <input type="password" placeholder="Enter Password" name="psw" required>

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
      <form class="modal-content animate" action="/action_page.php" method="post">
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
          <input type="text" placeholder="Enter Email" name="emal" required>

          <label for="psw">Password</label>
          <input type="password" placeholder="Enter Password" name="psw" required>

          <label for="phone_num">Phone Number</label>
          <input type="text" placeholder="Enter Phone Number" name="phone_num">
          
          <button type="submit">Create Account</button>
        </div>
      </form>
    </div>
      
<?php } ?>


    

