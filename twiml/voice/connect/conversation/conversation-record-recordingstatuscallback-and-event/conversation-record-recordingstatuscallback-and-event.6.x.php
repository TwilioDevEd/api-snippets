<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'record' => 'record-from-answer', 'recordingStatusCallback' => 'https://example.com/yourRecordingStatusCallback', 'recordingStatusCallbackEvent' => 'in-progress completed']);

echo $response;
