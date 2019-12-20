"use strict"

// Get target elements

let inc_buttons = document.getElementsByClassName("inc_button")
let dec_buttons = document.getElementsByClassName("dec_button")

// Add event listeners

for(let button of inc_buttons) {
    button.onclick = (event) => update_number(event, +1);
}
for(let button of dec_buttons) {
    button.onclick = (event) => update_number(event, -1);
}

/**
 * 
 * @param {*} event 
 * @param {*} number 
 */
function update_number(event, number) {
    let final_number

    if (number < 0)
        final_number = event.target.nextElementSibling
    else
        final_number = event.target.previousElementSibling

    final_number.value = +final_number.value + number

    if (+final_number.value < +final_number.min)
        final_number.value = final_number.min
    else if (+final_number.value > +final_number.max)
        final_number.value = final_number.max
}

/**
 * 
 * @param {*} event 
 */
function toggle_checkbox(event) {
    let checkbox = event.target
    let checkmark = event.target.nextElementSibling

    if (checkbox.checked) {
        checkmark.style.visibility = "visible"
    }
    else {
        checkmark.style.visibility = "hidden"
    }
}