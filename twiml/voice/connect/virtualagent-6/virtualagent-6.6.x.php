<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$virtualagent = $connect->virtualagent(['connectorName' => 'uniqueName']);
$virtualagent->config(['name' => 'language', 'value' => 'en-us']);
$virtualagent->config(['name' => 'voiceName', 'value' => 'en-US-Wavenet-C']);

echo $response;
