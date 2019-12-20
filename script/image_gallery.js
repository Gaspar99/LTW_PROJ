"user strict"
//  Place Gallery - a slider to display multiple images

//GLOBALS 
let slide_index = 1
let fullscreen = false
display_image(slide_index)

// Get target elements
let toggle_image_fullscreen_button = document.getElementById("full_screen")
let previous_image_button = document.getElementById("display_left")
let next_image_button = document.getElementById("display_right")

// Add event listeners
toggle_image_fullscreen_button.onclick = toggle_image_fullscreen
if (previous_image_button != null)
    previous_image_button.onclick = previous_image

if (next_image_button != null) 
    next_image_button.onclick = next_image

// Event listeners

/**
 * Toggles the fullscreen mode of the place images
 */
function toggle_image_fullscreen() {
    fullscreen = (!fullscreen)

    let place_gallery = document.getElementById("place_gallery")
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
        image_container.style.zIndex = "20"

        fullscreen_icon.innerHTML = "fullscreen_exit"
    }
    else {
        place_gallery.style.position = "static"
        place_gallery.style.width = "auto"
        place_gallery.style.height = "auto"
        place_gallery.style.backgroundColor = "transparent"

        image_container.style.maxWidth = "max-content"
        image_container.style.maxHeight = "max-content"
        image_container.style.zIndex = "0"

        fullscreen_icon.innerHTML = "fullscreen"
    }

    display_image(slide_index)
}

/**
 * Updates the slide index so that the gallery moves to the next photo
 */
function next_image()
{
    slide_index += 1
    display_image(slide_index)
}

/**
 * Updates the slide index so that the gallery goes back to the previous photo
 */
function previous_image() 
{
    slide_index -= 1 
    display_image(slide_index)
}

/**
 * 
 * Displays the current slide image
 */
function display_image(next_image) 
{
    let images = document.getElementsByClassName("image_slide")
    let originals = document.getElementsByClassName("fullscreen_slide")

    if (next_image > images.length)
        slide_index = 1

    if (next_image < 1)
        slide_index = images.length

    for (let i = 0; i < images.length; i++) {
        images[i].style.display = "none"
        originals[i].style.display = "none"
    }

    if (images.length) {
        if (fullscreen)
            originals[slide_index - 1].style.display = "block"
        else
            images[slide_index - 1].style.display = "block"
    }
}
