<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\Twiml;

$response = new Twiml;
$response->message("The Robots are coming! Head for the hills!");
print $response;