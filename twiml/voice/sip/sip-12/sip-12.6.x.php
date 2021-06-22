<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['sequential' => 'true']);
$dial->sip('sip:alice@example.com');
$dial->sip('sip:bob@example.com');
$dial->sip('sip:charlie@example.com');

echo $response;
