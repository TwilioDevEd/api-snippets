<?php
require_once 'vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$connect = $response->connect();
$connect->room('meeting', ['statusCallback' => 'https://myactionurl.com/']);

echo $response;
