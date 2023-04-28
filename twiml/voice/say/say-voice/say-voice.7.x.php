<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Bonjour! Je m\'appelle Mathieu.', ['voice' => 'Polly.Mathieu', 'language' => 'fr-FR']);

echo $response;
