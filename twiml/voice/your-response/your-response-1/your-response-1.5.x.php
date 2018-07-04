<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('Hello World');
$response->play('https://api.twilio.com/Cowbell.mp3');

echo $response;
