<?php 

/**
 * 
 */
function draw_chat($id){?>
    <link rel="stylesheet" href="../css/style_chat.css">
    <article class="my_messages">
    <?php 
    draw_users_to_message($id);
    draw_chat_box($id); 
    ?>

    </article>
<?php } 

/**
 * 
 */
function draw_chat_box($id){?>
    <div class="chat_box">
        <div id=traded_messages>
            //todo
        </div>
        <script src="../script/send_message.js" defer></script>
        <input id="message_input" type="text" placeholder="Write a message..." value="">
    </div>
<?php }

/**
 * 
 */
function draw_users_to_message($id){?>
    <div class="users_to_message">
       <div class="users_messages">
           //todo
       </div>
    </div>
<?php }



