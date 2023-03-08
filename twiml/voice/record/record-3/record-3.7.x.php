<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Please leave a message at the beep.\nPress the star key when finished.');
$response->record(['action' => 'http://foo.edu/handleRecording.php',
    'method' => 'GET', 'maxLength' => 20, 'finishOnKey' => '*']);
$response->say('I did not receive a recording');

echo $response;
