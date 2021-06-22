<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['action' => 'handleLeaveConference.php',
    'method' => 'POST', 'hangupOnStar' => 'true', 'timeLimit' => 30]);
$dial->conference('LoveTwilio');

echo $response;
