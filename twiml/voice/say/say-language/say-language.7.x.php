<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Bonjour!', ['language' => 'fr-FR']);

echo $response;
