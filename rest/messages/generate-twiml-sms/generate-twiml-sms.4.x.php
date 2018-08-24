<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 

$response = new Services_Twilio_Twiml;
$response->message("The Robots are coming! Head for the hills!");
print $response;
