<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->say('Hello World');
$response->play('https://api.twilio.com/Cowbell.mp3');

echo $response;