<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$stop = $response->stop();
$stop->transcription(['name' => 'Contact center transcription']);

echo $response;
