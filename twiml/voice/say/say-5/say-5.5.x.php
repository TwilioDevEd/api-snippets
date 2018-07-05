<?php
require_once './vendor/autoload.php';
use Twilio\TwiML;

$response = new TwiML();
$response->say('Bom dia.', ['voice' => 'alice', 'language' => 'pt-BR',
    'loop' => 2]);

echo $response;
