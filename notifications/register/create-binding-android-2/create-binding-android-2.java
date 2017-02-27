public class RegistrationIntentService extends IntentService {
  private BindingResource bindingResource;
  
  @Override
  public void onCreate(){
      super.onCreate();
      Retrofit retrofit = new Retrofit.Builder()
              .baseUrl(AppConstants.BASE_URL).addConverterFactory(JacksonConverterFactory.create())
              .build();
      bindingResource = retrofit.create(BindingResource.class);
  }
  
  private void sendRegistrationToServer(String identity, String endpoint, String token) throws IOException {
    Binding binding = new Binding(identity, endpoint, token, "fcm");
    Call<Void> call = bindingResource.createBinding(binding);
    Response<Void> response = call.execute();
  }
}