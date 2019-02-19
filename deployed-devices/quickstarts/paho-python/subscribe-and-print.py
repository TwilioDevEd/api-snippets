import paho.mqtt.client as mqtt

#
# Use the actual location of your downloaded certificate and key.
#
pem_location = './CYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem'
key_location = './CYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.key.decrypted'

client = mqtt.Client(client_id="bob", clean_session=False)
client.tls_set(None, pem_location, key_location)


#
# Initialize TLS, specify trusted CA roots, client certifiate and key file locations.
# You may need to adjust the location of trusted Certificate Authorities depending on your OS.
# Typical locations are /etc/ssl/cert.pem and /usr/local/ssl/cert.pem
#
client.tls_set("/usr/local/ssl/cert.pem",
    certfile=pem_location, keyfile=key_location)

#
# Print out log messages and topic updates.
#
def on_log(mqttc, obj, level, string):
    print(string)

def on_message(client, userdata, msg):
    print(msg.topic + ' ' + str(msg.payload))

client.on_log = on_log
client.on_message = on_message

#
# Use qos=1 to get your device caught up right away.
#
client.connect('mqtt-sync.us1.twilio.com', 8883, 60)
client.subscribe('sync/docs/MyFirstDocument', qos=1)
client.loop_forever()
