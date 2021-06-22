<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->virtualagent(['connectorName' => 'project',
    'sentimentAnalysis' => 'true']);

echo $response;
