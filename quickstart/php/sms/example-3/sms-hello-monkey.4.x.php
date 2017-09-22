<?php
// Get the Twilio-PHP helper library from twilio.com/docs/libraries/php,
// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->message('Hello, Mobile Monkey');

header("content-type: text/xml");
echo $response;
