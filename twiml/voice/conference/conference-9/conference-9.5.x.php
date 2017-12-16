<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$dial = $response->dial(['action' => 'handleLeaveConference.php',
    'method' => 'POST', 'hangupOnStar' => 'true', 'timeLimit' => 30]);
$dial->conference('LoveTwilio');

echo $response;
