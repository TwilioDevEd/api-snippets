<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->say('Chapeau!', ['voice' => 'woman', 'language' => 'fr']);

echo $response;
