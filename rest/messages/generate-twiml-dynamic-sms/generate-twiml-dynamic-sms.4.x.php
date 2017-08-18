<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$body = $_REQUEST['Body'];

if ($body == 'hello') {
    $response->message('Hi!');
} elseif ($body == 'bye') {
    $response->message('Goodbye');
}
print $response;
