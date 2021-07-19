<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->say("Hello. It's me. I've been wondering if after this guide you'd like to meet.");
$response->play("https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3");
print $response;
