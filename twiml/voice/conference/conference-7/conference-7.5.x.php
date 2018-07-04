<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiMLTwiML();
$dial = $response->dial();
$dial->conference('Customer Waiting Room', ['beep' => 'false']);

echo $response;
