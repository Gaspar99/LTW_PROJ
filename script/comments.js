"use strict"

let open_reply_box = document.getElementById("reply_box")
/** reviews  */
/**
 * 
 */
function upload_comment(id) {
    let comment = document.getElementById("comment_holder" + id).value
    let rating = document.getElementById("rating_holder" + id).value
    console.log(comment)
    console.log(rating)
    if (comment == "" || rating == "") {
        alert('All sections must be filled')
        return
    }

    let request = new XMLHttpRequest()

    request.addEventListener("update", function () {
        alert('Comment submitted')
    })
    request.addEventListener("error", function () {
        alert('Failed to upload comment')
    })

    request.open("post", "../ajax/make_review.php", true)
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    request.send(encodeForAjax({ id: id, comment: comment, rating: rating }))
}

/**
 * 
 * @param {*} event 
 */
if(open_reply_box != null){
    open_reply_box.onclick = function(event) {

        //Hiding reply button
        let reply_button = event.target
        reply_button.style.display = "none"
    
        // Displaying reply box
        let reply_box = reply_button.nextElementSibling
    
        reply_box.style.display = "block"
    }
}

/**
 * @param event
 * @param id 
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
