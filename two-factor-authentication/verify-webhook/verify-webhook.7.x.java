import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class CallbackVerifier {

    private boolean verify(HttpServletRequest request, String apiKey) {
        String url = String.format("%s://%s%s", request.getScheme(),
                request.getServerName(), request.getServletPath());

        // Sort the params
        Map<String, String[]> sortedParameters =
                new TreeMap<>(request.getParameterMap());

        // Join and encode parameters
        List<String> flattenedParameters = new ArrayList<>();
        for (Map.Entry<String, String[]> entry : sortedParameters.entrySet()) {
            for (String value : entry.getValue()) {
                flattenedParameters.add(entry.getKey() + "=" + value);
            }
        }
        String parameterString = String.join("&", flattenedParameters);

        // Read the nonce from the request
        String nonce = request.getHeader("x-authy-signature-nonce");

        // Join all the request bits using '|'
        String data = String.format("%s|%s|%s|%s",
                                    nonce,
                                    request.getMethod(),
                                    url,
                                    parameterString);

        try {
            // Compute the signature
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(apiKey.getBytes(),
                    "HmacSHA256");
            sha256_HMAC.init(secret_key);
            String hash = Base64
                    .getEncoder()
                    .encodeToString(sha256_HMAC.doFinal(data.getBytes()));

            // Extract the actual request signature
            String signature = request.getHeader("x-authy-signature");

            // Compute the request signature with your computed signature
            return hash.equals(signature);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            return false;
        }
    }
}
