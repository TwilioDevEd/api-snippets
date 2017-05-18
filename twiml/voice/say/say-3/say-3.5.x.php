<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->say('Hej!', ['language' => 'sv-SE']);

echo $response;