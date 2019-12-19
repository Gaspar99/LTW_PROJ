<?php 
include_once("../database/db_places.php");
include_once("../database/db_comments.php");
include_once("../database/db_user.php");

/**
 * 
 */
function draw_place_comments($place_id, $place_owner_id)
{
    $comments = get_place_comments($place_id);
    $place_owner = get_user_info($place_owner_id);

    if ($comments == null) { ?>
    <h3>No comments to display</h3>
    <?php } else { 
    
        foreach ($comments as $comment) { ?>
            <article class="comment"> 
                <?php draw_comment($comment, $place_owner_id, $place_owner); ?>
            </article>
            <hr>
        <?php }
    }
}

/**
 * 
 */
function draw_comment($comment, $place_owner_id, $place_owner) 
{ 
    ?>

    <div class="comment_header">

        <?php draw_user_tile($comment["usr_id"]); ?>

        <div class="comment_date">
            <?= $comment['usr_comment_date'] ?>
        </div>

    </div>

    <div class="comment_body">
        <p><?= $comment['usr_comment'] ?></p>
    </div>

    <div class="comment_reply">

        <?php if ($comment["owner_reply"] == NULL) { 

            if (isset($_SESSION["user_email"]) && $place_owner["email"] == $_SESSION["user_email"]) { ?>
            <button class="reply" id="reply_box">Reply</button>
            <?php draw_reply_box($comment);
            }

        } else { ?>
            <article class="comment">
                <?php draw_owner_reply($comment, $place_owner_id); ?>
            </article>
        <?php } ?>

    </div>

<?php }

/**
 * 
 */
function draw_owner_reply($comment, $place_owner) 
{ ?>

    <div class="comment_header">
        <?php draw_user_tile($place_owner); ?>

        <div class="comment_date">
            <?= $comment['owner_reply_date'] ?>
        </div>
    </div>

    <div class="comment_body">
        <p><?= $comment['owner_reply'] ?></p>
    </div>
    
<?php }

/**
 * 
 */
function draw_reply_box($comment) { 

    $reservation_id = $comment["reservation_id"]; ?>

    <div class="reply_box" id="<?=$reservation_id?>">
        <textarea name="reply" placeholder="Enter a reply comment" rows="3" required></textarea>
        
        <button class="submit_button" onclick="upload_reply(event, <?=$reservation_id?>)">Reply</button>
    </div>
    
<?php }
