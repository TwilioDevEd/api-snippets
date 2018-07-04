<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial(['action' => 'handleLeaveConference.php',
    'method' => 'POST', 'hangupOnStar' => 'true', 'timeLimit' => 30]);
$dial->conference('LoveTwilio');

echo $response;
