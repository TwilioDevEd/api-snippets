from flask import Flask, request, redirect, session
import twilio.twiml

# The session object makes use of a secret key.
SECRET_KEY = 'a secret key'
app = Flask(__name__)
app.config.from_object(__name__)

# Try adding your own number to this list!
callers = {
    "+14158675309": "Rey",
    "+14158675310": "Finn",
    "+14158675311": "Chewy",
}

@app.route("/", methods=['GET', 'POST'])
def hello():
    """Respond with the number of text messages sent between two parties."""

    counter = session.get('counter', 0)

    # increment the counter
    counter += 1

    # Save the new counter value in the session
    session['counter'] = counter

    from_number = request.values.get('From')
    if from_number in callers:
        name = callers[from_number]
    else:
        name = "Friend"

    message = "".join([name, " has messaged ", request.values.get('To'), " ", 
        str(counter), " times."])
    resp = twilio.twiml.Response()
    resp.message(message)

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)