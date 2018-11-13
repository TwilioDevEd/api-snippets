<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay();
$prompt = $pay->prompt(['for' => 'security-code', 'cardType' => 'visa']);
$prompt->say('Please enter security code for your Visa card. It’s the 3 digits located on the back of your card');

echo $response;
