<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay();
$prompt = $pay->prompt(['for' => 'payment-card-number']);
$prompt->play('https://myurl.com/twilio/twiml/audio/card_number.mp3');

echo $response;
