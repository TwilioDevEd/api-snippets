<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->play('https://api.twilio.com/cowbell.mp3');

echo $response;