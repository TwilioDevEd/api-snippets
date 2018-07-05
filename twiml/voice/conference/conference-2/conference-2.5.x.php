<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$dial = $response->dial();
$dial->conference('moderated-conference-room',
    ['startConferenceOnEnter' => 'false']);

echo $response;
