<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->play('https://api.twilio.com/cowbell.mp3');

echo $response;
