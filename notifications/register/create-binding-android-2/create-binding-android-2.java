public class RegistrationIntentService extends IntentService {
  private BindingResource bindingResource;
  private void sendRegistrationToServer(String identity, String endpoint, String token) throws IOException {
    BindingRegistration bindingRegistration = new BindingRegistration(
      identity, endpoint, token, "gcm");
    Call<Void> call = bindingResource.createBinding(bindingRegistration);
    Response<Void> response = call.execute();
  }
}