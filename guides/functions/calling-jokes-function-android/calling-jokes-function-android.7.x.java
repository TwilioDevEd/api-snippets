String url = "https://yourdomain.twil.io/jokes";
JsonArrayRequest request = new JsonArrayRequest(url,
        new Response.Listener<JSONArray>() {

            @Override
            public void onResponse(JSONArray response) {
                Log.d("APP", response.toString());
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
