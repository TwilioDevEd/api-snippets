<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('You will now be connected to an agent.');

echo $response;
