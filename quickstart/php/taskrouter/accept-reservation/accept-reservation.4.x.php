<?php
// Download the Twilio-PHP library from twilio.com/docs/libraries/php,
// and move it into the folder containing this file.
require 'Services/Twilio.php';

// put your Twilio API credentials here
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken  = 'your_auth_token';

$workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 

$taskrouterClient = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid); 
$taskrouterClient->workspace->tasks->get($taskSid)->reservations->get($reservationSid)->update('ReservationStatus', 'accepted'); 