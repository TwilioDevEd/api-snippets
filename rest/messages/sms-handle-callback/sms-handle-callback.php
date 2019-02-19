<?php
$sid = $_REQUEST['MessageSid'];
$status = $_REQUEST['MessageStatus'];

openlog("myMessageLog", LOG_PID | LOG_PERROR, LOG_USER);
syslog(LOG_INFO, "SID: $sid, Status: $status");
closelog();