<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$gather = $response->gather(['action' => '/process_gather.php',
    'method' => 'GET']);
$gather->say('Please enter your account number,\nfollowed by the pound sign');
$response->say('We didn\'t receive any input. Goodbye!');

echo $response;
