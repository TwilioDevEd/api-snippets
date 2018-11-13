<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->sms('The king stay the king.', ['from' => '+14105551234',
    'to' => '+14105556789']);

echo $response;
