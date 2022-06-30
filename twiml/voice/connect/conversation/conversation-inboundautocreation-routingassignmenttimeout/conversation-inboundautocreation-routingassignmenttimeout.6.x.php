<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->conversation(['serviceInstanceSid' => 'ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'inboundAutocreation' => 'true', 'routingAssignmentTimeout' => '10']);

echo $response;
