public class BindingRegistration {
    private String identity;
    private String endpoint;
    private String address;
    private String bindingType;

    public BindingRegistration(String identity, String endpoint, String address, String bindingType) {
        this.identity = identity;
        this.endpoint = endpoint;
        this.address = address;
        this.bindingType = bindingType;
    }
    
    //getters and setters
    //...
}