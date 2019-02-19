<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->sip('sip:kate@example.com?mycustomheader=foo&myotherheader=bar');

echo $response;
