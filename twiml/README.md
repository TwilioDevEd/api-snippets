# TwiML Snippets

This directory contains code snippets related to TwiML functionality in the Helper Libraries. These snippets can be seen in the code rail of the [Twilio TwiML Docs](https://www.twilio.com/docs/voice/twiml/dial).

## Directory structure

```
twiml/  <-- The TwiML snippet directory 
├─ voice/   <-- The product group
│  ├─ say/   <-- The name of the TwiML noun or verb
│  │  ├─ say-language-voice/ <-- The name of a TwiML snippet
│  │  │  ├─ output/
│  │  │  │  ├─ say-language-voice.twiml
│  │  │  ├─ say-language-voice.5.x.js
│  │  │  ├─ say-language-voice.5.x.rb
│  │  │  ├─ say-language-voice.6.x.cs
│  │  │  ├─ say-language-voice.8.x.php
│  │  │  ├─ say-language-voice.9.x.py
│  │  │  ├─ say-language-voice.10.x.java
│  │  │  ├─ say-language-voice.<sdk-version>.x.<language>
│  │  │  ├─ meta.json
```

Each TwiML element (e.g. `<Dial>` or `<Number>`) has a sub-directory within the parent product group directory (e.g. `voice/` or `messaging/`). 

## TwiML Snippets

A TwiML "snippet" is a set of Helper Library code samples that will all output the same TwiML. 

Each "snippet" is contained in a directory (e.g. `twiml/voice/say/say-language-voice/` from the diagram above) with the following:
- an `output/` directory that contains a single file ending in `.twiml`
- several Helper Library code samples ending in the `<sdk-version>.x.<language>`, e.g. `say-language-voice.5.x.js`
- a `meta.json` file

The snippet directory, the `.twiml` file, and all of the Helper Library code sample files have the same name. 

### The `.twiml` file

The `.twiml` file is the raw TwiML that each Helper Library code example outputs.

Example from `twiml/voice/stream/stream-1/output/stream-1.twiml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Start>
        <Stream name="Example Audio Stream" url="wss://mystream.ngrok.io/audiostream" />
    </Start>
</Response>

```

### The Helper Library code samples

The Helper Library code samples are the files with extensions like `5.x.js` and `9.x.java`. This is the Helper Library code that, when executed, will output the TwiML in the `.twiml` file. 

For example, the `twiml/voice/stream/stream-1/stream-1.5.x.js` file is the `twilio-node` v4.x code that outputs the `<Connect><Stream>` TwiML from above: 

```js
const VoiceResponse = require('twilio').twiml.VoiceResponse;

const response = new VoiceResponse();
const start = response.start();
start.stream({
    name: 'Example Audio Stream',
    url: 'wss://mystream.ngrok.io/audiostream'
});

console.log(response.toString());
```

- The Helper Library code samples must have file extensions that match the version of the Helper Library. For example, code samples for version 4.x of the `twilio-node` Helper Library end in `5.x.js`, while version 3.x code samples end in `3.x.js`. 

- Use the [twiml-generator](https://github.com/TwilioDevEd/twiml-generator) project to generate the Helper Library code (it "backwards engineers" the code samples from the intended TwiML output). 


### The meta.json file

The `meta.json` file contains a JSON object with two fields: `title` and `type`. 

Use a descriptive and unique `title`, because that's how Wagtail users will find the appropriate snippets. 

For TwiML snippets, the `type` is always `server`.

Example:

```json
{
    "title": "Start a MediaStream",
    "type": "server"
}
```

## Create a new set of TwiML snippets

Use the [twiml-generator](https://github.com/TwilioDevEd/twiml-generator) project to generate the Helper Library code samples. 

**Use the verify command in the twiml-generator project to test the code**

:warning: Do not put untested TwiML code samples into this repo :warning:

This leads to a bad experience for our customers, more Support tickets, and more time engaging with DevEd and R&D to verify expected behavior.

### Name the TwiML snippet(s)

Give the snippet files a *descriptive* name that includes the TwiML element name and any attributes used.

Many existing TwiML snippets are named things like `say-1` and `say-2`, which makes it time-consuming to find relevant snippets. Make finding TwiML snippets easier for yourself and other Twilions by descriptively naming the snippets. 

- :no_entry: NO: `say-1`

- :white_check_mark: YES: `say-voice-language`
    - (this indicates that the TwiML snippet uses `<Say>` with the `voice` and `language` attributes)

## Updating snippets for new Helper Library versions

If you are updating snippets for a new major version of a Helper Library, **Do not just change the file extensions on existing files.** Even if the code is identical, create a new file with the appropriate file extension for the new Helper Library version. 

Customers using previous versions still need code samples for their version of the Helper Library. If they don't see their version in the docs, they'll often open up a Support ticket or leave a bad rating on a docs page! Let's avoid this. 

:warning: AND THEN TEST THE CODE SAMPLES TO VERIFY THAT THEY OUTPUT THE EXPECTED TWIML WITHOUT ERROR :warning:

BE AN OWNER: Please don't leave it up to customers or other Twilions to find out that a code sample you added/edited doesn't work. 

## Adding a TwiML Snippet in the CMS (Wagtail)

Use the **Code sample** content block to insert a TwiML snippet into a doc. 

Search for the TwiML snippet via the `title` field in its `meta.json` file. 

## A note on `twilio-go`

Golang examples don't yet exist in this repo. They will be added once the `twilio-go` library's TwiML functionality is more in line with the rest of the Helper Libraries. 
