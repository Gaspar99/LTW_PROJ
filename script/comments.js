"use strict"

// Get target elements
let replys = document.getElementsByClassName("reply")

// Add event listeners
for (let reply of replys) {
    reply.onclick = open_reply_box
}

// Event listeners

/**
 * 
 * @param {*} event 
 */

function open_reply_box(event) {
    //Hiding reply button
    let reply_button = event.target
    reply_button.style.display = "none"

    // Displaying reply box
    let reply_box = reply_button.nextElementSibling

    reply_box.style.display = "block"
}

/**
 * 
 */
function upload_comment(id) {
    let comment = document.getElementById("comment_holder" + id).value
    let rating = document.getElementById("rating_holder" + id).value

    let request = new XMLHttpRequest()

    request.open("post", "../ajax/make_review.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id, comment: comment, rating: rating }))
}

/**
 * Uploads a new reply to the server and draws it on the right place
 */
function upload_reply(event, id) {

    let reply = event.target.previousElementSibling
    let reply_content = event.target.previousElementSibling.value

    // CLose reply box
    let reply_box = reply.parentElement
    reply_box.style.display = "none"

    let request = new XMLHttpRequest()

    request.onreadystatechange = function () {

        if (request.readyState === 4) {

            let comment_reply = reply_box.parentElement

            //Draw reply
            let new_comment = document.createElement("article")
            new_comment.className = "comment"
            new_comment.innerHTML = request.responseText

            comment_reply.appendChild(new_comment)
        }
    }

    request.open("post", "../ajax/upload_reply.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id, reply: reply_content }))
}

// Aux funtion necessary to send data to server with the post method
function encodeForAjax(data) {
    return Object.keys(data).map(function (k) {
        return encodeURIComponent(k) + '=' + encodeURIComponent(data[k])
    }).join('&')
}

