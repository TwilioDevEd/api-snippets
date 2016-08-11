<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$salesQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$marketingQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$supportQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$everyoneQueue = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$defaultTarget = new WorkflowRuleTarget($everyoneQueue);

$salesTargets = array();
$salesTarget = new WorkflowRuleTarget($salesQueue);
$salesTargets[] = $salesTarget;
$salesRule = new WorkflowRule("type=='sales'", $salesTargets, 'Sales');

$marketingTargets = array();
$marketingTarget = new WorkflowRuleTarget($marketingQueue);
$marketingTargets[] = $marketingTarget;
$marketingRule = new WorkflowRule("type=='marketing'", $marketingTargets, 'Marketing');

$supportTargets = array();
$supportTarget = new WorkflowRuleTarget($supportQueue);
$supportTargets[] = $supportTarget;
$supportRule = new WorkflowRule("type=='support'", $supportTargets, 'Support');

$rules[] = $salesRule;
$rules[] = $marketingRule;
$rules[] = $supportRule;

$configuration = new WorkflowConfiguration($rules, $defaultTarget);
$json = $configuration->toJSON();

$params = array();
$params["FallbackAssignmentCallbackUrl"] = "http://example2.com";
$params["TaskReservationTimeout"] = 30;

$workflow = $client->taskrouter
    ->workspaces($workspaceSid)
    ->workflows
    ->create(
        "Sales, Marketing, Support Workflow",
        $json,
        "http://example.com"
        $params)
    );

echo $workflow->friendlyName;
