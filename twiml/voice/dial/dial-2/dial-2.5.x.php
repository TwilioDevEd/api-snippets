<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->dial('415-123-4567');
$response->say('Goodbye');

echo $response;
