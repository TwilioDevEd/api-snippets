<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->say('Bom dia.', ['voice' => 'alice', 'language' => 'pt-BR',
    'loop' => 2]);

echo $response;
