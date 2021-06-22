<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$gather = $response->gather(['input' => 'speech dtmf', 'timeout' => 3,
    'numDigits' => 1]);
$gather->say('Please press 1 or say sales for sales.');

echo $response;
