<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$dial = $response->dial();
$dial->conference('moderated-conference-room',
    ['startConferenceOnEnter' => 'false']);

echo $response;
