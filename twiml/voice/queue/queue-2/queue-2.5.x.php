<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->say('You will now be connected to an agent.');

echo $response;