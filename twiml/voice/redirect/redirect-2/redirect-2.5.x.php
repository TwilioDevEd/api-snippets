<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->dial('415-123-4567');
$response->redirect('http://www.foo.com/nextInstructions');

echo $response;
