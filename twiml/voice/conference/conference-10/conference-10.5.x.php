<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->conference('LoveTwilio', ['record' => 'record-from-start',
    'recordingStatusCallback' => 'www.myexample.com']);

echo $response;
