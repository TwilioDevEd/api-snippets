<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['record' => 'record-from-ringing-dual',
    'recordingStatusCallback' => 'www.myexample.com']);
$dial->conference('myteamroom');

echo $response;
