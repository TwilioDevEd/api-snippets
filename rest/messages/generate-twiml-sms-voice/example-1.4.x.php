<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->say("Hello! You will get an SMS message soon.");
$response->sms("This is the ship that made the Kessel Run in fourteen parsecs?");
print $response;
