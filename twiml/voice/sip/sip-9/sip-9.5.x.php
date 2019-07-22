<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['record' => 'record-from-answer', 'timeout' => 10,
    'hangupOnStar' => 'true', 'callerId' => 'bob', 'method' => 'POST',
    'action' => '/handle_post_dial']);
$dial->sip('sip:kate@example.com?x-customheader=foo', ['method' => 'POST',
    'url' => '/handle_screening_on_answer']);

echo $response;
