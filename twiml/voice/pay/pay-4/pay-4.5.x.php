<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->pay(['paymentConnector' => 'Stripe_Connector_1']);

echo $response;
