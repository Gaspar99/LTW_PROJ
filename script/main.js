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

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    var signInForm = document.getElementById('signInForm');
    var signUpForm = document.getElementById('signUpForm');

    if (event.target == signInForm || event.target == signUpForm) {
        modal.style.display = "none";
    }
}