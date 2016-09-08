<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require_once '/path/to/vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml;
$response->say("hello world!", array('voice' => 'alice'));
print $response;
