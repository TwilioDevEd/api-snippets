public class Binding {
    public String identity;
    public String endpoint;
    public String Address;
    public String BindingType;

    public Binding(String identity, String endpoint, String address, String bindingType) {
        this.identity = identity;
        this.endpoint = endpoint;
        Address = address;
        BindingType = bindingType;
    }
}
