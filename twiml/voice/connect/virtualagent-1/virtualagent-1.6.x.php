<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect(['action' => 'https://myactionurl.com/twiml']);
$connect->virtualagent(['connectorName' => 'project',
    'statusCallback' => 'https://mycallbackurl.com']);

echo $response;
