<?php

/**
 * 
 */
function image_create_from_file($file_type, $file)
{
    if (!file_exists($file)) {
        throw new InvalidArgumentException('File "' . $file . '" not found.');
    }

    switch ($file_type) {
        case 'jpeg':
        case 'jpg':
            return imagecreatefromjpeg($file);
            break;

        case 'png':
            return imagecreatefrompng($file);
            break;

        case 'gif':
            return imagecreatefromgif($file);
            break;

        default:
            throw new InvalidArgumentException('File "' . $file . '" is not valid jpg, png or gif image.');
            break;
    }
}

/**
 * 
 */
function file_create_from_image($file_type, $image_resource, $file_destination)
{
    switch ($file_type) {
        case 'jpeg':
        case 'jpg':
            return imagejpeg($image_resource, $file_destination, 100);
            break;

        case 'png':
            return imagepng($image_resource, $file_destination, 0);
            break;

        case 'gif':
            return imagegif($image_resource, $file_destination);
            break;
    }
}
