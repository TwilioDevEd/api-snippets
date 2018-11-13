<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->play('https://api.twilio.com/cowbell.mp3', ['loop' => 10]);

echo $response;
