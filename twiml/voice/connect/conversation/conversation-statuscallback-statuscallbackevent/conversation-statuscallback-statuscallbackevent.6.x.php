<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'statusCallback' => 'https://example.com/yourStatusCallback', 'statusCallbackEvent' => 'call-initiated call-in-progress call-ringing call-completed']);

echo $response;
