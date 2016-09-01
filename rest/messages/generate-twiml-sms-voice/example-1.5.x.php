<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\Twiml;

$response = new Twiml;
$response->say("Hello! You will get an SMS message soon.");
$response->sms("This is the ship that made the Kessel Run in fourteen parsecs?");
print $response;
