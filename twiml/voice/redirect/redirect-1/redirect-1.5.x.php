<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;
$response = new Twiml();
$response->redirect('http://pigeons.com/twiml.xml', ['method' => 'POST']);

echo $response;