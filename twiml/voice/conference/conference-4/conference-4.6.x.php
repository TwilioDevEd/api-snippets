<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->conference('EventedConf',
    ['statusCallback' => 'https://myapp.com/events',
    'statusCallbackEvent' => 'start end join leave mute hold']);

echo $response;
