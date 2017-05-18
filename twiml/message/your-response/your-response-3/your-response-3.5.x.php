<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->message('I'm hungry!');

echo $response;