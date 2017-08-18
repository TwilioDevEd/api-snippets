<?php
// Get the PHP helper library from twilio.com/docs/php/install

require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Twiml;

$response = new Twiml;
$body = $_REQUEST['Body'];

if ($body == 'hello') {
    $response->message('Hi!');
} elseif ($body == 'bye') {
    $response->message('Goodbye');
}
print $response;
