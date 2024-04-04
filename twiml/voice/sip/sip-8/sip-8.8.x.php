<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('');
$dial->sip('sip:kate@example.com?x-mycustomheader=foo&x-myotherheader=bar');

echo $response;
