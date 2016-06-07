<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, null);

$rules = array();


$salesQueue = "YourSalesQueueSid";
$marketingQueue = "YourMarketingQueueSid";
$supportQueue = "YourSupportQueueSid";
$everyoneQueue = "YourMarketingQueueSid";

$defaultTarget = new WorkflowRuleTarget($everyoneQueue);

$salesTargets = array();
$salesTarget = new WorkflowRuleTarget($salesQueue);
$salesTargets[] = $salesTarget;
$salesRule = new WorkflowRule("type=='sales'", $salesTargets);

$marketingTargets = array();
$marketingTargets = new WorkflowRuleTarget($marketingQueue);
$marketingTargets[] = $marketingTargets;
$marketingRule = new WorkflowRule("type=='marketing'", $marketingTargets);

$supportTargets = array();
$supportTargets = new WorkflowRuleTarget($supportQueue);
$supportTargets[] = $supportTargets;
$supportRule = new WorkflowRule("type=='support'", $supportTargets);

$rules[] = $salesRule;
$rules[] = $marketingRule;
$rules[] = $supportRule;

$configuration = new WorkflowConfiguration($rules, $defaultTarget);
$json = $configuration->toJSON();

$params = array();
$params["FallbackAssignmentCallbackUrl"] = "http://example2.com";
$params["TaskReservationTimeout"] = 30;

$workflow = $client->workspace->workflows->create("Sales, Marketing, Support Workflow", $json, "http://example.com", $params);
echo $workflow->friendly_name;