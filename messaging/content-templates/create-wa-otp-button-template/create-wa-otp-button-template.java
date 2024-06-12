package Examples;

import com.twilio.rest.content.v1.Content;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Map;

public class WhatsAppAuthentication {
    public static String CreateTemplate() {
        var waAuth = new Content.WhatsappAuthentication();

        var action1 = new Content.AuthenticationAction();
        action1.setType(Content.AuthenticationActionType.COPY_CODE);
        action1.setCopyCodeText("Copy Code");

        waAuth.setActions(Arrays.asList(action1));
        waAuth.setAddSecurityRecommendation(true);
        waAuth.setCodeExpirationMinutes(new BigDecimal(10));

        var types = new Content.Types();
        types.setWhatsappAuthentication(waAuth);

        var createRequest = new Content.ContentCreateRequest("en", types);
        createRequest.setFriendlyName("whatsapp_otp");

        var content = Content.creator(createRequest).create();

        return content.getSid();
    }
}
