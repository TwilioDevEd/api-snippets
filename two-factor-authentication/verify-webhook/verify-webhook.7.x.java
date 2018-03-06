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
  
    private boolean verify(HttpServletRequest request, String authyApiKey)
            throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        String forwardedProtocol = request.getHeader("X-Forwarded-Proto");
        String protocol = forwardedProtocol != null ? forwardedProtocol :
                request.getScheme();
        String url = String.format("%s://%s%s", protocol,
                request.getServerName(), request.getServletPath());

        // Fetch Json body
        String body = IOUtils.toString(request.getReader());
        Map<String, Object> bodyJson = objectMapper.readValue(body,
                new TypeReference<Map<String, Object>>() {
                });

        // Flatten and sort JSON elements
        String flattenJson = bodyJson.entrySet()
                .stream()
                .flatMap(FlatMap::flatten)
                .map(e -> e.getKey() + "=" + e.getValue())
                .sorted()
                .collect(Collectors.joining("&"));

        // Read the nonce from the request
        String nonce = request.getHeader("X-Authy-Signature-Nonce");

        // Join all the request bits using '|'
        String data = String.format("%s|%s|%s|%s",
                nonce,
                request.getMethod(),
                url,
                flattenJson);

        try {
            // Compute the signature
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(authyApiKey.getBytes(),
                    "HmacSHA256");
            sha256_HMAC.init(secret_key);
            String hash = Base64
                    .getEncoder()
                    .encodeToString(sha256_HMAC.doFinal(data.getBytes()));

            // Extract the actual request signature
            String signature = request.getHeader("X-Authy-Signature");

            // Compare the request signature with your computed signature
            return hash.equals(signature);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            return false;
        }
    }
}

class FlatMap {

    private static String openBracket;
    private static String closeBracket;

    static {
        try {
            openBracket = encode("[", "UTF-8");
            closeBracket = encode("]", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private static String prependKeyName(String keyName, String prefix) {
        StringBuffer result = new StringBuffer();
        result.append(prefix);
        int indexOfOpenBracket = keyName.indexOf(openBracket);
        if(indexOfOpenBracket == -1) {
            indexOfOpenBracket = keyName.length();
        }
        result.append(openBracket);
        result.append(keyName.substring(0, indexOfOpenBracket));
        result.append(closeBracket);
        result.append(keyName.substring(indexOfOpenBracket));
        return result.toString();

    }

    public static Stream<Map.Entry<?, ?>> flatten(Map.Entry<?, ?> e) {
        Object value = e.getValue();
        if (value instanceof Map<?, ?>) {
            return ((Map<?, ?>) value).entrySet()
                    .stream()
                    .flatMap(FlatMap::flatten)
                    .map(el -> {
                        String newKeyName = FlatMap.prependKeyName(
                                (String) el.getKey(), (String) e.getKey());
                        return new AbstractMap.SimpleEntry<>(newKeyName, el.getValue());
                    });
        } else if(value == null) {
            return Stream.of(new AbstractMap.SimpleEntry<>(e.getKey(), ""));
        } else if(value instanceof String) {
            try {
                String encodedValue = URLEncoder.encode((String) value, "UTF-8");
                return Stream.of(new AbstractMap.SimpleEntry<>(e.getKey(),
                        encodedValue.replace(" ", "+")));
            } catch (UnsupportedEncodingException exception) {
                throw new RuntimeException(exception);
            }
        }
        return Stream.of(e);
    }
}
