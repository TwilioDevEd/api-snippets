<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$start = $response->start();
$stream = $start->stream(['url' => 'wss://mystream.ngrok.io/example']);
$stream->parameter(['name' => 'FirstName', 'value' => 'Jane']);
$stream->parameter(['name' => 'LastName', 'value' => 'Doe']);

echo $response;
