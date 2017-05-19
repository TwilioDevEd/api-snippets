<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->redirect('http://www.foo.com/nextInstructions');

echo $response;
