<!-- Installation -->
<!-- $ composer require guzzlehttp/guzzle -->

<!-- Request -->
<?php
require_once('vendor/autoload.php');

$client = new \GuzzleHttp\Client();

$response = $client->request('POST', 'https://api-sbox.dnlsrv.com/cigateway/id/v2/match', [
  'body' => '{"merchantId":"02200013919FB4","consentId":"9783471AFDB69NH34","consentTimeStamp":"2020-08-20T12:00:57+00:00","msisdn":"+14444441333","correlationId":"984681AFDB698C67","firstName":"Michael","lastName":"Johnson","address1":"3701 Ashwood Dr","address2":"Apt 20","city":"Council Bluffs","state":"IA","postalCode":"51501","countryCode":"US","nationalId":"345678901","dateOfBirth":"19800303"}',
  'headers' => [
    'Accept' => 'application/json',
    'Authorization' => 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No',
    'Content-Type' => 'application/json',
    'RequestTime' => '2022-08-01T09:33:43+00:00',
  ],
]);

echo $response->getBody();
