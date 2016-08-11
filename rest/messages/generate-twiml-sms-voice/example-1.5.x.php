<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\Twiml;

$response = new Twiml;
$response->say("Hello Monkey! You will get an SMS message soon.");
$response->sms("Here it is!");
print $response;
