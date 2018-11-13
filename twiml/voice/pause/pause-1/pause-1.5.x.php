<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('I will pause 10 seconds starting now!');
$response->pause(['length' => 10]);
$response->say('I just paused 10 seconds');

echo $response;
