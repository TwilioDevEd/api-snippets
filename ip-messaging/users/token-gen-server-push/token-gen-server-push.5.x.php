<?php

use Twilio\Jwt\Grants\ChatGrant;
$grant = new ChatGrant();
$grant->setServiceSid($serviceSid);
$grant->setEndpointId($endpointId);
$grant->setPushCredentialSid("CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
