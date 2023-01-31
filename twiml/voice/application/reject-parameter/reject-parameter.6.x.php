<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$reject = $response->reject();
$reject->parameter(['name' => 'reject_reason', 'value' => 'no agents available']);

echo $response;
