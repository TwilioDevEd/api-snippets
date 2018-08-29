<?php
require __DIR__ . '/twilio-php-master/Twilio/autoload.php';
use Twilio\TwiML;
// Set the content-type to XML to send back TwiML from the PHP Helper Library
header("content-type: text/xml");
$response = new TwiML();
$response->message(
    "I'm using the Twilio PHP library to respond to this SMS!"
);
echo $response;