<?php

/**
 * Verifies if the first argument is really a number with no harmful intentions.
 * In case of error displays an appropriate message
 */
function verify_number($number, $input_name)
{
    if (!preg_match("/^[0-9]+$/", $number)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "$input_name can only contain numbers!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really text with no harmful intentions. 
 * In case of error displays an appropriate message
 */
function verify_text($text, $input_name)
{
    if (!preg_match("/^[ \w\s.,;\/()!?\$#@%&{}<>\"']+$/", $text)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "$input_name can only contain letters, numbers and a few special characters!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really something that could be the name of a person. 
 * In case of error displays an appropriate message
 */
function verify_person_name($person_name, $input_name)
{
    if (!preg_match("/^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/", $person_name)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid $input_name!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really in an email format. 
 * In case of error displays an appropriate message
 */
function verify_email($email) 
{
    if (!preg_match("/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/", $email)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid Email!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really a password that matches our requirements 
 * In case of error displays an appropriate message
 */
function verify_password($password) 
{
    if (!preg_match("/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/", $password)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid password!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really a phone number
 * In case of error displays an appropriate message
 */
function verify_phone_number($phone_num)
{
    if (!preg_match("/^(9\d{8})$/", $phone_num)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid phone number!");
        return false;
    }

    return true;
}

/**
 * Verifies if the first argument is really a date in the requested format with no harmful intentions. 
 * In case of error displays an appropriate message
 */
function verify_date($date, $input_name)
{
    if (!preg_match("/^(\d{1,2} - [A-Z][a-z]{2} - \d{4})$/", $date)) {
        $_SESSION["messages"][] = array("type" => "error", "content" => "Invalid $input_name!");
        return false;
    }

    return true;
}
