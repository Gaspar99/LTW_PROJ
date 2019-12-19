"use strict"
/*
window.onload = function(e){
    let search_suggestions = document.getElementById("search_suggestions");
    let search_input = document.getElementById("search_input");
    //let notifications_box = document.getElementById("notifications_box");
   //let material_icons = this.document.getElementsByClassName("material_icons")
    //let user_menu = document.getElementById("user_menu");
    this.console.log(e.target.id);
    document.onclick = function(e){
       if(e.target.id !== "search_input" || e.target.id !== "search_suggestions" || e.target.id != "notifications_box" || e.target.id  != "user_menu"|| e.target.id != 27){
          //search_suggestions.style.display = "none";
          search_suggestions.style.display = "none";
          //user_menu.style.display = "none";
       }
    }
 }
*/
document.getElementById("site_container").onclick = function(e) {
    e.stopPropagation()
    
    //notifications
    if(document.getElementById("notifications_box").style.display == "flex"){
        if(e.target != document.getElementById("notifications_box")) {
            document.getElementById("notifications_box").style.display = "none";
        }
        if(e.target.className == "material-icons"){
            document.getElementById("notifications_box").style.display = "flex";
        }
    }
    
    //menu
    let menu = document.getElementsByClassName("user_menu_option")
    console.log(e.target.id);
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
    let options = document.getElementById("search_suggestions")
    //search suggestions 
        if(e.target.id != "result_suggestions" && e.target.id != "search_input" ) {
            options.innerHTML=""
            document.getElementById("search_input").value=""   
        }
      

    //search

  }