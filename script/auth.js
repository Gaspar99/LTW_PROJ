"use strict"

// Get target elements
let sign_in_form_button = document.getElementById("sign_in_form_button")
let close_sign_in_form_button = document.getElementById("close_sign_in_form") 
let sign_up_form_button = document.getElementById("sign_up_form_button")
let close_sign_up_form_button = document.getElementById("close_sign_up_form")

// Add event listeners
sign_in_form_button.onclick = open_sign_in_form
close_sign_in_form_button.onclick = close_sign_in_form
sign_up_form_button.onclick = open_sign_up_form
close_sign_up_form_button.onclick = close_sign_up_form

// Event listeners

/**
 *  Opens sign in form
 */
function open_sign_in_form()
{
    let form = document.getElementById("sign_in_form")
    form.style.display = "block"
}

/**
 * Closes sign in form
 */
function close_sign_in_form()
{
    let form = document.getElementById("sign_in_form")
    form.style.display = "none"
}

/**
 * Opens sign up form
 */
function open_sign_up_form()
{
    let form = document.getElementById("sign_up_form")
    form.style.display = "block"
}

/**
 * Closes sign up form 
 */
function close_sign_up_form()
{
    let form = document.getElementById("sign_up_form")
    form.style.display = "none"
}