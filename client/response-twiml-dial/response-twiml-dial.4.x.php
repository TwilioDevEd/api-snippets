<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 

$response = new Services_Twilio_Twiml;

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
