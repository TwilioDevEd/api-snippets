String url = "https://yourdomain.twil.io/joke";
StringRequest request = new StringRequest(Request.Method.GET,
    url,
    new Response.Listener<String>() {
        @Override
        public void onResponse(String response) {
            Log.d("APP", response);
        }
    },
    new Response.ErrorListener() {
        @Override
        public void onErrorResponse(VolleyError error) {
            Log.d("APP", error.getLocalizedMessage());
        }
    }
);
Volley.newRequestQueue(context).add(request);
