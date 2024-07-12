<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$start = $response->start();
$start->transcription(['statusCallbackUrl' => 'https://example.com/your-callback-url', 'hints' => 'Alice Johnson, Bob Martin, ACME Corp, XYZ Enterprises, product demo, sales inquiry, customer feedback']);

echo $response;
