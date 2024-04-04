<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->sip('kate@example.com', ['username' => 'admin', 'password' => '1234']);

echo $response;
