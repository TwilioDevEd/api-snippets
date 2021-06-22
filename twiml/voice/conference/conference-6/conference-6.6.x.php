<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->conference('NoMusicNoBeepRoom', ['beep' => 'false',
    'waitUrl' => 'http://your-webhook-host.com',
    'startConferenceOnEnter' => 'true', 'endConferenceOnExit' => 'true']);

echo $response;
