<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$refer = $response->refer();
$refer->sip('sip:alice@example.com');

echo $response;
