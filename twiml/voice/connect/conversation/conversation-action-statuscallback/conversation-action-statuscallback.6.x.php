<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect(['action' => 'https://your-action-url.com/']);
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'statusCallback' => 'https://your-status-callback-url.com/statusCallback']);

echo $response;
