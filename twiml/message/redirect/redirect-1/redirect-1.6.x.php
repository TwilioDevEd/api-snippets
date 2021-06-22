<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->redirect('http://www.foo.com/nextInstructions');

echo $response;
