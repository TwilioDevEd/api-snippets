const fileFormatter = require('../lib/fileFormatter');

describe('Break lines', () => {

  describe('Java', ()=> {
    it('breaks line 1', () => {
      const line =
'Message message = new Message.Builder("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").action("/SmsHandler.php").method(Method.POST).build();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines[0]).toBe('Message message = new Message');
      expect(newLines[1]).toBe('.Builder("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")');
      expect(newLines[2]).toBe('.action("/SmsHandler.php").method(Method.POST).build();');
    });

    it('breaks line 2', () => {
      const line =
'Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(1);
      expect(newLines[0]).toBe('Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");');
    });

    it('breaks line 3', () => {
      const line =
'Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").something();'
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe('Message message = new Message("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")');
      expect(newLines[1]).toBe('.something();');
    });
  });

  describe('PHP', ()=> {
    it('breaks line 1', () => {
      const line =
"$dial->conference('moderated-conference-room', ['startConferenceOnEnter' => 'false']);"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(2);
      expect(newLines[0]).toBe("$dial->conference('moderated-conference-room',");
      expect(newLines[1]).toBe("['startConferenceOnEnter' => 'false']);");
    });
    it('breaks line 2', () => {
      const line =
"$dial->conference('EventedConf', ['statusCallback' => 'https://myapp.com/events', 'statusCallbackEvent' => 'start end join leave mute hold']);"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(3);
      expect(newLines[0]).toBe("$dial->conference('EventedConf',");
      expect(newLines[1]).toBe("['statusCallback' => 'https://myapp.com/events',");
      expect(newLines[2]).toBe("'statusCallbackEvent' => 'start end join leave mute hold']);");
    });

    it('breaks line 3', () => {
      const line =
"$response->play('http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3');"
      const newLines = fileFormatter.trimLine(line, []);
      expect(newLines.length).toBe(1);
      expect(newLines[0]).toBe("$response->play('http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3');");
    });
  });
});
