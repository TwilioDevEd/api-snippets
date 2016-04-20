<?php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// You will need your Account Sid and a SigningKey Sid and Secret
// to generate an Access Token for your SDK endpoint to connect to Twilio.
$accountSid = "ACdc5f132a3c49700934481addd5ce1659";
$signingKeySid = SID;
$signingKeySecret = SECRET;

$token = new Services_Twilio_AccessToken($signingKeySid, $accountSid, $signingKeySecret);
$token->addEndpointGrant(ENDPOINT_ADDRESS, ["listen", "invite"]);
$token->enableNTS();
echo $token->toJWT();
