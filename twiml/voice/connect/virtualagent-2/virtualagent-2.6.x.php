<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Hello! You will be now be connected to a virtual agent.');
$connect = $response->connect(['action' => 'https://myactionurl.com/virtualagent_ended']);
$connect->virtualagent(['connectorName' => 'project',
    'statusCallback' => 'https://mycallbackurl.com']);

echo $response;
