"use strict"

let message_input = document.getElementById("message_input")

message_input.addEventListener("keyup", function(event){
    if (event.keyCode === 13) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        //document.getElementById("myBtn").click();
        //todo send message 

        //clear value
        message_input.value = "";
    }
})