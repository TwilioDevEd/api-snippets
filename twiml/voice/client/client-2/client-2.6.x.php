<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['callerId' => '+1888XXXXXXX']);
$dial->number('858-987-6543');
$dial->client('joey');
$dial->client('charlie');

echo $response;
