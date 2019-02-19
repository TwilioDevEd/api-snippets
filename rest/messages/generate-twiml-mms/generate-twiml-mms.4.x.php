<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require('Services/Twilio.php'); 

$response = new Services_Twilio_Twiml;
$message = $response->message();
$message->body("The Robots are coming! Head for the hills!");
$message->media("https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg");
print $response;
