<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$gather = $response->gather(['action' => '/process_gather.php',
    'method' => 'GET']);
$gather->say('Enter something, or not');
$response->redirect('/process_gather.php?Digits=TIMEOUT', ['method' => 'GET']);

echo $response;
