const fileFormatter = require('../lib/fileFormatter');

describe('Break lines', () => {

  describe('in Java', ()=> {
    it('to more than 2 lines ', () => {
      const line =
'Message message = new Message.Builder("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").action("/SmsHandler.php").method(Method.POST).build();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines[0]).toBe('Message message = new Message');
      expect(newLines[1]).toBe('    .Builder("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")');
      expect(newLines[2]).toBe('    .action("/SmsHandler.php").method(Method.POST).build();');
    });

    it('that cannot be broken down as it does not have breaking characters', () => {
      const line =
'Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(1);
      expect(newLines[0]).toBe('Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");');
    });

    it('in two lines', () => {
      const line =
'Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").something();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe('Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")');
      expect(newLines[1]).toBe('    .something();');
    });


    it('with string longer than 80 characters in it', () => {
      const line =
'Play play = new Play.Builder("http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3").build();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe('Play play = new Play');
      expect(newLines[1]).toBe('    .Builder("http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3").build();');
    });

    it('that is half formatted and with proper indentation', () => {
      const line =
'    .statusCallback("https://myapp.com/calls/events").statusCallbackMethod("POST").build();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe('    .statusCallback("https://myapp.com/calls/events")');
      expect(newLines[1]).toBe('    .statusCallbackMethod("POST").build();');
    });

    it('in 3 taking into account line indentation - 1', () => {
      const line =
'        Conference conference = new Conference.Builder("moderated-conference-room").startConferenceOnEnter("false").build();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(3);
      expect(newLines[0]).toBe('        Conference conference = new Conference');
      expect(newLines[1]).toBe('            .Builder("moderated-conference-room")');
      expect(newLines[2]).toBe('            .startConferenceOnEnter("false").build();');

    });

    it('in 4 taking into account line indentation - 2', () => {
      const line =
'        Client client = new Client.Builder("joey").statusCallbackEvent("initiated ringing answered completed").statusCallback("https://myapp.com/calls/events").statusCallbackMethod("POST").build();'

      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(4);
      expect(newLines[0]).toBe('        Client client = new Client.Builder("joey")');
      expect(newLines[1]).toBe('            .statusCallbackEvent("initiated ringing answered completed")');
      expect(newLines[2]).toBe('            .statusCallback("https://myapp.com/calls/events")');
      expect(newLines[3]).toBe('            .statusCallbackMethod("POST").build();');
    });
  });

  describe('in PHP', ()=> {
    it('using comma as breaking character - 1', () => {
      const line =
"$dial->conference('moderated-conference-room', ['startConferenceOnEnter' => 'false']);"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe("$dial->conference('moderated-conference-room',");
      expect(newLines[1]).toBe("    ['startConferenceOnEnter' => 'false']);");
    });
    it('using comma as breaking character - 1', () => {
      const line =
"$dial->conference('EventedConf', ['statusCallback' => 'https://myapp.com/events', 'statusCallbackEvent' => 'start end join leave mute hold']);"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(3);
      expect(newLines[0]).toBe("$dial->conference('EventedConf',");
      expect(newLines[1]).toBe("    ['statusCallback' => 'https://myapp.com/events',");
      expect(newLines[2]).toBe("    'statusCallbackEvent' => 'start end join leave mute hold']);");
    });

    it('unbreakable line', () => {
      const line =
"$response->play('http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3');"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(1);
      expect(newLines[0]).toBe("$response->play('http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3');");
    });
  });
});
