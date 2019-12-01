<?php
include_once('../includes/session.php');
include_once('../database/db_user.php');

update_profile($_POST);

if ($_POST['image'] != null) {
    print_r($_POST);
    $img = $_FILES['image']['name'];
    $img_location = $_FILES['images']['tmp_name'];
    $img_folder = "images/profiles/";
    if (move_uploaded_file($img_location, $image_folder . $img)) { ?>
        <script>
            alert('File successfully saved!');
        </script>
    <?php } else { ?>
        <script>
            alert('Something went wrong!');
        </script>

<?php }

    print_r($img);

    update_profile_pic($_POST);
}

#redirect
$id = (string) $_POST['id'];
header("Location: ../pages/usr_profile.php?id=$id");
?>