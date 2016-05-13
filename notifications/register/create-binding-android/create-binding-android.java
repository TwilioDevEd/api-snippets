public interface BindingResource {
  @FormUrlEncoded
  @POST("/register")
  Call<Void> createBinding(@Field("identity") String identity, @Field("endpoint")
      String endpoint, @Field("Address") String address, @Field("BindingType") String bindingType);
}
