<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->message('Hello, Mobile Monkey');

header("content-type: text/xml");
echo $response;
