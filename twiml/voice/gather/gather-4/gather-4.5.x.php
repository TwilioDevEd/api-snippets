<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$gather = $response->gather(['input' => 'speech', 'action' => '/completed']);
$gather->say('Welcome to Twilio, please tell us why you\'re calling');

echo $response;
