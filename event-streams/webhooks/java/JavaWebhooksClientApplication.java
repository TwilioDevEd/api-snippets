package com.twilio.eventstreams.example.javawebhooksclient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twilio.security.RequestValidator;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.net.URISyntaxException;

@SpringBootApplication
@RestController
public class JavaWebhooksClientApplication {

	private final RequestValidator validator = new RequestValidator(
			System.getenv("TWILIO_AUTH_TOKEN")
	);

	private final String publicUrl = System.getenv("PUBLIC_URL") + "/my-webhook-url";

	public static void main(String[] args) {
		SpringApplication.run(JavaWebhooksClientApplication.class, args);
	}

	@PostMapping("/my-webhook-url")
	public String webhook(
			HttpServletRequest request,
			@RequestBody String rawBody,
			@RequestHeader("X-Twilio-Signature") String signature
	) throws URISyntaxException, JsonProcessingException {
		System.out.println();
		System.out.println("------------------------------------------------");

		// validate the signature
		if (!validator.validate(publicUrl+"?"+request.getQueryString(), rawBody, signature)){
			System.out.println("Invalid signature. Discarded event.");
			return "Invalid signature";
		}
		System.out.println("Valid signature. Processing event.");

		// parse the body
		JsonNode body = new ObjectMapper().readTree(rawBody);
		for (JsonNode event: body) {
			System.out.println("Received event");
			System.out.println("\tType: " + event.get("type"));
			System.out.println("\tTimestamp: " + event.get("time").asText());
			System.out.println("\tRaw event: " + event);
		}
		System.out.println("------------------------------------------------");
		System.out.println();
		return "Ok";
	}
}
