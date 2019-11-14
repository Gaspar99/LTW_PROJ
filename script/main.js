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

var signInForm = document.getElementById('signInForm');
    var signUpForm = document.getElementById('signUpForm');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {


    if (event.target == signInForm) 
        signInForm.style.display = "none";
    else if (event.target == signUpForm)
        signUpForm.style.display = "none";
}