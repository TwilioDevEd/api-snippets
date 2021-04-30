package guide;

import com.twilio.security.RequestValidator;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TwilioRequestValidatorFilter implements Filter {

    private RequestValidator requestValidator;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        requestValidator = new RequestValidator(System.getenv("TWILIO_AUTH_TOKEN"));
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        boolean isValidRequest = false;
        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;

            // Concatenates the request URL with the query string
            String pathAndQueryUrl = getRequestUrlAndQueryString(httpRequest);
            // Extracts only the POST parameters and converts the parameters Map type
            Map<String, String> postParams = extractPostParams(httpRequest);
            String signatureHeader = httpRequest.getHeader("X-Twilio-Signature");

            isValidRequest = requestValidator.validate(
                    pathAndQueryUrl,
                    postParams,
                    signatureHeader);
        }

        if(isValidRequest) {
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse)response).sendError(HttpServletResponse.SC_FORBIDDEN);
        }
    }

    @Override
    public void destroy() {
        // Nothing to do
    }

    private Map<String, String> extractPostParams(HttpServletRequest request) {
        String queryString = request.getQueryString();
        Map<String, String[]> requestParams = request.getParameterMap();
        List<String> queryStringKeys = getQueryStringKeys(queryString);

        return requestParams.entrySet().stream()
                .filter(e -> !queryStringKeys.contains(e.getKey()))
                .collect(Collectors.toMap(e -> e.getKey(), e -> e.getValue()[0]));
    }

    private List<String> getQueryStringKeys(String queryString) {
        if(queryString == null || queryString.length() == 0) {
            return Collections.emptyList();
        } else {
            return Arrays.stream(queryString.split("&"))
                    .map(pair -> pair.split("=")[0])
                    .collect(Collectors.toList());
        }
    }

    private String getRequestUrlAndQueryString(HttpServletRequest request) {
        String queryString = request.getQueryString();
        String requestUrl = request.getRequestURL().toString();
        if(queryString != null && !queryString.equals("")) {
            return requestUrl + "?" + queryString;
        }
        return requestUrl;
    }
}
