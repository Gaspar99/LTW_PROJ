//vars 
let toggle_image_fullscreen = document.getElementById("toggle_image_fullscreen")

//  Place Gallery - a slider to display multiple images
let slideIndex = 1
let fullscreen = false
showDivs(slideIndex)

function plusDivs(n) {
    showDivs(slideIndex += n)
}

function showDivs(n) {

    let images = document.getElementsByClassName("image_slide")
    let originals = document.getElementsByClassName("fullscreen_slide")

    if (n > images.length)
        slideIndex = 1

    if (n < 1)
        slideIndex = images.length

    for (let i = 0; i < images.length; i++) {
        images[i].style.display = "none"
        originals[i].style.display = "none"
    }

    if (images.length) {
        if (fullscreen) 
            originals[slideIndex - 1].style.display = "block"
        else
            images[slideIndex - 1].style.display = "block"
    }
}
if(toggle_image_fullscreen != null){
    toggle_image_fullscreen.onclick =  function(event){
        fullscreen = (!fullscreen)
    
        let place_gallery = document.getElementById("place_gallery")
        //let image_container = document.getElementById("image_container")
        let fullscreen_icon = place_gallery.querySelector(".material-icons")
    
        if (fullscreen) {
            place_gallery.style.position = "fixed"
            place_gallery.style.left = "0"
            place_gallery.style.top = "0"
            place_gallery.style.width = "100vw"
            place_gallery.style.height = "100vh"
            place_gallery.style.backgroundColor = "rgba(0, 0, 0, 0.4)"
            
            image_container.style.maxWidth = "80%"
            image_container.style.maxHeight = "50vw"
    
            fullscreen_icon.innerHTML = "fullscreen_exit"
        }
        else {
            place_gallery.style.position = "static"
            place_gallery.style.width = "auto"
            place_gallery.style.height = "auto"
            place_gallery.style.backgroundColor = "transparent"
    
            image_container.style.maxWidth = "max-content"
            image_container.style.maxHeight = "max-content" 
    
            fullscreen_icon.innerHTML = "fullscreen"
        }
    
        showDivs(slideIndex)
    }
}

// PRICE

let min_price = document.getElementById("min_price_input")
let max_price = document.getElementById("max_price_input")

min_price.oninput = update_price
max_price.oninput = update_price

function update_price() {
    let min_price_input = parseFloat(min_price.value)
    let max_price_input = parseFloat(max_price.value)

    let min_price_value = document.getElementById("min_price_value")
    let max_price_value = document.getElementById("max_price_value")

    min_price_value.innerHTML = "" + min_price_input + "€"
    max_price_value.innerHTML = "" + max_price_input + "€"

}

/**
 * 
 * @param {*} price_per_night 
 */
function calculate_rent_price(price_per_night) {

    let check_in = document.getElementById("check_in_value")
    let check_out = document.getElementById("check_out_value")
    let num_guests = document.querySelector("#place_page #num_guests_input input")

    //One of the inputs required was not defined yet
    if (check_in.value.length == 0 || check_out.value.length == 0 || num_guests.value.length == 0) {
        return
    }

    // Calculation of number of days
    let check_in_value = new Date(check_in.value)
    let check_out_value = new Date(check_out.value)
    let diff = Math.abs(check_out_value.getTime() - check_in_value.getTime())
    let num_days = Math.ceil(diff / (1000 * 3600 * 24))

    let final_price = num_days * price_per_night * num_guests.value

    //Add final price to rent section
    let rent_section = document.getElementById("rent_section")

    // Get price tag div inside rent section
    let price_tag = document.getElementById("price_tag")

    //Price tag does not exist yet 
    if (price_tag == null) {

        //Price tag
        price_tag = document.createElement("div")
        price_tag.id = "price_tag"

        //Price title
        let price_title = document.createElement("h3")
        price_title.id = "price_title"
        price_title.innerHTML = "Price"

        //Price value
        let price_value = document.createElement("h2")
        price_value.id = "price_value"
        price_value.innerHTML = final_price + "€"

        price_tag.appendChild(price_title)
        price_tag.appendChild(price_value)
        rent_section.appendChild(price_tag)
    } else {
        //Price was previsouly calculated. Just need to change its value
        let price_value = document.getElementById("price_value")
        price_value.innerHTML = final_price + "€"
    }
}

/**
 * 
 * @param {*} event 
 * @param {*} number 
 */
function update_guests(event, number) {
    let num_guests

    if (number < 0)
        num_guests = event.target.nextElementSibling
    else
        num_guests = event.target.previousElementSibling

    num_guests.value = +num_guests.value + number

    if (+num_guests.value < +num_guests.min)
        num_guests.value = num_guests.min
    else if (+num_guests.value > +num_guests.max)
        num_guests.value = num_guests.max
}
/**
 * 
 * @param {*} event 
 */
function toggle_checkbox(event) {
    let checkbox = event.target
    let checkmark = event.target.nextElementSibling

    console.log(checkbox.checked)
    
    if (checkbox.checked) {
        checkmark.style.visibility = "visible"
    } 
    else {
        checkmark.style.visibility = "hidden"
    }
        
}

/* TAGS */

/* tags_checkboxes = document.querySelectorAll(".tag input")

tags_checkboxes.forEach(checkbox => {
    checkbox.onclick = (event) => toggle_checkbox(event)
}); */