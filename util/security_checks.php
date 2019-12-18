<?php

/**
 * 
 */
function verify_number($number, $input_name)
{
    // Don't allow certain characters
    if (!preg_match("/^[0-9]+$/", $number)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "$input_name can only contain numbers!");
        die(header("Location: ../pages/home.php"));
    }
}

/**
 * 
 */
function verify_text($text, $input_name)
{
    // Don't allow certain characters
    if (!preg_match("/^[a-z A-Z0-9\\/\\\\.'\"]+$/", $text)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "$input_name can only contain letters, numbers and a few special characters!");
        die(header("Location: ../pages/home.php"));
    }
}

/**
 * 
 */
function verify_person_name($person_name, $input_name)
{
    // Don't allow certain characters
    if (!preg_match("/^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/", $person_name)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid $input_name!");
        die(header("Location: ../pages/home.php"));
    }
}

function verify_email($email) 
{
    // Don't allow certain characters
    if (!preg_match("/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/", $email)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid Email!");
        die(header("Location: ../pages/home.php"));
    }
}

/**
 * 
 */
function verify_password($password) 
{
    // Don't allow certain characters
    if (!preg_match("/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/", $password)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid password!");
        die(header("Location: ../pages/home.php"));
    }
}

/**
 * 
 */
function verify_phone_number($phone_num)
{
    // Don't allow certain characters
    if (!preg_match("/^(9\d{8})$/", $phone_num)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid phone number!");
        die(header("Location: ../pages/home.php"));
    }
}

/**
 * 
 */
function verify_date($date, $input_name)
{
    // Don't allow certain characters
    if (!preg_match("/^(\d{1,2} - [A-Z][a-z]{2} - \d{4})$/", $date)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid $input_name!");
        die(header("Location: ../pages/home.php"));
    }
}
