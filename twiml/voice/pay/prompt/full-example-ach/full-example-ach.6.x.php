<?php
require_once './vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$pay = $response->pay(['timeout' => '5', 'maxAttempts' => '3', 'paymentMethod' => 'ach-debit', 'language' => 'en-US']);
$prompt = $pay->prompt(['for' => 'bank-routing-number']);
$prompt->say('Please enter your bank routing number.');
$prompt2 = $pay->prompt(['for' => 'bank-routing-number', 'errorType' => 'timeout']);
$prompt2->say('You didn\'t enter your routing number. Please enter your bank routing number.');
$prompt3 = $pay->prompt(['for' => 'bank-routing-number', 'errorType' => 'invalid-bank-routing-number']);
$prompt3->say('That was an invalid bank routing number. Please try again.');
$prompt4 = $pay->prompt(['for' => 'bank-account-number']);
$prompt4->say('Please enter your bank account number.');
$prompt5 = $pay->prompt(['for' => 'bank-account-number', 'errorType' => 'timeout']);
$prompt5->say('You didn\'t enter your bank account number. Please enter your bank account number.');
$prompt6 = $pay->prompt(['for' => 'payment-processing']);
$prompt6->say('Thank you. Please wait while we process your payment.');

echo $response;
