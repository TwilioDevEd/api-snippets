public class RegistrationIntentService extends IntentService {
  private BindingResource bindingResource;

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
