<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->record(['transcribe' => 'true',
    'transcribeCallback' => '/handle_transcribe.php']);

echo $response;
