## Example error
 
### LOG LINE
```
12/10/2020, 12:53:15 - Manager: Example error
```
 
### STACK TRACE
```
Error: Example error
    at new FlexError (http://localhost:8080/twilio-flex-sample.local.js:247646:28)
    at ErrorManagerImpl.../flex-ui/src/FlexError.ts.ErrorManagerImpl.createAndProcessError (http://localhost:8080/twilio-flex-sample.local.js:247776:21)
    at Function.<anonymous> (http://localhost:8080/twilio-flex-sample.local.js:281136:56)
    at step (http://localhost:8080/twilio-flex-sample.local.js:280953:23)
    at Object.next (http://localhost:8080/twilio-flex-sample.local.js:280934:53)
    at fulfilled (http://localhost:8080/twilio-flex-sample.local.js:280925:58)
```
### DETAILS
```
{
    "message": "Example error",
    "context": "Manager",
    "type": "app"
}
```
    
### SESSION DATA
```
{
    "config": {
        "sso": {
            "accountSid": "ACXXX"
        },
        "language": "en-US",
        "colorTheme": {
            "baseName": "DarkTheme"
        },
        "pluginService": {
            "enabled": true,
            "url": "https://flex.twilio.com/plugins"
        },
        "sdkOptions": {
            "worker": {
                "ebServer": "https://event-bridge.twilio.com/v1/wschannels",
                "wsServer": "wss://event-bridge.twilio.com/v1/wschannels"
            }
        },
        "rejectPendingReservations": true,
        "initialDeviceCheck": false,
        "notifications": {
            "browser": false
        },
        "outboundCalling": true,
        "warmTransfers": {
            "enabled": true
        },
        "fileAttachment": {
            "enabled": true
        },
        "enableReduxLogging": true,
        "version_compatibility": "yes",
        "serviceBaseUrl": "lava-sardine-2617.twil.io",
        "flexServiceUrl": "https://preview.twilio.com/Flex",
        "version_message": ""
    },
    "reactVersion": "16.5.2",
    "bundleType": "undefined",
    "plugins": [
        {
            "name": "Flex Debugger Plugin"
        },
        {
            "name": "Admin Plugin"
        },
        {
            "name": "Twilio SFDC Plugin"
        }
    ]
}
```
### LOGS
```
12:53:02 | info | Flex UI logger decorated
12:53:02 | info | Manager: Creating manager. flex-ui version: 1.22.0 core-ui version: 0.45.2
12:53:02 | debug | Manager: Flex UI bundle type - "undefined"
12:53:02 | debug | Manager: React version - "16.5.2"
12:53:02 | info | Manager: loginHandler created
12:53:02 | info | Manager: manager created
12:53:03 | info | Manager: remote config received
12:53:03 | info | Manager: features received
12:53:03 | info | SessionState: ssoLogin
12:53:03 | info | SessionState: initializing SDK clients
12:53:03 | debug | Insights Client initial connection state: connecting
12:53:04 | debug | SessionState: Chat SDK initialized
12:53:04 | debug | Insights Client new state: connected
12:53:04 | debug | ConferenceListenerManager initialize
12:53:04 | debug | Flex event emitter: connectionStateChanged ["connected"]
12:53:04 | debug | Worker WKb84ed967a09a49ef6df99f7f3ff82202 is now ready for work
12:53:04 | debug | Adding worker listeners
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH1dc7e5d6b2d24002a577e1c3fcc37821
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH2213ea12bcf441e9afc7d9f1bc50bb58
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH25a96a98d01f4abba021909ba1062ece
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH28757742b28341e6920415a72a4e4f0e
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH2bda53ceff444a61bec662ad607fd91d
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH2be535159e9f416487332056476facc8
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH376cd396b42945e4a5c7891ee51cd107
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH497dc22df8d64b6dafe97ff536a975f1
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH4fd09364bcfc4718a56f133cb881ec2e
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH518d4e60d04941cbb6ccc0df226fef3b
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH5d77326d154e4833b7b01f037b6d6df0
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH63039545e5564c8999a2d0cb69b956e7
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH65778f4b965c405e962c7b5baa37f247
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH672b45b49f674a64a652f99907554dc2
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH6c88dca732394f3783e42f4fe7e29025
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH7747737f8d4846e691c7f080cad01a2b
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH822b3b93c6704b208d4cc6a9b72b119f
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH858648c339b540838485c3f17ff61188
12:53:04 | warn | Task for chat channel does not exist - not loading yet CH91d2a4e24ff34eab83ee4d23abfaea86
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHa2983814a45f4b5bb6706593ccd3fdef
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHa8a6528878914150bdd2638a66d9bc89
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHaa43bd8f11d64d258bc656f5936a5860
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHbb8e36e752c3412e9cbac724fe5ed387
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHcc9ee6a6e09a4ec7ba98309a7a8bfd46
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHd452fddc918645f295c08d1efaf794da
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHd757dff9cdf7462a949425be6db417ef
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHe20b14fe5efc49688df06a5fb552db73
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHe65323d16d1b433c9872661f76804a42
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHf3102f2b8c0444c6ab2a919268907ae2
12:53:04 | warn | Task for chat channel does not exist - not loading yet CHf3a9a79317ec4448ac09cc348ab3a855
12:53:14 | info | PhoneState: handleDeviceReady {"handleDeviceChange":"[Function]","handleDeviceReady":"[Function]","handleDeviceError":"[Function]","handleDeviceConnect":"[Function]","handleDeviceDisconnect":"[Function]","handleDeviceIncoming":"[Function]","handleDeviceCancel":"[Function]","handleConnectionMute":"[Function]","_listening":true} {"_events":{"error":["[Function]","[Function]","[Function]"],"ready":["[Function]","[Function]"],"connect":"[Function]","disconnect":"[Function]","incoming":"[Function]","cancel":"[Function]"},"_eventsCount":6,"audio":{"_events":"[Object]","_eventsCount":3,"availableInputDevices":"[Object]","availableOutputDevices":"[Object]","_audioConstraints":null,"_inputDevice":null,"_inputStream":null,"_isPollingInputVolume":false,"_log":"[Object]","_unknownDeviceIndexes":"[Object]","_removeLostInput":"[Function]","_removeLostOutput":"[Function]","_updateAvailableDevices":"[Function]","_getUserMedia":"[Function]","_mediaDevices":"[Object]","_onActiveInputChanged":"[Function]","isOutputSelectionSupported":true,"isVolumeSupported":true,"disconnect":"[Function]","incoming":"[Function]","outgoing":"[Function]","_audioContext":"[Object]","_inputVolumeAnalyser":"[Object]","ringtoneDevices":"[Object]","speakerDevices":"[Object]"},"connections":[],"isInitialized":true,"sounds":{"disconnect":"[Function]"," [CUT 7930 characters]}
12:53:14 | debug | Instance method getTokenInfo of SSOLoginHandler is deprecated. Consider using a similar static method SSOLoginHandler.getTokenInfo() instead
12:53:14 | debug | SessionState: SDK clients initialized
12:53:14 | debug | Flex event emitter: userLoggedIn []
12:53:14 | info | Manager: ssoLogin done
12:53:14 | debug | loading plugins ...
12:53:15 | debug | downloading plugin: Flex Debugger Plugin version: 0.8.0
12:53:15 | debug | downloading plugin: Admin Plugin version: 1.115.0
12:53:15 | debug | downloading plugin: Twilio SFDC Plugin version: 1.4.0
12:53:15 | debug | loading plugin Flex Debugger Plugin function n(){var t;return i(this,n),(t=s(this,l(n).call(this,n.Name))).logManager=void 0,t}
12:53:15 | debug | successfully loaded plugin DebuggerPlugin
12:53:15 | debug | plugin Flex Debugger Plugin correctly downloaded from https://assets.flex.twilio.com/twilio/flex-debugger-plugin/0.8.0/flex-debugger-plugin.js
12:53:15 | debug | plugin Twilio SFDC Plugin correctly downloaded from https://assets.flex.twilio.com/twilio/flex-salesforce-integration/1.4.0/plugin-flex-salesforce-integration.js
12:53:15 | debug | loading plugin Admin Plugin function n(){return l(this,n),t.call(this,"AdminPlugin")}
12:53:15 | debug | successfully loaded plugin AdminPlugin
12:53:15 | debug | loading plugin Twilio SFDC Plugin function t(){return function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,t),function(e,t){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!t||"object"!==typeof t&&"function"!==typeof t?e:t}(this,(t.__proto__||Object.getPrototypeOf(t)).call(this,u))}
12:53:15 | debug | successfully loaded plugin Flex Salesforce Integration v1.4.0
12:53:15 | debug | plugin Admin Plugin correctly downloaded from https://assets.flex.twilio.com/twilio/flex-admin-plugin/1.115.0/flex-admin-plugin.js
12:53:15 | debug | Flex event emitter: pluginsLoaded []
12:53:15 | debug | Flex event emitter: flexError [{"getLogTime":"[Function]","content":{"context":"Manager","type":"app"},"time":{},"sessionData":{"config":"[Object]","reactVersion":"16.5.2","plugins":[{"name":"Flex Debugger Plugin"},{"name":"Admin Plugin"},{"name":"Twilio SFDC Plugin"}]},"logManagerTimestamp":"12:53:04"}]
```
