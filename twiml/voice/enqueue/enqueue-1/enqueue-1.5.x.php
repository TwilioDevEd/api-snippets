<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->enqueue('support', ['waitUrl' => 'wait-music.xml']);

echo $response;
