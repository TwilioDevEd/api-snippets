<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->redirect('http://pigeons.com/twiml.xml', ['method' => 'POST']);

echo $response;
