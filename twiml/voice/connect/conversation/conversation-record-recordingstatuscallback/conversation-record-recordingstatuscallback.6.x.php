<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'record' => 'record-from-answer', 'recordingStatusCallback' => 'https://your-recording-status-callback-url.com/']);

echo $response;
