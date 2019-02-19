<?php

$url = 'https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101';

$process = curl_init($url);
curl_setopt($process, CURLOPT_HTTPHEADER, array('Content-Type: application/json', $additionalHeaders));
curl_setopt($process, CURLOPT_USERPWD, 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:your_auth_token');
curl_setopt($process, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
$response = curl_exec($process);
curl_close($process);
echo($response);

?>
