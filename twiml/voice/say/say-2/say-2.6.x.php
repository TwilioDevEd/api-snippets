<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Chapeau!', ['voice' => 'alice', 'language' => 'fr-FR']);

echo $response;
