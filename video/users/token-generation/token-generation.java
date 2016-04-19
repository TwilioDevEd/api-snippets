private class GetCapabilityTokenAsyncTask extends AsyncTask<String, Void, String> {
    @Override
    protected void onPostExecute(String result) {
        super.onPostExecute(result);
        /*
        * Initialize the Twilio Conversations SDK
        */
        initializeTwilioSdk();

        /*
        * Set the initial state of the UI
        */
        setCallAction();
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
    }

    @Override
    protected String doInBackground(String... params) {
        try {
            String response = HttpHelper.httpGet(params[0]);
            JSONObject obj = new JSONObject(response);
            ACCESS_TOKEN = obj.getString("token");
        } catch (Exception e) {
            e.printStackTrace();
        }
            return ACCESS_TOKEN;
    }
}
