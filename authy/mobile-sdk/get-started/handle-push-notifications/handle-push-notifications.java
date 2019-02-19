public class MessagingService extends FirebaseMessagingService {
    private static final String TAG = MessagingService.class.getSimpleName();
    public static final String ONETOUCH_APPROVAL_REQUEST_TYPE = "onetouch_approval_request";

    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {

        // Check if message contains a data payload.
        if (remoteMessage.getData().size() == 0) {
            Log.e(TAG, "Received notification with empty payload");
            return;
        }

        if (ONETOUCH_APPROVAL_REQUEST_TYPE.equals(remoteMessage.getData().get("type"))) {
            
            // Since the approval request has sensitive data, we'll fetch it in background with
            // the request uuid instead of delivering the information within the userInfo.

            // Get the approval request id
            String approvalRequestUuid = remoteMessage.getData().get("approval_request_uuid");

            TwilioAuth twilioAuth = ((App) getApplicationContext()).getTwilioAuth();

            if (!twilioAuth.isDeviceRegistered()) {
                throw new RuntimeException("Device should be registered");
            }

            ApprovalRequest approvalRequest;

            try {
                ApprovalRequests approvalRequests = twilioAuth.getApprovalRequests(null, null);

                approvalRequest = approvalRequests.getApprovalRequestById(approvalRequestUuid);

            } catch (TwilioException e) {
                throw new RuntimeException(e);
            }

            if (approvalRequest != null) {
                // Do something with the pending approvalRequest
            }
        }

    }
