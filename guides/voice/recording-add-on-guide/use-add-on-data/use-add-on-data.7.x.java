import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.ReadContext;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.twilio.twiml.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public class RecordingController {

    private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    @RequestMapping(value = "/voice",
            produces = "application/xml",
            method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> voice() throws TwiMLException {
        // Start our TwiML response
        VoiceResponse voiceResponse = new VoiceResponse.Builder()
                .say(new Say
                        .Builder("Hi! I want to know what do you think about coding.")
                        .build())
                .record(new Record.Builder().maxLength(10).action("/recording").build())
                .hangup(new Hangup())
                .build();

        return okResponse(voiceResponse);
    }

    @RequestMapping(value = "/recording",
            produces = "application/xml",
            method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> recording(@RequestParam("RecordingUrl") String recordingUrl) throws TwiMLException {
        System.out.println(recordingUrl);

        // Start our TwiML response
        VoiceResponse voiceResponse = new VoiceResponse.Builder()
                .say(new Say
                        .Builder("Thanks for howling... take a listen to what you howled.")
                        .build())
                .play(new Play.Builder(recordingUrl).build())
                .say(new Say.Builder("Goodbye.").build())
                .build();

        return okResponse(voiceResponse);
    }
    @RequestMapping(value = "/recording",
            produces = "application/xml",
            consumes = "application/json",
            method = {RequestMethod.POST, RequestMethod.PUT})
    public ResponseEntity<String> callback(@RequestParam("AddOns") String addOns) throws UnirestException {
        // If the Watson Speech to Text add-on found nothing, return immediately
        ReadContext addonsContext = JsonPath.parse(addOns);
        Map<String, Object> results = addonsContext.read("$.results");
        if(!results.containsKey("ibm_watson_speechtotext")) {
            return new ResponseEntity<>(
                    "Add Watson Speech to Text add-on in your Twilio console", HttpStatus.OK);
        }

        // Retrieve the Watson Speech to Text add-on results
        String payloadUrl = addonsContext.read("$.results['ibm_watson_speechtotext'].payload[0].url");
        HttpResponse<String> response = Unirest
                .get(payloadUrl)
                .basicAuth(ACCOUNT_SID, AUTH_TOKEN)
                .asString();

        DocumentContext speechToTextContext = JsonPath.parse(response.getBody());
        List<String> transcripts = speechToTextContext
                .read("$.results[0].results[*].alternatives[0].transcript");

        return new ResponseEntity<>(String.join("", transcripts), HttpStatus.OK);
    }

    private ResponseEntity<String> okResponse(VoiceResponse voiceResponse) throws TwiMLException {
        return new ResponseEntity<>(voiceResponse.toXml(), getHttpHeaders(), HttpStatus.OK);
    }

    private HttpHeaders getHttpHeaders() {
        final HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_XML);
        return httpHeaders;
    }
}
