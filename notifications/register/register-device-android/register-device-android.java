public class RegistrationIntentService extends IntentService {  
  @Override
  protected void onHandleIntent(Intent intent) {
    InstanceID instanceID = InstanceID.getInstance(this);
    String token = instanceID.getToken(getString(R.string.gcm_defaultSenderId),
        GoogleCloudMessaging.INSTANCE_SID_SCOPE, null);
  }
}