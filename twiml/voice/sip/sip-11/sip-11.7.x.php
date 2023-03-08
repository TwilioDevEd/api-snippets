<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->number('+12143211432');
$dial->sip('sip:alice-soft-phone@example.com');
$dial->sip('sip:alice-desk-phone@example.com');
$dial->sip('sip:alice-mobile-client@example.com');

echo $response;
