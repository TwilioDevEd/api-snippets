<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse;

// get the phone number from the page request parameters, if given
if (isset($_REQUEST['To'])) {
    $number = htmlspecialchars($_REQUEST['To']);
    $response->dial(array(
        'callerId' => '+15017122661'
    ))->number($number);
} else {
    $response->say("Thanks for calling!");
}

echo $response;
