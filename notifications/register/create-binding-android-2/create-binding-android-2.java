public class RegistrationIntentService extends IntentService {
  private BindingResource bindingResource;
  private void sendRegistrationToServer(String identity, String endpoint, String token) throws IOException {
    Call<Void> call = bindingResource.createBinding(identity, endpoint, token, "gcm");
    Response<Void> response = call.execute();
  }
}