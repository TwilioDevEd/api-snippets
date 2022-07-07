// Install the Java helper library from twilio.com/docs/java/install
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twilio.http.*;
import com.twilio.rest.Domains;
import org.apache.commons.io.FileUtils;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class GetCompositionMedia {

  // Find your Account SID and Auth Token at twilio.com/console
  // and set the environment variables. See http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main( String[] args ) throws IOException{
    // Disable HttpClient follow redirect by default
    HttpClientBuilder clientBuilder = HttpClientBuilder.create();
    clientBuilder.disableRedirectHandling();
    
    // Initialize the client
    TwilioRestClient restClient = new TwilioRestClient
            .Builder(ACCOUNT_SID, AUTH_TOKEN)
            .httpClient(new NetworkHttpClient(clientBuilder))
            .build();

    // Retrieve media location
    String compositionSid = "CJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    Request request = new Request(
            HttpMethod.GET,
            Domains.VIDEO.toString(),
            "/v1/Compositions/" + compositionSid + "/Media?Ttl=3600",
            restClient.getRegion());

    Response response = restClient.request(request);

    ObjectMapper mapper = new ObjectMapper();
    JsonNode actualObj = mapper.readTree(response.getContent());
    String mediaLocation = actualObj.get("redirect_to").asText();

    // For example, download the media to a local file
    FileUtils.copyURLToFile(new URL(mediaLocation), new File("myFile.mp4"));
  }
}
