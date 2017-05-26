<?php
require_once './vendor/autoload.php';
use Twilio\Twiml;

$response = new Twiml();
$response->say('Bom dia.', ['voice' => 'alice', 'language' => 'pt-BR',
    'loop' => 2]);

echo $response;
