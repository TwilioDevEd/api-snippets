<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->conference('moderated-conference-room',
    ['startConferenceOnEnter' => 'false']);

echo $response;
