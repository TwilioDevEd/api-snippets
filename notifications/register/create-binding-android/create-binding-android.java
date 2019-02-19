public interface BindingResource {
    @POST("/register")
    Call<CreateBindingResponse> createBinding(@Body Binding binding);
}
