"use strict"

// Get target elements
let edit_profile_submit_button = document.getElementById("edit_profile_submit_button")
let submit_sign_up = document.getElementById("submit_sign_up")

// Add event listeners
if (edit_profile_submit_button != null)
    edit_profile_submit_button.onclick = check_passwords

if (submit_sign_up != null) 
    submit_sign_up.onclick = check_equal_passwords

// Event listeners

/**
 * Script to check if password are equal when changing it on editing profile
 */
function check_passwords() {
    let input_pass = document.getElementById("password")
    let confirm = document.getElementById("confirm_password")

    if (input_pass.value.length != "") {
        confirm.required = true
    } else confirm.required = false

    return (input_pass.value == confirm.value) ? true : draw_error_message()
}


/**
 * Sign up password confirmation script
 */
function check_equal_passwords() {
    let input_pass = document.getElementById("password")
    let confirm = document.getElementById("confirm_password")

    return (input_pass.value == confirm.value) ? true : draw_error_message()
}

/**
 * Draws an error message informing the user that both passwords need to match
 */
function draw_error_message() {

    let section = document.createElement("section")
    section.id = "messages"

    let message = document.createElement("div")
    message.className = "error"
    message.innerHTML = "Passwords don\'t match!"

    section.appendChild(message)

    document.body.appendChild(section)
}
