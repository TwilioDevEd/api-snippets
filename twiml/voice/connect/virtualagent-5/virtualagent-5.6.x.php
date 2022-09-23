<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$virtualagent = $connect->virtualagent(['connectorName' => 'uniqueName']);
$virtualagent->parameter(['name' => 'customer_name', 'value' => 'Burton Guster']);

echo $response;
