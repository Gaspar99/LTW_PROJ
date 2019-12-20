"use strict"

// Get target elements
let username_tile = document.getElementById("username_tile")

// Add event handler
username_tile.onclick = toggle_user_menu

// Event handler

/**
 * 
 */
function toggle_user_menu() 
{
    let menu = document.getElementsByClassName("user_menu_option")

    for (let i = 0; i < menu.length; i++) {
        if (menu[i].style.display == "block")
            menu[i].style.display = "none"
        else
            menu[i].style.display = "block"
    }
}