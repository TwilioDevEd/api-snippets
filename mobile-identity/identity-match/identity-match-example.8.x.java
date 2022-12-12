HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api-sbox.dnlsrv.com/cigateway/id/v2/match"))
    .header("Authorization", "y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No")
    .header("Content-Type", "application/json")
    .header("Accept", "application/json")
    .header("RequestTime", "2022-08-01T09:33:43+00:00")
    .method("POST", HttpRequest.BodyPublishers.ofString("{\"merchantId\":\"02200013919FB4\",\"consentId\":\"9783471AFDB69NH34\",\"consentTimeStamp\":\"2020-08-20T12:00:57+00:00\",\"msisdn\":\"+14444441333\",\"correlationId\":\"984681AFDB698C67\",\"firstName\":\"Michael\",\"lastName\":\"Johnson\",\"address1\":\"3701 Ashwood Dr\",\"address2\":\"Apt 20\",\"city\":\"Council Bluffs\",\"state\":\"IA\",\"postalCode\":\"51501\",\"countryCode\":\"US\",\"nationalId\":\"345678901\",\"dateOfBirth\":\"19800303\"}"))
    .build();
HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
System.out.println(response.body());
