import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import lib.DocParser;

import java.io.File;

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;

public class ApiProxy {
  public static void main(String[] args) {
    WireMockServer wireMockServer = new WireMockServer(
        wireMockConfig().port(8089).httpsPort(443).keystorePath("keystore/twilio-store.jks")
            .keystorePassword(
                "twilioFake")); //No-args constructor will start on port 8080, no HTTPS
    wireMockServer.start();
    WireMock wireMock = new WireMock("localhost", 8089);
    wireMock.register(post(urlMatching("\\/2010-04-01\\/Accounts\\/AC.{32}\\/Calls(.json)?"))
        .willReturn(aResponse().withHeader("Content-Type", "application/json").withBody(
            "{" + "\"account_sid\": \"ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\","
                + "\"annotation\": null," + "\"answered_by\": null,"
                + "\"api_version\": \"2010-04-01\"," + "\"caller_name\": null,"
                + "\"date_created\": \"Tue, 31 Aug 2010 20:36:28 +0000\","
                + "\"date_updated\": \"Tue, 31 Aug 2010 20:36:44 +0000\","
                + "\"direction\": \"inbound\"," + "\"duration\": \"15\","
                + "\"end_time\": \"Tue, 31 Aug 2010 20:36:44 +0000\","
                + "\"forwarded_from\": \"+141586753093\"," + "\"from\": \"+14158675308\","
                + "\"from_formatted\": \"(415) 867-5308\"," + "\"group_sid\": null,"
                + "\"parent_call_sid\": null,"
                + "\"phone_number_sid\": \"PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\","
                + "\"price\": \"-0.03000\"," + "\"price_unit\": \"USD\","
                + "\"sid\": \"CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\","
                + "\"start_time\": \"Tue, 31 Aug 2010 20:36:29 +0000\","
                + "\"status\": \"completed\"," + "\"subresource_uris\": {"
                + "    \"notifications\": \"/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications.json\","
                + "    \"recordings\": \"/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings.json\""
                + "}," + "\"to\": \"+14158675309\"," + "\"to_formatted\": \"(415) 867-5309\","
                + "\"uri\": \"/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json\""
                + "}")));
    System.out.println("Starting server...");
    DocParser parser = new DocParser(new File("api-descriptors"));
    System.out.println(parser.getEndpointList());
  }
}
