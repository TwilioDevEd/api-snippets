package com.twilio.notify.quickstart.notifyapi.model;

/**
 * Created by vmuller on 4/19/17.
 */
public class CreateBindingResponse {
    public String message;
    public String endpoint;

    public String getMessage() {
        return message;
    }

    public String getEndpoint() {
        return endpoint;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }
}
