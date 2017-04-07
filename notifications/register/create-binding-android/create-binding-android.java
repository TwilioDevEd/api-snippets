public interface BindingResource {
    @POST("/register")
    Call<Void> createBinding(@Body Binding binding);
}

