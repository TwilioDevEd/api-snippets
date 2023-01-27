<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->dial('415-123-4567', ['action' => '/handleDialCallStatus',
    'method' => 'GET']);
$response->say('I am unreachable');

echo $response;
