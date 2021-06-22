<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$dial = $response->dial('', ['record' => 'record-from-answer',
    'recordingTrack' => 'inbound',
    'recordingStatusCallback' => 'https://www.myexample.com/recording-handler']);
$dial->number('+15551239876');

echo $response;
