<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$start = $response->start();
$start->siprec(['name' => 'My SIPREC Stream',
    'connectorName' => 'Gridspace_1']);

echo $response;
