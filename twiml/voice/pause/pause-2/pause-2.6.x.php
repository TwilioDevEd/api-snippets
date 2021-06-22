<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->pause(['length' => 5]);
$response->say('Hi there.');

echo $response;
