<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$hangup = $response->hangup();
$hangup->parameter(['name' => 'hangup_reason', 'value' => 'no agents available']);

echo $response;
