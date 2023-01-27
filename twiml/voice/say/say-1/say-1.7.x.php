<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Chapeau!', ['voice' => 'woman', 'language' => 'fr-FR']);

echo $response;
