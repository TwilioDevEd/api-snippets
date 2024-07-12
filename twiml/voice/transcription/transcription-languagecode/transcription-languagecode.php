<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$start = $response->start();
$start->transcription(['statusCallbackUrl' => 'https://example.com/your-callback-url', 'languageCode' => 'es-MX']);

echo $response;
