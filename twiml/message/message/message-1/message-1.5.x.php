<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->message('Store Location: 123 Easy St.');

echo $response;