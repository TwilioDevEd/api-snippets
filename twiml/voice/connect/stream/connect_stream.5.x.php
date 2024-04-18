<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->stream(['url' => 'wss://example.com/audiostream']);
$response->say('This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.');

echo $response;
