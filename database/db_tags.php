<?php


/*========================= GETS ============================== */

/**
 * Gets all the tags from a place
 */
function get_place_tags($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT
            tag.id AS id, 
            tag.tag_name AS tag_name,
            tag.tag_icon AS tag_icon
        FROM 
            place_tag, tag
        WHERE 
            place_tag.place = ? AND 
            tag.id = place_tag.tag"
    );

    $stmt->execute(array($place_id));

    return $stmt->fetchAll();
}

/**
 * Gets all types of tags stores
 */
function get_tags()
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "SELECT 
            id, tag_icon, tag_name 
        FROM 
            tag"
    );

    $stmt->execute();

    return $stmt->fetchAll();
}

/*========================= ADDS ============================== */

/**
 * Adds tags to a place
 */
function add_place_tags($place_id, $tags) 
{
    $db = Database::instance()->db();

    // Insert new tags 
    foreach ($tags as $tag) {
        $stmt1 = $db->prepare(
            "INSERT OR IGNORE INTO place_tag
            (place, tag) 
            VALUES (?, ?)"
        );
    
        $stmt1->execute(array($place_id, $tag));
    }
}

/*========================= UPDATES ============================== */

/**
 * Updates the tags of a place, reming old ones and inserting new ones
 */
function update_place_tags($place_id, $tags)
{
    $place_tags = get_place_tags($place_id);

    $db = Database::instance()->db();

    // Remove old tags that were removed by the user
    foreach ($place_tags as $place_tag) {
        $was_removed = true;

        foreach ($tags as $tag) {
            if ($place_tag["id"] == $tag) {
                $was_removed = false;
            }
        }

        if ($was_removed) {

            $stmt = $db->prepare(
                "DELETE FROM place_tag
                WHERE 
                    tag = ? AND
                    place = ?"
            );

            $stmt->execute(array($place_tag["id"], $place_id));
        }
    }

    // Insert new tags if they do not exist yet
    add_place_tags($place_id, $tags);
}

/*========================= REMOVES ============================== */

/**
 * Removes the rows that made the correspondecy between a place and tags. 
 * Necessary when removing a place
 */
function remove_place_tags($place_id)
{
    $db = Database::instance()->db();

    $stmt = $db->prepare(
        "DELETE FROM 
            place_tag 
        WHERE place = ?"
    );

    $stmt->execute(array($place_id));
}