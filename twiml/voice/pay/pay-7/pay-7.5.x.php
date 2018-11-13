<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay();
$prompt = $pay->prompt(['for' => 'security-code', 'cardType' => 'amex']);
$prompt->say('Please enter security code for your American Express card. It’s the 4 digits located on the front of your card');

echo $response;
