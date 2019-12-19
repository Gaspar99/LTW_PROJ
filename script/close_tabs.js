"use strict"

document.getElementById("site_container").onclick = function(e) {
    e.stopPropagation()
    
    let options = document.getElementById("search_suggestions")
    let notifications = document.getElementById("notifications_box")
    let menu = document.getElementsByClassName("user_menu_option")
    //search suggestions 
    if(typeof options != 'undefined'){
        if(e.target.id != "result_suggestions" && e.target.id != "search_input" ) {
            options.innerHTML=""
            //document.getElementById("search_input").value=""   
        }
    }
        
    //notifications
    if(notifications != null){
        if(notifications.style.display == "flex"){
            if(e.target != notifications) {
                notifications.style.display = "none";
            }
            if(e.target.className == "material-icons"){
                notifications.style.display = "flex";
            }
        }
        
    }
    //menu
    if(typeof menu[0] != 'undefined'){
        if(menu[0].style.display == "block" && menu[1].style.display == "block" && menu[2].style.display == "block"){
            if(e.target != document.getElementById("user_menu")) {
                menu[0].style.display = "none" 
                menu[1].style.display = "none" 
                menu[2].style.display = "none"
            }
            if(e.target.id == "username_tile" || e.target.id == "username" || e.target.id == ""){
                menu[0].style.display = "block" 
                menu[1].style.display = "block" 
                menu[2].style.display = "block"
            }
            
        }
    }

  }