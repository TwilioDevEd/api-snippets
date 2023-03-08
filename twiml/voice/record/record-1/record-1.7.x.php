<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->record(['timeout' => 10, 'transcribe' => 'true']);

echo $response;
