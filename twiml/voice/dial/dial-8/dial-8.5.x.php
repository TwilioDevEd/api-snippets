<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['referUrl' => 'https://example.com/handler']);
$dial->sip('sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A');

echo $response;
