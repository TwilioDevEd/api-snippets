<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('Hej!', ['language' => 'sv-SE']);

echo $response;
