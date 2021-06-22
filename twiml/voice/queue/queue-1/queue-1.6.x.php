<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->queue('support', ['url' => 'about_to_connect.xml']);

echo $response;
