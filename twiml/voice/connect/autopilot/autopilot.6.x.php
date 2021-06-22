<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->autopilot('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

echo $response;
