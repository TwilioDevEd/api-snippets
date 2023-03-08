<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$client = $dial->client();
$client->identity('user_jane');
$client->parameter(['name' => 'FirstName', 'value' => 'Jane']);
$client->parameter(['name' => 'LastName', 'value' => 'Doe']);

echo $response;
