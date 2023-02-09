
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class Application {

    // Your Auth Token from twilio.com/user/account
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    // Initialize the validator
    public static void main(String[] args) throws Exception {

        // The Twilio request URL
        String url = "https://mycompany.com/myapp";

        // The post variables in Twilio's request
        Map<String, String> params = new HashMap<>();
        params.put("CallSid", "CA1234567890ABCDE");
        params.put("Caller", "+12349013030");
        params.put("Digits", "1234");
        params.put("From", "+12349013030");
        params.put("To", "+18005551212");

        TestUrl("GET", url, params, true);
        TestUrl("GET", url, params, false);
        TestUrl("POST", url, params, true);
        TestUrl("POST", url, params, false);
    }

    private static void TestUrl(
            String method, String url, Map<String, String> params, boolean valid) throws Exception {
        CloseableHttpClient client = HttpClients.createDefault();
        if("GET".equals(method)) {
            url += '?' + String.join("&", params.entrySet().stream().map(
                (Map.Entry<String, String> entry) -> String.format("%s=%s", entry.getKey(), entry.getValue())
            ).toArray(String[]::new));
            params = new HashMap<>();
        }

        String signature = ComputeSignature(valid ? url : "http://invalid.com", params);

        HttpUriRequest request;
        if("GET".equals(method)) {
            request = new HttpGet(url);
        } else {
            HttpPost post = new HttpPost(url);
            post.setEntity(new UrlEncodedFormEntity(
                Arrays.asList(params.entrySet().stream().map(
                        (Map.Entry<String, String> entry) -> new BasicNameValuePair(entry.getKey(), entry.getValue())
                ).toArray(NameValuePair[]::new))
            ));
            request = post;
        }
        request.setHeader("X-Twilio-Signature", signature);

        HttpResponse response = client.execute(request);

        System.out.printf("HTTP %s with %s signature returned %s\n", method, valid, response.getStatusLine());
    }

    private static String ComputeSignature(String url, Map<String, String> params) throws Exception{
        StringBuilder builder = new StringBuilder(url);
        if (params != null) {
            List<String> sortedKeys = new ArrayList(params.keySet());
            Collections.sort(sortedKeys);

            for (String key : sortedKeys) {
                builder.append(key);
                String value = params.get(key);
                builder.append(value == null ? "" : value);
            }
        }

        Mac mac = Mac.getInstance("HmacSHA1");
        mac.init(new SecretKeySpec(AUTH_TOKEN.getBytes(), "HmacSHA1"));
        byte[] rawHmac = mac.doFinal(builder.toString().getBytes(StandardCharsets.UTF_8));
        return DatatypeConverter.printBase64Binary(rawHmac);
    }
}
