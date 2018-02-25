import paho.mqtt.client as mqtt
import json
from datetime import datetime

#
# Use the actual location of your downloaded certificate and key.
#
pem_location = './CYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem'
key_location = './CYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.key.decrypted'

client = mqtt.Client(client_id="bob", clean_session=False)

#
# Initialize TLS, specify trusted CA roots, client certifiate and key file locations.
# You may need to adjust the location of trusted Certificate Authorities depending on your OS.
# Typical locations are /etc/ssl/cert.pem and /usr/local/ssl/cert.pem
#
client.tls_set("/usr/local/ssl/cert.pem",
    certfile=pem_location, keyfile=key_location)

#
# Print out log messages.
#
def on_log(mqttc, obj, level, string):
    print(string)

client.on_log = on_log

#
# Publish current date/time to a new document, use QoS 1 to confirm delivery.
#
client.connect('mqtt-sync.us1.twilio.com', 8883, 60)
client.publish('sync/docs/HelloWorld',
    json.dumps({"hello": datetime.now().isoformat()}), qos=1)
