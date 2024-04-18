<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$start = $response->start();
$start->stream(['name' => 'Example Audio Stream', 'url' => 'wss://example.com/audiostream']);
$response->say('The stream has started.');

echo $response;
