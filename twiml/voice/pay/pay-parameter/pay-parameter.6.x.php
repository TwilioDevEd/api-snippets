<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay(['chargeAmount' => '10.00', 'paymentConnector' => 'My_Generic_Pay_Connector', 'action' => 'https://your-callback-function-url.com/pay']);
$pay->parameter(['name' => 'card_type', 'value' => 'mastercard']);

echo $response;