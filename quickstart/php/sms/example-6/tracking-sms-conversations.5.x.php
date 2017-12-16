<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// following the instructions to install it with Composer.
require_once "vendor/autoload.php";
use Twilio\Twiml;

// start the session
session_start();

// get the session varible if it exists
// if it doesnt, set the default
$counter = $_SESSION['counter'] ?: 0;

// increment it
$counter++;

// save it
$_SESSION['counter'] = $counter;

// make an associative array of senders we know, indexed by phone number
$people = array(
    "+14158675309" => "Curious George",
    "+14158675310" => "Boots",
    "+14158675311" => "Virgil",
);

// if the sender is known, then greet them by name
// otherwise, consider them just another monkey
$name = $people[$_REQUEST['From']] ?: 'Monkey';

$response = new Twiml();
$response->message("{$name} has messaged {$_REQUEST['To']} {$counter} times");

header("content-type: text/xml");
echo $response;
