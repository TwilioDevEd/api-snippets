<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Twiml;

$response = new Twiml;
$response->message("The Robots are coming! Head for the hills!");
print $response;
