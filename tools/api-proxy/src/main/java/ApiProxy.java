import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.MappingBuilder;
import com.github.tomakehurst.wiremock.client.UrlMatchingStrategy;
import com.github.tomakehurst.wiremock.client.WireMock;

import lib.DocParser;
import lib.ResourceModel;
import lib.ResourceParser;

public class ApiProxy {
  public static void main(String[] args) {
    WireMockServer wireMockServer = new WireMockServer(wireMockConfig().port(8089).httpsPort(443)
        .keystorePath("keystore/twilio-store.jks").keystorePassword("twilioFake"));
    wireMockServer.start();
    System.out.println("Starting Server. Please wait...");
    WireMock wireMock = new WireMock("localhost", 8089);

    DocParser parser = new DocParser(new File("api-descriptors"));
    ArrayList resourceList = parser.getResourceList();

    for (Object resource : resourceList) {
      ResourceModel resourceModel = (ResourceModel) resource;
      HashMap<String, HashMap<String, Object>> resourceTransactions =
          resourceModel.getResourceTransactions();

      for (HashMap<String, Object> transactionProperties : resourceTransactions.values()) {
        String resourceUrl = (String) transactionProperties.get(ResourceParser.RESOURCE_URL);
        String anyResourcePattern = "[A-Z]{2,}\\w{32}";

        resourceUrl = resourceUrl.replace(".", "\\.").replace("/", "\\/");
        resourceUrl = resourceUrl.replaceAll(anyResourcePattern, "\\\\w+");

        String methodString = (String) transactionProperties.get(ResourceParser.RESOURCE_METHOD);
        methodString = methodString.toUpperCase();

        UrlMatchingStrategy urlMatching = urlMatching(resourceUrl);
        MappingBuilder method = null;

        switch (methodString) {
          case "POST":
            method = post(urlMatching);
            break;
          case "GET":
            method = get(urlMatching);
            break;
          case "DELETE":
            method = delete(urlMatching);
            break;
          default:
            System.out.println("No method specified");
        }

        JSONObject contentJson =
            (JSONObject) transactionProperties.get(ResourceParser.RESOURCE_CONTENT);
        String responseContent = "{}";
        if (contentJson != null) {
          responseContent = (String) contentJson.toJSONString();
        }
        wireMock.register(method.willReturn(
            aResponse().withHeader("Content-Type", "application/json").withBody(responseContent)));
      }
    }
    System.out.println("Server Ready!");
  }
}
