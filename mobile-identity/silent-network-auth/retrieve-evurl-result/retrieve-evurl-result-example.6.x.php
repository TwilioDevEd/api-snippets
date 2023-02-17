<!-- Installation -->
<!-- composer require guzzlehttp/guzzle -->

<!-- Request -->
<?php
require_once('vendor/autoload.php');

$client = new \GuzzleHttp\Client();

$response = $client->request('POST', 'https://api-sbox.dnlsrv.com/cigateway/id/v1/phoneIdResult', [
  'body' => '{"merchantId":"02200013919FB4","subMerchantId":"00DF00000016","correlationId":"984681AFDB698C67","associationKey":"244464DFCB537E56","match":{"consumerMdn":"+14085040458"}}',
  'headers' => [
    'Accept' => 'application/json',
    'Authorization' => 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No',
    'Content-Type' => 'application/json',
    'RequestTime' => '2022-08-01T09:33:43+00:00',
  ],
]);

echo $response->getBody();
