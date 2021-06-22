<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->number('415-123-4567',
    ['url' => 'http://example.com/agent_screen_call']);

echo $response;
