<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay(['paymentMethod' => 'ach-debit', 'chargeAmount' => '13.22']);
$prompt = $pay->prompt(['for' => 'bank-account-number']);
$prompt->say('Thanks for using our service. Please enter your bank account number.');
$prompt2 = $pay->prompt(['for' => 'bank-account-number', 'requireMatchingInputs' => 'true']);
$prompt2->say('Thank you. Please enter your bank account number again.');

echo $response;
