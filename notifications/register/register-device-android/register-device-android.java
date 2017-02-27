public class RegistrationIntentService extends IntentService {  
  @Override
  protected void onHandleIntent(Intent intent) {
    String token = FirebaseInstanceId.getInstance().getToken();
  }
}