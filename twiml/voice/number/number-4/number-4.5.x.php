<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->number('+14155555555',
    ['statusCallbackEvent' => 'initiated ringing answered completed',
    'statusCallback' => 'https://myapp.com/calls/events',
    'statusCallbackMethod' => 'POST']);
$dial->number('+14153333333',
    ['statusCallbackEvent' => 'initiated ringing answered completed',
    'statusCallback' => 'https://example.com/events',
    'statusCallbackMethod' => 'POST']);

echo $response;
