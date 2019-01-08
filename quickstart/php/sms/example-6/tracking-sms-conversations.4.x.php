<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
use Services_Twilio_Twiml;

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
    "+14158675308" => "Curious George",
    "+12349013030" => "Boots",
    "+12348134522" => "Virgil",
);

// if the sender is known, then greet them by name
// otherwise, consider them just another monkey
$name = $people[$_REQUEST['From']] ?: 'Monkey';

$response = new Services_Twilio_Twiml;
$response->message("{$name} has messaged {$_REQUEST['To']} {$counter} times");

header("content-type: text/xml");
echo $response;
