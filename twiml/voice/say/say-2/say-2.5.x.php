<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('Chapeau!', ['voice' => 'alice', 'language' => 'fr-FR']);

echo $response;
