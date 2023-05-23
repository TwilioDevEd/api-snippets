<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$city = $_REQUEST['FromCity'] ?? 'Guayaquil';

$response = new VoiceResponse();
$response->say("Never gonna give you up, {$city}!");
$response->play("https://demo.twilio.com/docs/classic.mp3");

echo $response;