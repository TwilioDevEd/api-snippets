<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->pay(['tokenType' => 'one-time', 'chargeAmount' => '0']);

echo $response;
