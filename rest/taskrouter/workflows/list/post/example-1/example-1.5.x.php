<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$sid    =  getenv('TWILIO_ACCOUNT_SID');
$token  = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$configuration = array(
  'task_routing' => array(
    'filters' => array(
      array(
        'expression' => "type=='sales'",
        'targets' => array(
          array('queue' => 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        )
      ),
      array(
        'expression' => "type=='marketing'",
        'targets' => array(
          array('queue' => 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        )
      ),
      array(
        'expression' => "type=='support'",
        'targets' => array(
          array('queue' => 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        )
      ),
    ),
    'default_filter' => array(
      'queue' => 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    )
  )
);

$workflow = $client->taskrouter
    ->v1
    ->workspaces("WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->workflows
    ->create(json_encode($configuration),
            "Sales, Marketing, Support Workflow",
            array(
                'assignmentCallbackUrl' => "http://example.com",
                'fallbackAssignmentCallbackUrl' => "http://example2.com",
                'taskReservationTimeout' => 30
            )
   );

print($workflow.friendly_name);
