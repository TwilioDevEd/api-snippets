<?php
require __DIR__ . '/twilio-php-master/Twilio/autoload.php';
use Twilio\TwiML;

// Start our TwiML response
$response = new TwiML;

// Read a message aloud to the caller
$response->say(
    "Thank you for calling! Have a great day.", 
    array("voice" => "alice")
);

echo $response;