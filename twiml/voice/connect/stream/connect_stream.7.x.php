<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->stream(['url' => 'wss://mystream.ngrok.io/audiostream']);

echo $response;
