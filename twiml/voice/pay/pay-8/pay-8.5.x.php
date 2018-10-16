<?php
require_once 'vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay();
$prompt = $pay->prompt(['for' => 'security-code', 'cardType' => 'visa']);
$prompt->say('Please enter security code for your visa card. It’s the 3 digits located in the back of your card');

echo $response;
