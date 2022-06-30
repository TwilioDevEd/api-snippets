<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect(['action' => 'https://example.com/yourActionUrl', 'method' => 'GET']);
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx']);

echo $response;
