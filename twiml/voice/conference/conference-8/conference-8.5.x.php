<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$dial = $response->dial();
$dial->conference('Customer Waiting Room', ['beep' => 'false', 'endConferenceOnExit' => 'true']);


echo $response;