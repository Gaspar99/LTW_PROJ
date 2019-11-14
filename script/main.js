'use strict'

function openSignInForm() {
    let form = document.getElementById('signInForm');
    form.style.display='block';
}

function closeSignInForm() {
    let form = document.getElementById('signInForm');
    form.style.display='none';
}

function openSignUpForm() {
    let form = document.getElementById('signUpForm');
    form.style.display='block';
}

function closeSignUpForm() {
    let form = document.getElementById('signUpForm');
    form.style.display='none';
}

<<<<<<< HEAD
var signInForm = document.getElementById('signInForm');
    var signUpForm = document.getElementById('signUpForm');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {


    if (event.target == signInForm) 
        signInForm.style.display = "none";
    else if (event.target == signUpForm)
        signUpForm.style.display = "none";
=======
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    var signInForm = document.getElementById('signInForm');
    var signUpForm = document.getElementById('signUpForm');

    if (event.target == signInForm || event.target == signUpForm) {
        modal.style.display = "none";
    }
>>>>>>> 77344190c7aa338ff6fe71abc8106b8f7d886b0a
}