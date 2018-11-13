<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->number('+14158675310',
    ['statusCallbackEvent' => 'initiated ringing answered completed',
    'statusCallback' => 'https://myapp.com/calls/events',
    'statusCallbackMethod' => 'POST']);

echo $response;
