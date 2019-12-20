"use strict"

// Get target elements
let site_container = document.getElementById("site_container")

// Add event listeners
site_container.onclick = stop_notifications

// Event listeners

/**
 * 
 * @param {*} event 
 */
function stop_notifications(event) {
    event.stopPropagation()
    
    let options = document.getElementById("search_suggestions")
    let notifications = document.getElementById("notifications_box")
    let menu = document.getElementsByClassName("user_menu_option")

    //search suggestions 
    if(typeof options != 'undefined'){
        if(event.target.id != "result_suggestions" && event.target.id != "search_input" ) {
            options.innerHTML=""
        }
    }
        
    //notifications
    if(notifications != null){
        if(notifications.style.display == "flex"){
            if(event.target != notifications) {
                notifications.style.display = "none";
            }
            if(event.target.className == "material-icons"){
                notifications.style.display = "flex";
            }
        }
        
    }
    
    //menu
    if(typeof menu[0] != 'undefined'){
        if(menu[0].style.display == "block" && menu[1].style.display == "block" && menu[2].style.display == "block"){
            if(event.target != document.getElementById("user_menu")) {
                menu[0].style.display = "none" 
                menu[1].style.display = "none" 
                menu[2].style.display = "none"
            }
            
            if(event.target.id == "username_tile" || event.target.id == "username" || event.target.id == ""){
                menu[0].style.display = "block" 
                menu[1].style.display = "block" 
                menu[2].style.display = "block"
            }
            
        }
    }

  }