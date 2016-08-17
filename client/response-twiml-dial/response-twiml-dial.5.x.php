<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\Twiml;

$response = new Twiml;

// get the phone number from the page request parameters, if given
if (isset($_REQUEST['To'])) {
    $number = htmlspecialchars($_REQUEST['To']);
    $response->dial(array(
        'callerId' => '+15017250604'
    ))->number($number);
} else {
    $response->say("Thanks for calling!");
}

echo $response;