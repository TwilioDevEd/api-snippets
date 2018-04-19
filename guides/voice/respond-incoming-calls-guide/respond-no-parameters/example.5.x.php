<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require_once '/path/to/vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml;
$response->say("hello world!", array('voice' => 'alice'));
print $response;
