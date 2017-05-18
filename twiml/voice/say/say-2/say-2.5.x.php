<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->say('Chapeau!', ['voice' => 'alice', 'language' => 'fr-FR']);

echo $response;