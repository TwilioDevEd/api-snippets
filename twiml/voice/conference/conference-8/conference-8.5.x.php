<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->conference('Customer Waiting Room', ['beep' => 'false',
    'endConferenceOnExit' => 'true']);

echo $response;
