exports.handler = function(context, event, callback) {
    const client = context.getTwilioClient();
    const sessionName='My Session';
    const participantIdentifier1='+15555555555'; // replace with your first participant's private phone number
    const participantIdentifier2='+16666666666'; // replace with your second participant's private phone number
    const serviceSid='myServiceSid'; // replace with your Service Sid
    
    var sessionSid;
    function createParticipant(identifier,session) {
        return client.proxy
                .services(serviceSid)
                .sessions(session)
                .participants.create({
                    identifier: identifier,
                })
                .then(response => {
                console.log(response);
        })
        .catch(err => {
                console.log(err);
        });
    }
    
    function createSession(name){
        return client.proxy
                .services(serviceSid)
                .sessions.create({ uniqueName: name })
                .then(response => {
                    sessionSid=response.sid;
                })
            .catch(err => {
                    console.log(err);
            });
    }
    
    //create a session and add two participants to the session
    Promise.all([createSession(sessionName)]).then( function() {
            Promise.all([createParticipant(participantIdentifier1, sessionSid), createParticipant(participantIdentifier2, sessionSid)])
                .then(function () {
                    callback(null, 'OK');
                })
                .catch(console.error);
        }).catch(console.error);
};