public class RegistrationIntentService extends IntentService {
  private BindingResource bindingResource;
  
  @Override
  protected void onHandleIntent(Intent intent) {
    String token = FirebaseInstanceId.getInstance().getToken();
    String identity =  intent.getStringExtra(IDENTITY);
    String storedIdentity = sharedPreferences.getString(IDENTITY, null);
    if (newIdentity == null) {
      // If no identity was provided to us then we use the identity stored in shared preferences.
      // This can occur when the registration token changes.
      identity = storedIdentity;
    } else {
      // Otherwise we save the new identity in the shared preferences for future use.
      sharedPreferences.edit().putString(IDENTITY, binding.identity).commit();
    }
    sendRegistrationToServer(identity, token);
  }

  @Override
  public void onCreate(){
      super.onCreate();
      Retrofit retrofit = new Retrofit.Builder()
              .baseUrl(AppConstants.BASE_URL).addConverterFactory(JacksonConverterFactory.create(new ObjectMapper().setSerializationInclusion(JsonInclude.Include.NON_NULL)))
              .build();
      bindingResource = retrofit.create(BindingResource.class);
  }

  private CreateBindingResponse sendRegistrationToServer(String identity, String token) throws IOException {
    String endpoint = sharedPreferences.getString(ENDPOINT + newIdentity, null);
    Binding binding = new Binding(identity, endpoint, token, "fcm");
    Call<CreateBindingResponse> call = bindingResource.createBinding(binding);
    Response<CreateBindingResponse> response = call.execute();
    sharedPreferences.edit().putString(ENDPOINT + binding.identity, response.body().endpoint).commit();
  }
}
